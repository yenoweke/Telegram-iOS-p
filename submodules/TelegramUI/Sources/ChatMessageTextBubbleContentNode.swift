import Foundation
import UIKit
import AsyncDisplayKit
import Display
import TelegramCore
import Postbox
import TextFormat
import UrlEscaping
import TelegramUniversalVideoContent
import TextSelectionNode

private final class CachedChatMessageText {
    let text: String
    let inputEntities: [MessageTextEntity]?
    let entities: [MessageTextEntity]?
    
    init(text: String, inputEntities: [MessageTextEntity]?, entities: [MessageTextEntity]?) {
        self.text = text
        self.inputEntities = inputEntities
        self.entities = entities
    }
    
    func matches(text: String, inputEntities: [MessageTextEntity]?) -> Bool {
        if self.text != text {
            return false
        }
        if let current = self.inputEntities, let inputEntities = inputEntities {
            if current != inputEntities {
                return false
            }
        } else if (self.inputEntities != nil) != (inputEntities != nil) {
            return false
        }
        return true
    }
}

class ChatMessageTextBubbleContentNode: ChatMessageBubbleContentNode {
    private let textNode: TextNode
    private let textAccessibilityOverlayNode: TextAccessibilityOverlayNode
    private let statusNode: ChatMessageDateAndStatusNode
    private var linkHighlightingNode: LinkHighlightingNode?
    private var textSelectionNode: TextSelectionNode?
    
    private var textHighlightingNodes: [LinkHighlightingNode] = []
    
    private var cachedChatMessageText: CachedChatMessageText?
    
    required init() {
        self.textNode = TextNode()
        
        self.statusNode = ChatMessageDateAndStatusNode()
        
        self.textAccessibilityOverlayNode = TextAccessibilityOverlayNode()
        
        super.init()
        
        self.textNode.isUserInteractionEnabled = false
        self.textNode.contentMode = .topLeft
        self.textNode.contentsScale = UIScreenScale
        self.textNode.displaysAsynchronously = false
        self.addSubnode(self.textNode)
        self.addSubnode(self.textAccessibilityOverlayNode)
        
        self.textAccessibilityOverlayNode.openUrl = { [weak self] url in
            self?.item?.controllerInteraction.openUrl(url, false, false, nil)
        }
        
        self.statusNode.reactionSelected = { [weak self] value in
            guard let strongSelf = self, let item = strongSelf.item else {
                return
            }
            item.controllerInteraction.updateMessageReaction(item.message, value)
        }
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func asyncLayoutContent() -> (_ item: ChatMessageBubbleContentItem, _ layoutConstants: ChatMessageItemLayoutConstants, _ preparePosition: ChatMessageBubblePreparePosition, _ messageSelection: Bool?, _ constrainedSize: CGSize) -> (ChatMessageBubbleContentProperties, CGSize?, CGFloat, (CGSize, ChatMessageBubbleContentPosition) -> (CGFloat, (CGFloat) -> (CGSize, (ListViewItemUpdateAnimation, Bool) -> Void))) {
        let textLayout = TextNode.asyncLayout(self.textNode)
        let statusLayout = self.statusNode.asyncLayout()
        
        let currentCachedChatMessageText = self.cachedChatMessageText
        
        return { item, layoutConstants, _, _, _ in
            let contentProperties = ChatMessageBubbleContentProperties(hidesSimpleAuthorHeader: false, headerSpacing: 0.0, hidesBackground: .never, forceFullCorners: false, forceAlignment: .none)
            
            return (contentProperties, nil, CGFloat.greatestFiniteMagnitude, { constrainedSize, position in
                let message = item.message
                
                let incoming: Bool
                if let subject = item.associatedData.subject, case .forwardedMessages = subject {
                    incoming = false
                } else {
                    incoming = item.message.effectivelyIncoming(item.context.account.peerId)
                }
                
                var maxTextWidth = CGFloat.greatestFiniteMagnitude
                for media in item.message.media {
                    if let webpage = media as? TelegramMediaWebpage, case let .Loaded(content) = webpage.content, content.type == "telegram_background" || content.type == "telegram_theme" {
                        maxTextWidth = layoutConstants.wallpapers.maxTextWidth
                        break
                    }
                }
                
                let horizontalInset = layoutConstants.text.bubbleInsets.left + layoutConstants.text.bubbleInsets.right
                let textConstrainedSize = CGSize(width: min(maxTextWidth, constrainedSize.width - horizontalInset), height: constrainedSize.height)
                
                var edited = false
                if item.attributes.updatingMedia != nil {
                    edited = true
                }
                var viewCount: Int?
                var dateReplies = 0
                let dateReactions: [MessageReaction] = mergedMessageReactions(attributes: item.message.attributes)?.reactions ?? []
                
                for attribute in item.message.attributes {
                    if let attribute = attribute as? EditedMessageAttribute {
                        edited = !attribute.isHidden
                    } else if let attribute = attribute as? ViewCountMessageAttribute {
                        viewCount = attribute.count
                    } else if let attribute = attribute as? ReplyThreadMessageAttribute, case .peer = item.chatLocation {
                        if let channel = item.message.peers[item.message.id.peerId] as? TelegramChannel, case .group = channel.info {
                            dateReplies = Int(attribute.count)
                        }
                    }
                }
                
                let dateFormat: MessageTimestampStatusFormat
                if let subject = item.associatedData.subject, case .forwardedMessages = subject {
                    dateFormat = .minimal
                } else {
                    dateFormat = .regular
                }
                let dateText = stringForMessageTimestampStatus(accountPeerId: item.context.account.peerId, message: item.message, dateTimeFormat: item.presentationData.dateTimeFormat, nameDisplayOrder: item.presentationData.nameDisplayOrder, strings: item.presentationData.strings, format: dateFormat)
                
                let statusType: ChatMessageDateAndStatusType?
                var displayStatus = false
                switch position {
                case let .linear(_, neighbor):
                    if case .None = neighbor {
                        displayStatus = true
                    } else if case .Neighbour(true, _, _) = neighbor {
                        displayStatus = true
                    }
                default:
                    break
                }
                if displayStatus {
                    if incoming {
                        statusType = .BubbleIncoming
                    } else {
                        if message.flags.contains(.Failed) {
                            statusType = .BubbleOutgoing(.Failed)
                        } else if (message.flags.isSending && !message.isSentOrAcknowledged) || item.attributes.updatingMedia != nil {
                            statusType = .BubbleOutgoing(.Sending)
                        } else {
                            statusType = .BubbleOutgoing(.Sent(read: item.read))
                        }
                    }
                } else {
                    statusType = nil
                }
                
                let rawText: String
                let attributedText: NSAttributedString
                var messageEntities: [MessageTextEntity]?
                
                var mediaDuration: Double? = nil
                var isSeekableWebMedia = false
                var isUnsupportedMedia = false
                for media in item.message.media {
                    if let file = media as? TelegramMediaFile, let duration = file.duration {
                        mediaDuration = Double(duration)
                    }
                    if let webpage = media as? TelegramMediaWebpage, case let .Loaded(content) = webpage.content, webEmbedType(content: content).supportsSeeking {
                        isSeekableWebMedia = true
                    } else if media is TelegramMediaUnsupported {
                        isUnsupportedMedia = true
                    }
                }
                
                if isUnsupportedMedia {
                    rawText = item.presentationData.strings.Conversation_UnsupportedMediaPlaceholder
                    messageEntities = [MessageTextEntity(range: 0..<rawText.count, type: .Italic)]
                } else {
                    if let updatingMedia = item.attributes.updatingMedia {
                        rawText = updatingMedia.text
                    } else {
                        rawText = item.message.text
                    }
                    
                    for attribute in item.message.attributes {
                        if let attribute = attribute as? TextEntitiesMessageAttribute {
                            messageEntities = attribute.entities
                        } else if mediaDuration == nil, let attribute = attribute as? ReplyMessageAttribute {
                            if let replyMessage = item.message.associatedMessages[attribute.messageId] {
                                for media in replyMessage.media {
                                    if let file = media as? TelegramMediaFile, let duration = file.duration {
                                        mediaDuration = Double(duration)
                                    }
                                    if let webpage = media as? TelegramMediaWebpage, case let .Loaded(content) = webpage.content, webEmbedType(content: content).supportsSeeking {
                                        isSeekableWebMedia = true
                                    }
                                }
                            }
                        }
                    }
                }
                
                var entities: [MessageTextEntity]?
                
                var updatedCachedChatMessageText: CachedChatMessageText?
                if let cached = currentCachedChatMessageText, cached.matches(text: rawText, inputEntities: messageEntities) {
                    entities = cached.entities
                } else {
                    entities = messageEntities
                    
                    if entities == nil && (mediaDuration != nil || isSeekableWebMedia) {
                        entities = []
                    }
                    
                    if let entitiesValue = entities {
                        var enabledTypes: EnabledEntityTypes = .all
                        if mediaDuration != nil || isSeekableWebMedia {
                            enabledTypes.insert(.timecode)
                            if mediaDuration == nil {
                                mediaDuration = 60.0 * 60.0 * 24.0
                            }
                        }
                        if let result = addLocallyGeneratedEntities(rawText, enabledTypes: enabledTypes, entities: entitiesValue, mediaDuration: mediaDuration) {
                            entities = result
                        }
                    } else {
                        var generateEntities = false
                        for media in message.media {
                            if media is TelegramMediaImage || media is TelegramMediaFile {
                                generateEntities = true
                                break
                            }
                        }
                        if message.id.peerId.namespace == Namespaces.Peer.SecretChat {
                           generateEntities = true
                        }
                        if generateEntities {
                            let parsedEntities = generateTextEntities(rawText, enabledTypes: .all)
                            if !parsedEntities.isEmpty {
                                entities = parsedEntities
                            }
                        }
                    }
                    updatedCachedChatMessageText = CachedChatMessageText(text: rawText, inputEntities: messageEntities, entities: entities)
                }
                
                
                let messageTheme = incoming ? item.presentationData.theme.theme.chat.message.incoming : item.presentationData.theme.theme.chat.message.outgoing
                
                let textFont = item.presentationData.messageFont
                
                if let entities = entities {
                    attributedText = stringWithAppliedEntities(rawText, entities: entities, baseColor: messageTheme.primaryTextColor, linkColor: messageTheme.linkTextColor, baseFont: textFont, linkFont: textFont, boldFont: item.presentationData.messageBoldFont, italicFont: item.presentationData.messageItalicFont, boldItalicFont: item.presentationData.messageBoldItalicFont, fixedFont: item.presentationData.messageFixedFont, blockQuoteFont: item.presentationData.messageBlockQuoteFont)
                } else if !rawText.isEmpty {
                    attributedText = NSAttributedString(string: rawText, font: textFont, textColor: messageTheme.primaryTextColor)
                } else {
                    attributedText = NSAttributedString(string: " ", font: textFont, textColor: messageTheme.primaryTextColor)
                }
                
                let cutout: TextNodeCutout? = nil
                
                let textInsets = UIEdgeInsets(top: 2.0, left: 2.0, bottom: 5.0, right: 2.0)
                
                let (textLayout, textApply) = textLayout(TextNodeLayoutArguments(attributedString: attributedText, backgroundColor: nil, maximumNumberOfLines: 0, truncationType: .end, constrainedSize: textConstrainedSize, alignment: .natural, cutout: cutout, insets: textInsets, lineColor: messageTheme.accentControlColor))
                
                var statusSuggestedWidthAndContinue: (CGFloat, (CGFloat) -> (CGSize, (Bool) -> Void))?
                if let statusType = statusType {
                    var isReplyThread = false
                    if case .replyThread = item.chatLocation {
                        isReplyThread = true
                    }
                    
                    statusSuggestedWidthAndContinue = statusLayout(ChatMessageDateAndStatusNode.Arguments(
                        context: item.context,
                        presentationData: item.presentationData,
                        edited: edited,
                        impressionCount: viewCount,
                        dateText: dateText,
                        type: statusType,
                        layoutInput: .trailingContent(contentWidth: textLayout.trailingLineWidth, preferAdditionalInset: false),
                        constrainedSize: textConstrainedSize,
                        availableReactions: item.associatedData.availableReactions,
                        reactions: dateReactions,
                        replyCount: dateReplies,
                        isPinned: item.message.tags.contains(.pinned) && !item.associatedData.isInPinnedListMode && isReplyThread,
                        hasAutoremove: item.message.isSelfExpiring
                    ))
                }
                
                var textFrame = CGRect(origin: CGPoint(x: -textInsets.left, y: -textInsets.top), size: textLayout.size)
                var textFrameWithoutInsets = CGRect(origin: CGPoint(x: textFrame.origin.x + textInsets.left, y: textFrame.origin.y + textInsets.top), size: CGSize(width: textFrame.width - textInsets.left - textInsets.right, height: textFrame.height - textInsets.top - textInsets.bottom))
                
                textFrame = textFrame.offsetBy(dx: layoutConstants.text.bubbleInsets.left, dy: layoutConstants.text.bubbleInsets.top)
                textFrameWithoutInsets = textFrameWithoutInsets.offsetBy(dx: layoutConstants.text.bubbleInsets.left, dy: layoutConstants.text.bubbleInsets.top)

                var suggestedBoundingWidth: CGFloat = textFrameWithoutInsets.width
                if let statusSuggestedWidthAndContinue = statusSuggestedWidthAndContinue {
                    suggestedBoundingWidth = max(suggestedBoundingWidth, statusSuggestedWidthAndContinue.0)
                }
                let sideInsets = layoutConstants.text.bubbleInsets.left + layoutConstants.text.bubbleInsets.right
                suggestedBoundingWidth += sideInsets
                
                return (suggestedBoundingWidth, { boundingWidth in
                    var boundingSize: CGSize
                    
                    let statusSizeAndApply = statusSuggestedWidthAndContinue?.1(boundingWidth - sideInsets)
                    
                    boundingSize = textFrameWithoutInsets.size
                    if let statusSizeAndApply = statusSizeAndApply {
                        boundingSize.height += statusSizeAndApply.0.height
                    }
                    
                    boundingSize.width += layoutConstants.text.bubbleInsets.left + layoutConstants.text.bubbleInsets.right
                    boundingSize.height += layoutConstants.text.bubbleInsets.top + layoutConstants.text.bubbleInsets.bottom
                    
                    return (boundingSize, { [weak self] animation, _ in
                        if let strongSelf = self {
                            strongSelf.item = item
                            if let updatedCachedChatMessageText = updatedCachedChatMessageText {
                                strongSelf.cachedChatMessageText = updatedCachedChatMessageText
                            }
                            
                            let cachedLayout = strongSelf.textNode.cachedLayout
                            
                            if case .System = animation {
                                if let cachedLayout = cachedLayout {
                                    if !cachedLayout.areLinesEqual(to: textLayout) {
                                        if let textContents = strongSelf.textNode.contents {
                                            let fadeNode = ASDisplayNode()
                                            fadeNode.displaysAsynchronously = false
                                            fadeNode.contents = textContents
                                            fadeNode.frame = strongSelf.textNode.frame
                                            fadeNode.isLayerBacked = true
                                            strongSelf.addSubnode(fadeNode)
                                            fadeNode.layer.animateAlpha(from: 1.0, to: 0.0, duration: 0.2, removeOnCompletion: false, completion: { [weak fadeNode] _ in
                                                fadeNode?.removeFromSupernode()
                                            })
                                            strongSelf.textNode.layer.animateAlpha(from: 0.0, to: 1.0, duration: 0.15)
                                        }
                                    }
                                }
                            }
                            
                            strongSelf.textNode.displaysAsynchronously = !item.presentationData.isPreview && !item.presentationData.theme.theme.forceSync
                            let _ = textApply()
                            
                            strongSelf.textNode.frame = textFrame
                            if let textSelectionNode = strongSelf.textSelectionNode {
                                let shouldUpdateLayout = textSelectionNode.frame.size != textFrame.size
                                textSelectionNode.frame = textFrame
                                textSelectionNode.highlightAreaNode.frame = textFrame
                                if shouldUpdateLayout {
                                    textSelectionNode.updateLayout()
                                }
                            }
                            strongSelf.textAccessibilityOverlayNode.frame = textFrame
                            strongSelf.textAccessibilityOverlayNode.cachedLayout = textLayout
                            
                            if let statusSizeAndApply = statusSizeAndApply {
                                strongSelf.statusNode.frame = CGRect(origin: CGPoint(x: textFrameWithoutInsets.minX, y: textFrameWithoutInsets.maxY), size: statusSizeAndApply.0)
                                if strongSelf.statusNode.supernode == nil {
                                    strongSelf.addSubnode(strongSelf.statusNode)
                                    statusSizeAndApply.1(false)
                                } else {
                                    statusSizeAndApply.1(animation.isAnimated)
                                }
                            } else if strongSelf.statusNode.supernode != nil {
                                strongSelf.statusNode.removeFromSupernode()
                            }
                            
                            if let forwardInfo = item.message.forwardInfo, forwardInfo.flags.contains(.isImported) {
                                strongSelf.statusNode.pressed = {
                                    guard let strongSelf = self else {
                                        return
                                    }
                                    item.controllerInteraction.displayImportedMessageTooltip(strongSelf.statusNode)
                                }
                            } else {
                                strongSelf.statusNode.pressed = nil
                            }
                        }
                    })
                })
            })
        }
    }
    
    override func animateInsertion(_ currentTimestamp: Double, duration: Double) {
        self.textNode.layer.animateAlpha(from: 0.0, to: 1.0, duration: 0.2)
        self.statusNode.layer.animateAlpha(from: 0.0, to: 1.0, duration: 0.2)
    }
    
    override func animateAdded(_ currentTimestamp: Double, duration: Double) {
        self.textNode.layer.animateAlpha(from: 0.0, to: 1.0, duration: 0.2)
        self.statusNode.layer.animateAlpha(from: 0.0, to: 1.0, duration: 0.2)
    }
    
    override func animateRemoved(_ currentTimestamp: Double, duration: Double) {
        self.textNode.layer.animateAlpha(from: 1.0, to: 0.0, duration: 0.2, removeOnCompletion: false)
        self.statusNode.layer.animateAlpha(from: 1.0, to: 0.0, duration: 0.2, removeOnCompletion: false)
    }
    
    override func tapActionAtPoint(_ point: CGPoint, gesture: TapLongTapOrDoubleTapGesture, isEstimating: Bool) -> ChatMessageBubbleContentTapAction {
        let textNodeFrame = self.textNode.frame
        if let (index, attributes) = self.textNode.attributesAtPoint(CGPoint(x: point.x - textNodeFrame.minX, y: point.y - textNodeFrame.minY)) {
            if let url = attributes[NSAttributedString.Key(rawValue: TelegramTextAttributes.URL)] as? String {
                var concealed = true
                if let (attributeText, fullText) = self.textNode.attributeSubstring(name: TelegramTextAttributes.URL, index: index) {
                    concealed = !doesUrlMatchText(url: url, text: attributeText, fullText: fullText)
                }
                return .url(url: url, concealed: concealed)
            } else if let peerMention = attributes[NSAttributedString.Key(rawValue: TelegramTextAttributes.PeerMention)] as? TelegramPeerMention {
                return .peerMention(peerMention.peerId, peerMention.mention)
            } else if let peerName = attributes[NSAttributedString.Key(rawValue: TelegramTextAttributes.PeerTextMention)] as? String {
                return .textMention(peerName)
            } else if let botCommand = attributes[NSAttributedString.Key(rawValue: TelegramTextAttributes.BotCommand)] as? String {
                return .botCommand(botCommand)
            } else if let hashtag = attributes[NSAttributedString.Key(rawValue: TelegramTextAttributes.Hashtag)] as? TelegramHashtag {
                return .hashtag(hashtag.peerName, hashtag.hashtag)
            } else if let timecode = attributes[NSAttributedString.Key(rawValue: TelegramTextAttributes.Timecode)] as? TelegramTimecode {
                return .timecode(timecode.time, timecode.text)
            } else if let bankCard = attributes[NSAttributedString.Key(rawValue: TelegramTextAttributes.BankCard)] as? String {
                return .bankCard(bankCard)
            } else if let pre = attributes[NSAttributedString.Key(rawValue: TelegramTextAttributes.Pre)] as? String {
                return .copy(pre)
            } else {
                return .none
            }
        } else {
            if let _ = self.statusNode.hitTest(self.view.convert(point, to: self.statusNode.view), with: nil) {
                return .ignore
            }
            return .none
        }
    }
    
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        if self.statusNode.supernode != nil, let result = self.statusNode.hitTest(self.view.convert(point, to: self.statusNode.view), with: event) {
            return result
        }
        return super.hitTest(point, with: event)
    }
    
    override func updateTouchesAtPoint(_ point: CGPoint?) {
        if let item = self.item {
            var rects: [CGRect]?
            if let point = point {
                let textNodeFrame = self.textNode.frame
                if let (index, attributes) = self.textNode.attributesAtPoint(CGPoint(x: point.x - textNodeFrame.minX, y: point.y - textNodeFrame.minY)) {
                    let possibleNames: [String] = [
                        TelegramTextAttributes.URL,
                        TelegramTextAttributes.PeerMention,
                        TelegramTextAttributes.PeerTextMention,
                        TelegramTextAttributes.BotCommand,
                        TelegramTextAttributes.Hashtag,
                        TelegramTextAttributes.Timecode,
                        TelegramTextAttributes.BankCard
                    ]
                    for name in possibleNames {
                        if let _ = attributes[NSAttributedString.Key(rawValue: name)] {
                            rects = self.textNode.attributeRects(name: name, at: index)
                            break
                        }
                    }
                }
            }
            
            if let rects = rects {
                let linkHighlightingNode: LinkHighlightingNode
                if let current = self.linkHighlightingNode {
                    linkHighlightingNode = current
                } else {
                    linkHighlightingNode = LinkHighlightingNode(color: item.message.effectivelyIncoming(item.context.account.peerId) ? item.presentationData.theme.theme.chat.message.incoming.linkHighlightColor : item.presentationData.theme.theme.chat.message.outgoing.linkHighlightColor)
                    self.linkHighlightingNode = linkHighlightingNode
                    self.insertSubnode(linkHighlightingNode, belowSubnode: self.textNode)
                }
                linkHighlightingNode.frame = self.textNode.frame
                linkHighlightingNode.updateRects(rects)
            } else if let linkHighlightingNode = self.linkHighlightingNode {
                self.linkHighlightingNode = nil
                linkHighlightingNode.layer.animateAlpha(from: 1.0, to: 0.0, duration: 0.18, removeOnCompletion: false, completion: { [weak linkHighlightingNode] _ in
                    linkHighlightingNode?.removeFromSupernode()
                })
            }
        }
    }
    
    override func peekPreviewContent(at point: CGPoint) -> (Message, ChatMessagePeekPreviewContent)? {
        if let item = self.item {
            let textNodeFrame = self.textNode.frame
            if let (index, attributes) = self.textNode.attributesAtPoint(CGPoint(x: point.x - textNodeFrame.minX, y: point.y - textNodeFrame.minY)) {
                if let value = attributes[NSAttributedString.Key(rawValue: TelegramTextAttributes.URL)] as? String {
                    if let rects = self.textNode.attributeRects(name: TelegramTextAttributes.URL, at: index), !rects.isEmpty {
                        var rect = rects[0]
                        for i in 1 ..< rects.count {
                            rect = rect.union(rects[i])
                        }
                        var concealed = true
                        if let (attributeText, fullText) = self.textNode.attributeSubstring(name: TelegramTextAttributes.URL, index: index) {
                            concealed = !doesUrlMatchText(url: value, text: attributeText, fullText: fullText)
                        }
                        return (item.message, .url(self, rect, value, concealed))
                    }
                }
            }
        }
        return nil
    }
    
    override func updateSearchTextHighlightState(text: String?, messages: [MessageIndex]?) {
        guard let item = self.item else {
            return
        }
        let rectsSet: [[CGRect]]
        if let text = text, let messages = messages, !text.isEmpty, messages.contains(item.message.index) {
            rectsSet = self.textNode.textRangesRects(text: text)
        } else {
            rectsSet = []
        }
        for i in 0 ..< rectsSet.count {
            let rects = rectsSet[i]
            let textHighlightNode: LinkHighlightingNode
            if self.textHighlightingNodes.count < i {
                textHighlightNode = self.textHighlightingNodes[i]
            } else {
                textHighlightNode = LinkHighlightingNode(color: item.message.effectivelyIncoming(item.context.account.peerId) ? item.presentationData.theme.theme.chat.message.incoming.textHighlightColor : item.presentationData.theme.theme.chat.message.outgoing.textHighlightColor)
                self.textHighlightingNodes.append(textHighlightNode)
                self.insertSubnode(textHighlightNode, belowSubnode: self.textNode)
            }
            textHighlightNode.frame = self.textNode.frame
            textHighlightNode.updateRects(rects)
        }
        for i in (rectsSet.count ..< self.textHighlightingNodes.count).reversed() {
            self.textHighlightingNodes[i].removeFromSupernode()
            self.textHighlightingNodes.remove(at: i)
        }
    }
    
    override func willUpdateIsExtractedToContextPreview(_ value: Bool) {
        if !value {
            if let textSelectionNode = self.textSelectionNode {
                self.textSelectionNode = nil
                textSelectionNode.highlightAreaNode.layer.animateAlpha(from: 1.0, to: 0.0, duration: 0.2, removeOnCompletion: false)
                textSelectionNode.layer.animateAlpha(from: 1.0, to: 0.0, duration: 0.2, removeOnCompletion: false, completion: { [weak textSelectionNode] _ in
                    textSelectionNode?.highlightAreaNode.removeFromSupernode()
                    textSelectionNode?.removeFromSupernode()
                })
            }
        }
    }
    
    override func updateIsExtractedToContextPreview(_ value: Bool) {
        if value {
            if self.textSelectionNode == nil, let item = self.item, !item.associatedData.isCopyProtectionEnabled, let rootNode = item.controllerInteraction.chatControllerNode() {
                let selectionColor: UIColor
                let knobColor: UIColor
                if item.message.effectivelyIncoming(item.context.account.peerId) {
                    selectionColor = item.presentationData.theme.theme.chat.message.incoming.textSelectionColor
                    knobColor = item.presentationData.theme.theme.chat.message.incoming.textSelectionKnobColor
                } else {
                    selectionColor = item.presentationData.theme.theme.chat.message.outgoing.textSelectionColor
                    knobColor = item.presentationData.theme.theme.chat.message.outgoing.textSelectionKnobColor
                }
                
                let textSelectionNode = TextSelectionNode(theme: TextSelectionTheme(selection: selectionColor, knob: knobColor), strings: item.presentationData.strings, textNode: self.textNode, updateIsActive: { [weak self] value in
                    self?.updateIsTextSelectionActive?(value)
                }, present: { [weak self] c, a in
                    self?.item?.controllerInteraction.presentGlobalOverlayController(c, a)
                }, rootNode: rootNode, performAction: { [weak self] text, action in
                    guard let strongSelf = self, let item = strongSelf.item else {
                        return
                    }
                    item.controllerInteraction.performTextSelectionAction(item.message.stableId, text, action)
                })
                self.textSelectionNode = textSelectionNode
                self.addSubnode(textSelectionNode)
                self.insertSubnode(textSelectionNode.highlightAreaNode, belowSubnode: self.textNode)
                textSelectionNode.frame = self.textNode.frame
                textSelectionNode.highlightAreaNode.frame = self.textNode.frame
            }
        } else if let textSelectionNode = self.textSelectionNode {
            self.textSelectionNode = nil
            self.updateIsTextSelectionActive?(false)
            textSelectionNode.highlightAreaNode.layer.animateAlpha(from: 1.0, to: 0.0, duration: 0.2, removeOnCompletion: false)
            textSelectionNode.layer.animateAlpha(from: 1.0, to: 0.0, duration: 0.2, removeOnCompletion: false, completion: { [weak textSelectionNode] _ in
                textSelectionNode?.highlightAreaNode.removeFromSupernode()
                textSelectionNode?.removeFromSupernode()
            })
        }
    }
    
    override func reactionTargetView(value: String) -> UIView? {
        if !self.statusNode.isHidden {
            return self.statusNode.reactionView(value: value)
        }
        return nil
    }
    
    override func getStatusNode() -> ASDisplayNode? {
        return self.statusNode
    }

    func animateFrom(sourceView: UIView, scrollOffset: CGFloat, widthDifference: CGFloat, transition: CombinedTransition) {
        self.view.addSubview(sourceView)

        sourceView.layer.animateAlpha(from: 1.0, to: 0.0, duration: 0.1, removeOnCompletion: false, completion: { [weak sourceView] _ in
            sourceView?.removeFromSuperview()
        })
        self.textNode.layer.animateAlpha(from: 0.0, to: 1.0, duration: 0.08)

        let offset = CGPoint(
            x: sourceView.frame.minX - (self.textNode.frame.minX - 0.0),
            y: sourceView.frame.minY - (self.textNode.frame.minY - 3.0) - scrollOffset
        )

        transition.vertical.animatePositionAdditive(node: self.textNode, offset: offset)
        transition.updatePosition(layer: sourceView.layer, position: CGPoint(x: sourceView.layer.position.x - offset.x, y: sourceView.layer.position.y - offset.y))

        self.statusNode.layer.animateAlpha(from: 0.0, to: 1.0, duration: 0.25)
        transition.horizontal.animatePositionAdditive(node: self.statusNode, offset: CGPoint(x: -widthDifference, y: 0.0))
    }
}
