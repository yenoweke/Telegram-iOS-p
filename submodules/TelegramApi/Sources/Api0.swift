
fileprivate let parsers: [Int32 : (BufferReader) -> Any?] = {
    var dict: [Int32 : (BufferReader) -> Any?] = [:]
    dict[-1471112230] = { return $0.readInt32() }
    dict[570911930] = { return $0.readInt64() }
    dict[571523412] = { return $0.readDouble() }
    dict[-1255641564] = { return parseString($0) }
    dict[-1240849242] = { return Api.messages.StickerSet.parse_stickerSet($0) }
    dict[1829443076] = { return Api.GroupCall.parse_groupCallPrivate($0) }
    dict[1441699306] = { return Api.GroupCall.parse_groupCall($0) }
    dict[2004925620] = { return Api.GroupCall.parse_groupCallDiscarded($0) }
    dict[-457104426] = { return Api.InputGeoPoint.parse_inputGeoPointEmpty($0) }
    dict[1210199983] = { return Api.InputGeoPoint.parse_inputGeoPoint($0) }
    dict[-784000893] = { return Api.payments.ValidatedRequestedInfo.parse_validatedRequestedInfo($0) }
    dict[461151667] = { return Api.ChatFull.parse_chatFull($0) }
    dict[-281384243] = { return Api.ChatFull.parse_channelFull($0) }
    dict[-1159937629] = { return Api.PollResults.parse_pollResults($0) }
    dict[-925415106] = { return Api.ChatParticipant.parse_chatParticipant($0) }
    dict[-636267638] = { return Api.ChatParticipant.parse_chatParticipantCreator($0) }
    dict[-489233354] = { return Api.ChatParticipant.parse_chatParticipantAdmin($0) }
    dict[1567990072] = { return Api.updates.Difference.parse_differenceEmpty($0) }
    dict[16030880] = { return Api.updates.Difference.parse_difference($0) }
    dict[-1459938943] = { return Api.updates.Difference.parse_differenceSlice($0) }
    dict[1258196845] = { return Api.updates.Difference.parse_differenceTooLong($0) }
    dict[1462101002] = { return Api.CdnConfig.parse_cdnConfig($0) }
    dict[324435594] = { return Api.PageBlock.parse_pageBlockUnsupported($0) }
    dict[1890305021] = { return Api.PageBlock.parse_pageBlockTitle($0) }
    dict[-1879401953] = { return Api.PageBlock.parse_pageBlockSubtitle($0) }
    dict[-1162877472] = { return Api.PageBlock.parse_pageBlockAuthorDate($0) }
    dict[-1076861716] = { return Api.PageBlock.parse_pageBlockHeader($0) }
    dict[-248793375] = { return Api.PageBlock.parse_pageBlockSubheader($0) }
    dict[1182402406] = { return Api.PageBlock.parse_pageBlockParagraph($0) }
    dict[-1066346178] = { return Api.PageBlock.parse_pageBlockPreformatted($0) }
    dict[1216809369] = { return Api.PageBlock.parse_pageBlockFooter($0) }
    dict[-618614392] = { return Api.PageBlock.parse_pageBlockDivider($0) }
    dict[-837994576] = { return Api.PageBlock.parse_pageBlockAnchor($0) }
    dict[641563686] = { return Api.PageBlock.parse_pageBlockBlockquote($0) }
    dict[1329878739] = { return Api.PageBlock.parse_pageBlockPullquote($0) }
    dict[972174080] = { return Api.PageBlock.parse_pageBlockCover($0) }
    dict[-283684427] = { return Api.PageBlock.parse_pageBlockChannel($0) }
    dict[504660880] = { return Api.PageBlock.parse_pageBlockKicker($0) }
    dict[-1085412734] = { return Api.PageBlock.parse_pageBlockTable($0) }
    dict[391759200] = { return Api.PageBlock.parse_pageBlockPhoto($0) }
    dict[2089805750] = { return Api.PageBlock.parse_pageBlockVideo($0) }
    dict[-2143067670] = { return Api.PageBlock.parse_pageBlockAudio($0) }
    dict[-1468953147] = { return Api.PageBlock.parse_pageBlockEmbed($0) }
    dict[-229005301] = { return Api.PageBlock.parse_pageBlockEmbedPost($0) }
    dict[1705048653] = { return Api.PageBlock.parse_pageBlockCollage($0) }
    dict[52401552] = { return Api.PageBlock.parse_pageBlockSlideshow($0) }
    dict[-454524911] = { return Api.PageBlock.parse_pageBlockList($0) }
    dict[-1702174239] = { return Api.PageBlock.parse_pageBlockOrderedList($0) }
    dict[1987480557] = { return Api.PageBlock.parse_pageBlockDetails($0) }
    dict[370236054] = { return Api.PageBlock.parse_pageBlockRelatedArticles($0) }
    dict[-1538310410] = { return Api.PageBlock.parse_pageBlockMap($0) }
    dict[-614138572] = { return Api.account.TmpPassword.parse_tmpPassword($0) }
    dict[-2103600678] = { return Api.SecureRequiredType.parse_secureRequiredType($0) }
    dict[41187252] = { return Api.SecureRequiredType.parse_secureRequiredTypeOneOf($0) }
    dict[1654593920] = { return Api.auth.LoginToken.parse_loginToken($0) }
    dict[110008598] = { return Api.auth.LoginToken.parse_loginTokenMigrateTo($0) }
    dict[957176926] = { return Api.auth.LoginToken.parse_loginTokenSuccess($0) }
    dict[1064139624] = { return Api.JSONValue.parse_jsonNull($0) }
    dict[-952869270] = { return Api.JSONValue.parse_jsonBool($0) }
    dict[736157604] = { return Api.JSONValue.parse_jsonNumber($0) }
    dict[-1222740358] = { return Api.JSONValue.parse_jsonString($0) }
    dict[-146520221] = { return Api.JSONValue.parse_jsonArray($0) }
    dict[-1715350371] = { return Api.JSONValue.parse_jsonObject($0) }
    dict[590459437] = { return Api.Photo.parse_photoEmpty($0) }
    dict[-82216347] = { return Api.Photo.parse_photo($0) }
    dict[-1683826688] = { return Api.Chat.parse_chatEmpty($0) }
    dict[120753115] = { return Api.Chat.parse_chatForbidden($0) }
    dict[681420594] = { return Api.Chat.parse_channelForbidden($0) }
    dict[1004149726] = { return Api.Chat.parse_chat($0) }
    dict[-753232354] = { return Api.Chat.parse_channel($0) }
    dict[1202287072] = { return Api.StatsURL.parse_statsURL($0) }
    dict[1516793212] = { return Api.ChatInvite.parse_chatInviteAlready($0) }
    dict[-540871282] = { return Api.ChatInvite.parse_chatInvite($0) }
    dict[1634294960] = { return Api.ChatInvite.parse_chatInvitePeek($0) }
    dict[-532532493] = { return Api.AutoDownloadSettings.parse_autoDownloadSettings($0) }
    dict[1678812626] = { return Api.StickerSetCovered.parse_stickerSetCovered($0) }
    dict[872932635] = { return Api.StickerSetCovered.parse_stickerSetMultiCovered($0) }
    dict[1189204285] = { return Api.RecentMeUrl.parse_recentMeUrlUnknown($0) }
    dict[-1917045962] = { return Api.RecentMeUrl.parse_recentMeUrlUser($0) }
    dict[-1608834311] = { return Api.RecentMeUrl.parse_recentMeUrlChat($0) }
    dict[-347535331] = { return Api.RecentMeUrl.parse_recentMeUrlChatInvite($0) }
    dict[-1140172836] = { return Api.RecentMeUrl.parse_recentMeUrlStickerSet($0) }
    dict[-797791052] = { return Api.RestrictionReason.parse_restrictionReason($0) }
    dict[-177282392] = { return Api.channels.ChannelParticipants.parse_channelParticipants($0) }
    dict[-266911767] = { return Api.channels.ChannelParticipants.parse_channelParticipantsNotModified($0) }
    dict[-599948721] = { return Api.RichText.parse_textEmpty($0) }
    dict[1950782688] = { return Api.RichText.parse_textPlain($0) }
    dict[1730456516] = { return Api.RichText.parse_textBold($0) }
    dict[-653089380] = { return Api.RichText.parse_textItalic($0) }
    dict[-1054465340] = { return Api.RichText.parse_textUnderline($0) }
    dict[-1678197867] = { return Api.RichText.parse_textStrike($0) }
    dict[1816074681] = { return Api.RichText.parse_textFixed($0) }
    dict[1009288385] = { return Api.RichText.parse_textUrl($0) }
    dict[-564523562] = { return Api.RichText.parse_textEmail($0) }
    dict[2120376535] = { return Api.RichText.parse_textConcat($0) }
    dict[-311786236] = { return Api.RichText.parse_textSubscript($0) }
    dict[-939827711] = { return Api.RichText.parse_textSuperscript($0) }
    dict[55281185] = { return Api.RichText.parse_textMarked($0) }
    dict[483104362] = { return Api.RichText.parse_textPhone($0) }
    dict[136105807] = { return Api.RichText.parse_textImage($0) }
    dict[894777186] = { return Api.RichText.parse_textAnchor($0) }
    dict[-302941166] = { return Api.UserFull.parse_userFull($0) }
    dict[-292807034] = { return Api.InputChannel.parse_inputChannelEmpty($0) }
    dict[-1343524562] = { return Api.InputChannel.parse_inputChannel($0) }
    dict[414687501] = { return Api.DcOption.parse_dcOption($0) }
    dict[997055186] = { return Api.PollAnswerVoters.parse_pollAnswerVoters($0) }
    dict[-1705233435] = { return Api.account.PasswordSettings.parse_passwordSettings($0) }
    dict[-288727837] = { return Api.LangPackLanguage.parse_langPackLanguage($0) }
    dict[-399391402] = { return Api.VideoSize.parse_videoSize($0) }
    dict[-1000708810] = { return Api.help.AppUpdate.parse_noAppUpdate($0) }
    dict[497489295] = { return Api.help.AppUpdate.parse_appUpdate($0) }
    dict[-209337866] = { return Api.LangPackDifference.parse_langPackDifference($0) }
    dict[84438264] = { return Api.WallPaperSettings.parse_wallPaperSettings($0) }
    dict[-1519029347] = { return Api.EmojiURL.parse_emojiURL($0) }
    dict[1611985938] = { return Api.StatsGroupTopAdmin.parse_statsGroupTopAdmin($0) }
    dict[-791039645] = { return Api.channels.ChannelParticipant.parse_channelParticipant($0) }
    dict[-1736378792] = { return Api.InputCheckPasswordSRP.parse_inputCheckPasswordEmpty($0) }
    dict[-763367294] = { return Api.InputCheckPasswordSRP.parse_inputCheckPasswordSRP($0) }
    dict[-1432995067] = { return Api.storage.FileType.parse_fileUnknown($0) }
    dict[1086091090] = { return Api.storage.FileType.parse_filePartial($0) }
    dict[8322574] = { return Api.storage.FileType.parse_fileJpeg($0) }
    dict[-891180321] = { return Api.storage.FileType.parse_fileGif($0) }
    dict[172975040] = { return Api.storage.FileType.parse_filePng($0) }
    dict[-1373745011] = { return Api.storage.FileType.parse_filePdf($0) }
    dict[1384777335] = { return Api.storage.FileType.parse_fileMp3($0) }
    dict[1258941372] = { return Api.storage.FileType.parse_fileMov($0) }
    dict[-1278304028] = { return Api.storage.FileType.parse_fileMp4($0) }
    dict[276907596] = { return Api.storage.FileType.parse_fileWebp($0) }
    dict[1338747336] = { return Api.messages.ArchivedStickers.parse_archivedStickers($0) }
    dict[406307684] = { return Api.InputEncryptedFile.parse_inputEncryptedFileEmpty($0) }
    dict[1690108678] = { return Api.InputEncryptedFile.parse_inputEncryptedFileUploaded($0) }
    dict[1511503333] = { return Api.InputEncryptedFile.parse_inputEncryptedFile($0) }
    dict[767652808] = { return Api.InputEncryptedFile.parse_inputEncryptedFileBigUploaded($0) }
    dict[-1456996667] = { return Api.messages.InactiveChats.parse_inactiveChats($0) }
    dict[-1985949076] = { return Api.GroupCallParticipant.parse_groupCallParticipant($0) }
    dict[1443858741] = { return Api.messages.SentEncryptedMessage.parse_sentEncryptedMessage($0) }
    dict[-1802240206] = { return Api.messages.SentEncryptedMessage.parse_sentEncryptedFile($0) }
    dict[1571494644] = { return Api.ExportedMessageLink.parse_exportedMessageLink($0) }
    dict[-855308010] = { return Api.auth.Authorization.parse_authorization($0) }
    dict[1148485274] = { return Api.auth.Authorization.parse_authorizationSignUpRequired($0) }
    dict[-181407105] = { return Api.InputFile.parse_inputFile($0) }
    dict[-95482955] = { return Api.InputFile.parse_inputFileBig($0) }
    dict[-1649296275] = { return Api.Peer.parse_peerUser($0) }
    dict[-1160714821] = { return Api.Peer.parse_peerChat($0) }
    dict[-1109531342] = { return Api.Peer.parse_peerChannel($0) }
    dict[-1868808300] = { return Api.PaymentRequestedInfo.parse_paymentRequestedInfo($0) }
    dict[164646985] = { return Api.UserStatus.parse_userStatusEmpty($0) }
    dict[-306628279] = { return Api.UserStatus.parse_userStatusOnline($0) }
    dict[9203775] = { return Api.UserStatus.parse_userStatusOffline($0) }
    dict[-496024847] = { return Api.UserStatus.parse_userStatusRecently($0) }
    dict[129960444] = { return Api.UserStatus.parse_userStatusLastWeek($0) }
    dict[2011940674] = { return Api.UserStatus.parse_userStatusLastMonth($0) }
    dict[-11252123] = { return Api.Folder.parse_folder($0) }
    dict[739712882] = { return Api.Dialog.parse_dialog($0) }
    dict[1908216652] = { return Api.Dialog.parse_dialogFolder($0) }
    dict[381645902] = { return Api.SendMessageAction.parse_sendMessageTypingAction($0) }
    dict[-44119819] = { return Api.SendMessageAction.parse_sendMessageCancelAction($0) }
    dict[-1584933265] = { return Api.SendMessageAction.parse_sendMessageRecordVideoAction($0) }
    dict[-378127636] = { return Api.SendMessageAction.parse_sendMessageUploadVideoAction($0) }
    dict[-718310409] = { return Api.SendMessageAction.parse_sendMessageRecordAudioAction($0) }
    dict[-212740181] = { return Api.SendMessageAction.parse_sendMessageUploadAudioAction($0) }
    dict[-774682074] = { return Api.SendMessageAction.parse_sendMessageUploadPhotoAction($0) }
    dict[-1441998364] = { return Api.SendMessageAction.parse_sendMessageUploadDocumentAction($0) }
    dict[393186209] = { return Api.SendMessageAction.parse_sendMessageGeoLocationAction($0) }
    dict[1653390447] = { return Api.SendMessageAction.parse_sendMessageChooseContactAction($0) }
    dict[-580219064] = { return Api.SendMessageAction.parse_sendMessageGamePlayAction($0) }
    dict[-1997373508] = { return Api.SendMessageAction.parse_sendMessageRecordRoundAction($0) }
    dict[608050278] = { return Api.SendMessageAction.parse_sendMessageUploadRoundAction($0) }
    dict[-1137792208] = { return Api.PrivacyKey.parse_privacyKeyStatusTimestamp($0) }
    dict[1343122938] = { return Api.PrivacyKey.parse_privacyKeyChatInvite($0) }
    dict[1030105979] = { return Api.PrivacyKey.parse_privacyKeyPhoneCall($0) }
    dict[961092808] = { return Api.PrivacyKey.parse_privacyKeyPhoneP2P($0) }
    dict[1777096355] = { return Api.PrivacyKey.parse_privacyKeyForwards($0) }
    dict[-1777000467] = { return Api.PrivacyKey.parse_privacyKeyProfilePhoto($0) }
    dict[-778378131] = { return Api.PrivacyKey.parse_privacyKeyPhoneNumber($0) }
    dict[1124062251] = { return Api.PrivacyKey.parse_privacyKeyAddedByPhone($0) }
    dict[522914557] = { return Api.Update.parse_updateNewMessage($0) }
    dict[1318109142] = { return Api.Update.parse_updateMessageID($0) }
    dict[-1576161051] = { return Api.Update.parse_updateDeleteMessages($0) }
    dict[1548249383] = { return Api.Update.parse_updateUserTyping($0) }
    dict[-1704596961] = { return Api.Update.parse_updateChatUserTyping($0) }
    dict[125178264] = { return Api.Update.parse_updateChatParticipants($0) }
    dict[469489699] = { return Api.Update.parse_updateUserStatus($0) }
    dict[-1489818765] = { return Api.Update.parse_updateUserName($0) }
    dict[-1791935732] = { return Api.Update.parse_updateUserPhoto($0) }
    dict[314359194] = { return Api.Update.parse_updateNewEncryptedMessage($0) }
    dict[386986326] = { return Api.Update.parse_updateEncryptedChatTyping($0) }
    dict[-1264392051] = { return Api.Update.parse_updateEncryption($0) }
    dict[956179895] = { return Api.Update.parse_updateEncryptedMessagesRead($0) }
    dict[-364179876] = { return Api.Update.parse_updateChatParticipantAdd($0) }
    dict[1851755554] = { return Api.Update.parse_updateChatParticipantDelete($0) }
    dict[-1906403213] = { return Api.Update.parse_updateDcOptions($0) }
    dict[-1094555409] = { return Api.Update.parse_updateNotifySettings($0) }
    dict[-337352679] = { return Api.Update.parse_updateServiceNotification($0) }
    dict[-298113238] = { return Api.Update.parse_updatePrivacy($0) }
    dict[314130811] = { return Api.Update.parse_updateUserPhone($0) }
    dict[791617983] = { return Api.Update.parse_updateReadHistoryOutbox($0) }
    dict[2139689491] = { return Api.Update.parse_updateWebPage($0) }
    dict[1757493555] = { return Api.Update.parse_updateReadMessagesContents($0) }
    dict[-352032773] = { return Api.Update.parse_updateChannelTooLong($0) }
    dict[-1227598250] = { return Api.Update.parse_updateChannel($0) }
    dict[1656358105] = { return Api.Update.parse_updateNewChannelMessage($0) }
    dict[-1015733815] = { return Api.Update.parse_updateDeleteChannelMessages($0) }
    dict[-1734268085] = { return Api.Update.parse_updateChannelMessageViews($0) }
    dict[-1232070311] = { return Api.Update.parse_updateChatParticipantAdmin($0) }
    dict[1753886890] = { return Api.Update.parse_updateNewStickerSet($0) }
    dict[196268545] = { return Api.Update.parse_updateStickerSetsOrder($0) }
    dict[1135492588] = { return Api.Update.parse_updateStickerSets($0) }
    dict[-1821035490] = { return Api.Update.parse_updateSavedGifs($0) }
    dict[1417832080] = { return Api.Update.parse_updateBotInlineQuery($0) }
    dict[239663460] = { return Api.Update.parse_updateBotInlineSend($0) }
    dict[457133559] = { return Api.Update.parse_updateEditChannelMessage($0) }
    dict[-415938591] = { return Api.Update.parse_updateBotCallbackQuery($0) }
    dict[-469536605] = { return Api.Update.parse_updateEditMessage($0) }
    dict[-103646630] = { return Api.Update.parse_updateInlineBotCallbackQuery($0) }
    dict[634833351] = { return Api.Update.parse_updateReadChannelOutbox($0) }
    dict[-299124375] = { return Api.Update.parse_updateDraftMessage($0) }
    dict[1461528386] = { return Api.Update.parse_updateReadFeaturedStickers($0) }
    dict[-1706939360] = { return Api.Update.parse_updateRecentStickers($0) }
    dict[-1574314746] = { return Api.Update.parse_updateConfig($0) }
    dict[861169551] = { return Api.Update.parse_updatePtsChanged($0) }
    dict[1081547008] = { return Api.Update.parse_updateChannelWebPage($0) }
    dict[-2095595325] = { return Api.Update.parse_updateBotWebhookJSON($0) }
    dict[-1684914010] = { return Api.Update.parse_updateBotWebhookJSONQuery($0) }
    dict[-523384512] = { return Api.Update.parse_updateBotShippingQuery($0) }
    dict[1563376297] = { return Api.Update.parse_updateBotPrecheckoutQuery($0) }
    dict[-1425052898] = { return Api.Update.parse_updatePhoneCall($0) }
    dict[1442983757] = { return Api.Update.parse_updateLangPack($0) }
    dict[-451831443] = { return Api.Update.parse_updateFavedStickers($0) }
    dict[-1987495099] = { return Api.Update.parse_updateChannelReadMessagesContents($0) }
    dict[1887741886] = { return Api.Update.parse_updateContactsReset($0) }
    dict[1893427255] = { return Api.Update.parse_updateChannelAvailableMessages($0) }
    dict[-513517117] = { return Api.Update.parse_updateDialogUnreadMark($0) }
    dict[1180041828] = { return Api.Update.parse_updateLangPackTooLong($0) }
    dict[-1398708869] = { return Api.Update.parse_updateMessagePoll($0) }
    dict[1421875280] = { return Api.Update.parse_updateChatDefaultBannedRights($0) }
    dict[422972864] = { return Api.Update.parse_updateFolderPeers($0) }
    dict[1852826908] = { return Api.Update.parse_updateDialogPinned($0) }
    dict[-99664734] = { return Api.Update.parse_updatePinnedDialogs($0) }
    dict[856380452] = { return Api.Update.parse_updateReadChannelInbox($0) }
    dict[-1667805217] = { return Api.Update.parse_updateReadHistoryInbox($0) }
    dict[1786671974] = { return Api.Update.parse_updatePeerSettings($0) }
    dict[-1263546448] = { return Api.Update.parse_updatePeerLocated($0) }
    dict[967122427] = { return Api.Update.parse_updateNewScheduledMessage($0) }
    dict[-1870238482] = { return Api.Update.parse_updateDeleteScheduledMessages($0) }
    dict[-2112423005] = { return Api.Update.parse_updateTheme($0) }
    dict[-2027964103] = { return Api.Update.parse_updateGeoLiveViewed($0) }
    dict[1448076945] = { return Api.Update.parse_updateLoginToken($0) }
    dict[1123585836] = { return Api.Update.parse_updateMessagePollVote($0) }
    dict[654302845] = { return Api.Update.parse_updateDialogFilter($0) }
    dict[-1512627963] = { return Api.Update.parse_updateDialogFilterOrder($0) }
    dict[889491791] = { return Api.Update.parse_updateDialogFilters($0) }
    dict[643940105] = { return Api.Update.parse_updatePhoneCallSignalingData($0) }
    dict[1708307556] = { return Api.Update.parse_updateChannelParticipant($0) }
    dict[1854571743] = { return Api.Update.parse_updateChannelMessageForwards($0) }
    dict[482860628] = { return Api.Update.parse_updateReadChannelDiscussionInbox($0) }
    dict[1178116716] = { return Api.Update.parse_updateReadChannelDiscussionOutbox($0) }
    dict[610945826] = { return Api.Update.parse_updatePeerBlocked($0) }
    dict[-13975905] = { return Api.Update.parse_updateChannelUserTyping($0) }
    dict[-309990731] = { return Api.Update.parse_updatePinnedMessages($0) }
    dict[-2054649973] = { return Api.Update.parse_updatePinnedChannelMessages($0) }
    dict[-219423922] = { return Api.Update.parse_updateGroupCallParticipants($0) }
    dict[-2046916883] = { return Api.Update.parse_updateGroupCall($0) }
    dict[136574537] = { return Api.messages.VotesList.parse_votesList($0) }
    dict[1558266229] = { return Api.PopularContact.parse_popularContact($0) }
    dict[-373643672] = { return Api.FolderPeer.parse_folderPeer($0) }
    dict[367766557] = { return Api.ChannelParticipant.parse_channelParticipant($0) }
    dict[-1557620115] = { return Api.ChannelParticipant.parse_channelParticipantSelf($0) }
    dict[470789295] = { return Api.ChannelParticipant.parse_channelParticipantBanned($0) }
    dict[-859915345] = { return Api.ChannelParticipant.parse_channelParticipantAdmin($0) }
    dict[1149094475] = { return Api.ChannelParticipant.parse_channelParticipantCreator($0) }
    dict[-1010402965] = { return Api.ChannelParticipant.parse_channelParticipantLeft($0) }
    dict[-1567730343] = { return Api.MessageUserVote.parse_messageUserVote($0) }
    dict[909603888] = { return Api.MessageUserVote.parse_messageUserVoteInputOption($0) }
    dict[244310238] = { return Api.MessageUserVote.parse_messageUserVoteMultiple($0) }
    dict[182326673] = { return Api.contacts.Blocked.parse_blocked($0) }
    dict[-513392236] = { return Api.contacts.Blocked.parse_blockedSlice($0) }
    dict[-55902537] = { return Api.InputDialogPeer.parse_inputDialogPeer($0) }
    dict[1684014375] = { return Api.InputDialogPeer.parse_inputDialogPeerFolder($0) }
    dict[-994444869] = { return Api.Error.parse_error($0) }
    dict[-1560655744] = { return Api.KeyboardButton.parse_keyboardButton($0) }
    dict[629866245] = { return Api.KeyboardButton.parse_keyboardButtonUrl($0) }
    dict[-1318425559] = { return Api.KeyboardButton.parse_keyboardButtonRequestPhone($0) }
    dict[-59151553] = { return Api.KeyboardButton.parse_keyboardButtonRequestGeoLocation($0) }
    dict[90744648] = { return Api.KeyboardButton.parse_keyboardButtonSwitchInline($0) }
    dict[1358175439] = { return Api.KeyboardButton.parse_keyboardButtonGame($0) }
    dict[-1344716869] = { return Api.KeyboardButton.parse_keyboardButtonBuy($0) }
    dict[280464681] = { return Api.KeyboardButton.parse_keyboardButtonUrlAuth($0) }
    dict[-802258988] = { return Api.KeyboardButton.parse_inputKeyboardButtonUrlAuth($0) }
    dict[-1144565411] = { return Api.KeyboardButton.parse_keyboardButtonRequestPoll($0) }
    dict[901503851] = { return Api.KeyboardButton.parse_keyboardButtonCallback($0) }
    dict[-748155807] = { return Api.ContactStatus.parse_contactStatus($0) }
    dict[1679398724] = { return Api.SecureFile.parse_secureFileEmpty($0) }
    dict[-534283678] = { return Api.SecureFile.parse_secureFile($0) }
    dict[-199313886] = { return Api.account.Themes.parse_themesNotModified($0) }
    dict[2137482273] = { return Api.account.Themes.parse_themes($0) }
    dict[236446268] = { return Api.PhotoSize.parse_photoSizeEmpty($0) }
    dict[2009052699] = { return Api.PhotoSize.parse_photoSize($0) }
    dict[-374917894] = { return Api.PhotoSize.parse_photoCachedSize($0) }
    dict[-525288402] = { return Api.PhotoSize.parse_photoStrippedSize($0) }
    dict[1520986705] = { return Api.PhotoSize.parse_photoSizeProgressive($0) }
    dict[-668906175] = { return Api.PhotoSize.parse_photoPathSize($0) }
    dict[-244016606] = { return Api.messages.Stickers.parse_stickersNotModified($0) }
    dict[-463889475] = { return Api.messages.Stickers.parse_stickers($0) }
    dict[-1096616924] = { return Api.GlobalPrivacySettings.parse_globalPrivacySettings($0) }
    dict[1008755359] = { return Api.InlineBotSwitchPM.parse_inlineBotSwitchPM($0) }
    dict[223655517] = { return Api.messages.FoundStickerSets.parse_foundStickerSetsNotModified($0) }
    dict[1359533640] = { return Api.messages.FoundStickerSets.parse_foundStickerSets($0) }
    dict[471437699] = { return Api.account.WallPapers.parse_wallPapersNotModified($0) }
    dict[1881892265] = { return Api.account.WallPapers.parse_wallPapers($0) }
    dict[1012306921] = { return Api.InputTheme.parse_inputTheme($0) }
    dict[-175567375] = { return Api.InputTheme.parse_inputThemeSlug($0) }
    dict[1158290442] = { return Api.messages.FoundGifs.parse_foundGifs($0) }
    dict[-1132476723] = { return Api.FileLocation.parse_fileLocationToBeDeprecated($0) }
    dict[-2032041631] = { return Api.Poll.parse_poll($0) }
    dict[423314455] = { return Api.InputNotifyPeer.parse_inputNotifyUsers($0) }
    dict[1251338318] = { return Api.InputNotifyPeer.parse_inputNotifyChats($0) }
    dict[-1311015810] = { return Api.InputNotifyPeer.parse_inputNotifyBroadcasts($0) }
    dict[-1195615476] = { return Api.InputNotifyPeer.parse_inputNotifyPeer($0) }
    dict[-317144808] = { return Api.EncryptedMessage.parse_encryptedMessage($0) }
    dict[594758406] = { return Api.EncryptedMessage.parse_encryptedMessageService($0) }
    dict[-566281095] = { return Api.ChannelParticipantsFilter.parse_channelParticipantsRecent($0) }
    dict[-1268741783] = { return Api.ChannelParticipantsFilter.parse_channelParticipantsAdmins($0) }
    dict[-1328445861] = { return Api.ChannelParticipantsFilter.parse_channelParticipantsBots($0) }
    dict[338142689] = { return Api.ChannelParticipantsFilter.parse_channelParticipantsBanned($0) }
    dict[106343499] = { return Api.ChannelParticipantsFilter.parse_channelParticipantsSearch($0) }
    dict[-1548400251] = { return Api.ChannelParticipantsFilter.parse_channelParticipantsKicked($0) }
    dict[-1150621555] = { return Api.ChannelParticipantsFilter.parse_channelParticipantsContacts($0) }
    dict[-531931925] = { return Api.ChannelParticipantsFilter.parse_channelParticipantsMentions($0) }
    dict[-350980120] = { return Api.WebPage.parse_webPageEmpty($0) }
    dict[-981018084] = { return Api.WebPage.parse_webPagePending($0) }
    dict[-392411726] = { return Api.WebPage.parse_webPage($0) }
    dict[1930545681] = { return Api.WebPage.parse_webPageNotModified($0) }
    dict[1036876423] = { return Api.InputBotInlineMessage.parse_inputBotInlineMessageText($0) }
    dict[1262639204] = { return Api.InputBotInlineMessage.parse_inputBotInlineMessageGame($0) }
    dict[864077702] = { return Api.InputBotInlineMessage.parse_inputBotInlineMessageMediaAuto($0) }
    dict[1098628881] = { return Api.InputBotInlineMessage.parse_inputBotInlineMessageMediaVenue($0) }
    dict[-1494368259] = { return Api.InputBotInlineMessage.parse_inputBotInlineMessageMediaContact($0) }
    dict[-1768777083] = { return Api.InputBotInlineMessage.parse_inputBotInlineMessageMediaGeo($0) }
    dict[2002815875] = { return Api.KeyboardButtonRow.parse_keyboardButtonRow($0) }
    dict[-290164953] = { return Api.StickerSet.parse_stickerSet($0) }
    dict[354925740] = { return Api.SecureSecretSettings.parse_secureSecretSettings($0) }
    dict[539045032] = { return Api.photos.Photo.parse_photo($0) }
    dict[-208488460] = { return Api.InputContact.parse_inputPhoneContact($0) }
    dict[-1419371685] = { return Api.TopPeerCategory.parse_topPeerCategoryBotsPM($0) }
    dict[344356834] = { return Api.TopPeerCategory.parse_topPeerCategoryBotsInline($0) }
    dict[104314861] = { return Api.TopPeerCategory.parse_topPeerCategoryCorrespondents($0) }
    dict[-1122524854] = { return Api.TopPeerCategory.parse_topPeerCategoryGroups($0) }
    dict[371037736] = { return Api.TopPeerCategory.parse_topPeerCategoryChannels($0) }
    dict[511092620] = { return Api.TopPeerCategory.parse_topPeerCategoryPhoneCalls($0) }
    dict[-1472172887] = { return Api.TopPeerCategory.parse_topPeerCategoryForwardUsers($0) }
    dict[-68239120] = { return Api.TopPeerCategory.parse_topPeerCategoryForwardChats($0) }
    dict[-1219778094] = { return Api.contacts.Contacts.parse_contactsNotModified($0) }
    dict[-353862078] = { return Api.contacts.Contacts.parse_contacts($0) }
    dict[-1798033689] = { return Api.ChannelMessagesFilter.parse_channelMessagesFilterEmpty($0) }
    dict[-847783593] = { return Api.ChannelMessagesFilter.parse_channelMessagesFilter($0) }
    dict[2004110666] = { return Api.DialogFilterSuggested.parse_dialogFilterSuggested($0) }
    dict[326715557] = { return Api.auth.PasswordRecovery.parse_passwordRecovery($0) }
    dict[-1803769784] = { return Api.messages.BotResults.parse_botResults($0) }
    dict[1928391342] = { return Api.InputDocument.parse_inputDocumentEmpty($0) }
    dict[448771445] = { return Api.InputDocument.parse_inputDocument($0) }
    dict[1823064809] = { return Api.PollAnswer.parse_pollAnswer($0) }
    dict[2131196633] = { return Api.contacts.ResolvedPeer.parse_resolvedPeer($0) }
    dict[-1964327229] = { return Api.SecureData.parse_secureData($0) }
    dict[-1771768449] = { return Api.InputMedia.parse_inputMediaEmpty($0) }
    dict[-104578748] = { return Api.InputMedia.parse_inputMediaGeoPoint($0) }
    dict[1212395773] = { return Api.InputMedia.parse_inputMediaGifExternal($0) }
    dict[-750828557] = { return Api.InputMedia.parse_inputMediaGame($0) }
    dict[-1052959727] = { return Api.InputMedia.parse_inputMediaVenue($0) }
    dict[-186607933] = { return Api.InputMedia.parse_inputMediaInvoice($0) }
    dict[505969924] = { return Api.InputMedia.parse_inputMediaUploadedPhoto($0) }
    dict[1530447553] = { return Api.InputMedia.parse_inputMediaUploadedDocument($0) }
    dict[-1279654347] = { return Api.InputMedia.parse_inputMediaPhoto($0) }
    dict[598418386] = { return Api.InputMedia.parse_inputMediaDocument($0) }
    dict[-440664550] = { return Api.InputMedia.parse_inputMediaPhotoExternal($0) }
    dict[-78455655] = { return Api.InputMedia.parse_inputMediaDocumentExternal($0) }
    dict[-122978821] = { return Api.InputMedia.parse_inputMediaContact($0) }
    dict[261416433] = { return Api.InputMedia.parse_inputMediaPoll($0) }
    dict[-428884101] = { return Api.InputMedia.parse_inputMediaDice($0) }
    dict[-1759532989] = { return Api.InputMedia.parse_inputMediaGeoLive($0) }
    dict[2134579434] = { return Api.InputPeer.parse_inputPeerEmpty($0) }
    dict[2107670217] = { return Api.InputPeer.parse_inputPeerSelf($0) }
    dict[396093539] = { return Api.InputPeer.parse_inputPeerChat($0) }
    dict[2072935910] = { return Api.InputPeer.parse_inputPeerUser($0) }
    dict[548253432] = { return Api.InputPeer.parse_inputPeerChannel($0) }
    dict[568808380] = { return Api.upload.WebFile.parse_webFile($0) }
    dict[-116274796] = { return Api.Contact.parse_contact($0) }
    dict[-1078332329] = { return Api.help.PassportConfig.parse_passportConfigNotModified($0) }
    dict[-1600596305] = { return Api.help.PassportConfig.parse_passportConfig($0) }
    dict[1648543603] = { return Api.FileHash.parse_fileHash($0) }
    dict[400266251] = { return Api.BotInlineResult.parse_botInlineMediaResult($0) }
    dict[295067450] = { return Api.BotInlineResult.parse_botInlineResult($0) }
    dict[911761060] = { return Api.messages.BotCallbackAnswer.parse_botCallbackAnswer($0) }
    dict[1314881805] = { return Api.payments.PaymentResult.parse_paymentResult($0) }
    dict[-666824391] = { return Api.payments.PaymentResult.parse_paymentVerificationNeeded($0) }
    dict[1694474197] = { return Api.messages.Chats.parse_chats($0) }
    dict[-1663561404] = { return Api.messages.Chats.parse_chatsSlice($0) }
    dict[-659913713] = { return Api.InputGroupCall.parse_inputGroupCall($0) }
    dict[482797855] = { return Api.InputSingleMedia.parse_inputSingleMedia($0) }
    dict[1163625789] = { return Api.MessageViews.parse_messageViews($0) }
    dict[218751099] = { return Api.InputPrivacyRule.parse_inputPrivacyValueAllowContacts($0) }
    dict[407582158] = { return Api.InputPrivacyRule.parse_inputPrivacyValueAllowAll($0) }
    dict[320652927] = { return Api.InputPrivacyRule.parse_inputPrivacyValueAllowUsers($0) }
    dict[195371015] = { return Api.InputPrivacyRule.parse_inputPrivacyValueDisallowContacts($0) }
    dict[-697604407] = { return Api.InputPrivacyRule.parse_inputPrivacyValueDisallowAll($0) }
    dict[-1877932953] = { return Api.InputPrivacyRule.parse_inputPrivacyValueDisallowUsers($0) }
    dict[1283572154] = { return Api.InputPrivacyRule.parse_inputPrivacyValueAllowChatParticipants($0) }
    dict[-668769361] = { return Api.InputPrivacyRule.parse_inputPrivacyValueDisallowChatParticipants($0) }
    dict[-1058912715] = { return Api.messages.DhConfig.parse_dhConfigNotModified($0) }
    dict[740433629] = { return Api.messages.DhConfig.parse_dhConfig($0) }
    dict[-421545947] = { return Api.ChannelAdminLogEventAction.parse_channelAdminLogEventActionChangeTitle($0) }
    dict[1427671598] = { return Api.ChannelAdminLogEventAction.parse_channelAdminLogEventActionChangeAbout($0) }
    dict[1783299128] = { return Api.ChannelAdminLogEventAction.parse_channelAdminLogEventActionChangeUsername($0) }
    dict[460916654] = { return Api.ChannelAdminLogEventAction.parse_channelAdminLogEventActionToggleInvites($0) }
    dict[648939889] = { return Api.ChannelAdminLogEventAction.parse_channelAdminLogEventActionToggleSignatures($0) }
    dict[-370660328] = { return Api.ChannelAdminLogEventAction.parse_channelAdminLogEventActionUpdatePinned($0) }
    dict[1889215493] = { return Api.ChannelAdminLogEventAction.parse_channelAdminLogEventActionEditMessage($0) }
    dict[1121994683] = { return Api.ChannelAdminLogEventAction.parse_channelAdminLogEventActionDeleteMessage($0) }
    dict[405815507] = { return Api.ChannelAdminLogEventAction.parse_channelAdminLogEventActionParticipantJoin($0) }
    dict[-124291086] = { return Api.ChannelAdminLogEventAction.parse_channelAdminLogEventActionParticipantLeave($0) }
    dict[-484690728] = { return Api.ChannelAdminLogEventAction.parse_channelAdminLogEventActionParticipantInvite($0) }
    dict[-422036098] = { return Api.ChannelAdminLogEventAction.parse_channelAdminLogEventActionParticipantToggleBan($0) }
    dict[-714643696] = { return Api.ChannelAdminLogEventAction.parse_channelAdminLogEventActionParticipantToggleAdmin($0) }
    dict[-1312568665] = { return Api.ChannelAdminLogEventAction.parse_channelAdminLogEventActionChangeStickerSet($0) }
    dict[1599903217] = { return Api.ChannelAdminLogEventAction.parse_channelAdminLogEventActionTogglePreHistoryHidden($0) }
    dict[771095562] = { return Api.ChannelAdminLogEventAction.parse_channelAdminLogEventActionDefaultBannedRights($0) }
    dict[-1895328189] = { return Api.ChannelAdminLogEventAction.parse_channelAdminLogEventActionStopPoll($0) }
    dict[1129042607] = { return Api.ChannelAdminLogEventAction.parse_channelAdminLogEventActionChangePhoto($0) }
    dict[-1569748965] = { return Api.ChannelAdminLogEventAction.parse_channelAdminLogEventActionChangeLinkedChat($0) }
    dict[241923758] = { return Api.ChannelAdminLogEventAction.parse_channelAdminLogEventActionChangeLocation($0) }
    dict[1401984889] = { return Api.ChannelAdminLogEventAction.parse_channelAdminLogEventActionToggleSlowMode($0) }
    dict[-543777747] = { return Api.auth.ExportedAuthorization.parse_exportedAuthorization($0) }
    dict[2103482845] = { return Api.SecurePlainData.parse_securePlainPhone($0) }
    dict[569137759] = { return Api.SecurePlainData.parse_securePlainEmail($0) }
    dict[-1269012015] = { return Api.messages.AffectedHistory.parse_affectedHistory($0) }
    dict[1244130093] = { return Api.StatsGraph.parse_statsGraphAsync($0) }
    dict[-1092839390] = { return Api.StatsGraph.parse_statsGraphError($0) }
    dict[-1901828938] = { return Api.StatsGraph.parse_statsGraph($0) }
    dict[-1036572727] = { return Api.account.PasswordInputSettings.parse_passwordInputSettings($0) }
    dict[878078826] = { return Api.PageTableCell.parse_pageTableCell($0) }
    dict[-1626209256] = { return Api.ChatBannedRights.parse_chatBannedRights($0) }
    dict[649453030] = { return Api.messages.MessageEditData.parse_messageEditData($0) }
    dict[-886477832] = { return Api.LabeledPrice.parse_labeledPrice($0) }
    dict[-438840932] = { return Api.messages.ChatFull.parse_chatFull($0) }
    dict[-618540889] = { return Api.InputSecureValue.parse_inputSecureValue($0) }
    dict[-170029155] = { return Api.messages.DiscussionMessage.parse_discussionMessage($0) }
    dict[1722786150] = { return Api.help.DeepLinkInfo.parse_deepLinkInfoEmpty($0) }
    dict[1783556146] = { return Api.help.DeepLinkInfo.parse_deepLinkInfo($0) }
    dict[-313079300] = { return Api.account.WebAuthorizations.parse_webAuthorizations($0) }
    dict[2013922064] = { return Api.help.TermsOfService.parse_termsOfService($0) }
    dict[1490799288] = { return Api.ReportReason.parse_inputReportReasonSpam($0) }
    dict[505595789] = { return Api.ReportReason.parse_inputReportReasonViolence($0) }
    dict[777640226] = { return Api.ReportReason.parse_inputReportReasonPornography($0) }
    dict[-512463606] = { return Api.ReportReason.parse_inputReportReasonOther($0) }
    dict[-1685456582] = { return Api.ReportReason.parse_inputReportReasonCopyright($0) }
    dict[-1376497949] = { return Api.ReportReason.parse_inputReportReasonChildAbuse($0) }
    dict[-606798099] = { return Api.ReportReason.parse_inputReportReasonGeoIrrelevant($0) }
    dict[-247351839] = { return Api.InputEncryptedChat.parse_inputEncryptedChat($0) }
    dict[-524237339] = { return Api.PageTableRow.parse_pageTableRow($0) }
    dict[-40996577] = { return Api.DraftMessage.parse_draftMessage($0) }
    dict[453805082] = { return Api.DraftMessage.parse_draftMessageEmpty($0) }
    dict[-1014526429] = { return Api.help.Country.parse_country($0) }
    dict[418631927] = { return Api.StatsGroupTopPoster.parse_statsGroupTopPoster($0) }
    dict[-2128640689] = { return Api.account.SentEmailCode.parse_sentEmailCode($0) }
    dict[-1038136962] = { return Api.EncryptedFile.parse_encryptedFileEmpty($0) }
    dict[1248893260] = { return Api.EncryptedFile.parse_encryptedFile($0) }
    dict[-557924733] = { return Api.CodeSettings.parse_codeSettings($0) }
    dict[-391902247] = { return Api.SecureValueError.parse_secureValueErrorData($0) }
    dict[12467706] = { return Api.SecureValueError.parse_secureValueErrorFrontSide($0) }
    dict[-2037765467] = { return Api.SecureValueError.parse_secureValueErrorReverseSide($0) }
    dict[-449327402] = { return Api.SecureValueError.parse_secureValueErrorSelfie($0) }
    dict[2054162547] = { return Api.SecureValueError.parse_secureValueErrorFile($0) }
    dict[1717706985] = { return Api.SecureValueError.parse_secureValueErrorFiles($0) }
    dict[-2036501105] = { return Api.SecureValueError.parse_secureValueError($0) }
    dict[-1592506512] = { return Api.SecureValueError.parse_secureValueErrorTranslationFile($0) }
    dict[878931416] = { return Api.SecureValueError.parse_secureValueErrorTranslationFiles($0) }
    dict[-1728664459] = { return Api.help.PromoData.parse_promoDataEmpty($0) }
    dict[-1942390465] = { return Api.help.PromoData.parse_promoData($0) }
    dict[-1613493288] = { return Api.NotifyPeer.parse_notifyPeer($0) }
    dict[-1261946036] = { return Api.NotifyPeer.parse_notifyUsers($0) }
    dict[-1073230141] = { return Api.NotifyPeer.parse_notifyChats($0) }
    dict[-703403793] = { return Api.NotifyPeer.parse_notifyBroadcasts($0) }
    dict[-582464156] = { return Api.wallet.KeySecretSalt.parse_secretSalt($0) }
    dict[1335282456] = { return Api.InputPrivacyKey.parse_inputPrivacyKeyStatusTimestamp($0) }
    dict[-1107622874] = { return Api.InputPrivacyKey.parse_inputPrivacyKeyChatInvite($0) }
    dict[-88417185] = { return Api.InputPrivacyKey.parse_inputPrivacyKeyPhoneCall($0) }
    dict[-610373422] = { return Api.InputPrivacyKey.parse_inputPrivacyKeyPhoneP2P($0) }
    dict[-1529000952] = { return Api.InputPrivacyKey.parse_inputPrivacyKeyForwards($0) }
    dict[1461304012] = { return Api.InputPrivacyKey.parse_inputPrivacyKeyProfilePhoto($0) }
    dict[55761658] = { return Api.InputPrivacyKey.parse_inputPrivacyKeyPhoneNumber($0) }
    dict[-786326563] = { return Api.InputPrivacyKey.parse_inputPrivacyKeyAddedByPhone($0) }
    dict[235081943] = { return Api.help.RecentMeUrls.parse_recentMeUrls($0) }
    dict[-1606526075] = { return Api.ReplyMarkup.parse_replyKeyboardHide($0) }
    dict[-200242528] = { return Api.ReplyMarkup.parse_replyKeyboardForceReply($0) }
    dict[889353612] = { return Api.ReplyMarkup.parse_replyKeyboardMarkup($0) }
    dict[1218642516] = { return Api.ReplyMarkup.parse_replyInlineMarkup($0) }
    dict[1556570557] = { return Api.EmojiKeywordsDifference.parse_emojiKeywordsDifference($0) }
    dict[1493171408] = { return Api.HighScore.parse_highScore($0) }
    dict[-305282981] = { return Api.TopPeer.parse_topPeer($0) }
    dict[-1495959709] = { return Api.MessageReplyHeader.parse_messageReplyHeader($0) }
    dict[411017418] = { return Api.SecureValue.parse_secureValue($0) }
    dict[-316748368] = { return Api.SecureValueHash.parse_secureValueHash($0) }
    dict[1118525718] = { return Api.phone.GroupCall.parse_groupCall($0) }
    dict[-398136321] = { return Api.messages.SearchCounter.parse_searchCounter($0) }
    dict[-2128698738] = { return Api.auth.CheckedPhone.parse_checkedPhone($0) }
    dict[-1188055347] = { return Api.PageListItem.parse_pageListItemText($0) }
    dict[635466748] = { return Api.PageListItem.parse_pageListItemBlocks($0) }
    dict[-386039788] = { return Api.PeerBlocked.parse_peerBlocked($0) }
    dict[-1182234929] = { return Api.InputUser.parse_inputUserEmpty($0) }
    dict[-138301121] = { return Api.InputUser.parse_inputUserSelf($0) }
    dict[-668391402] = { return Api.InputUser.parse_inputUser($0) }
    dict[-1738178803] = { return Api.Page.parse_page($0) }
    dict[871426631] = { return Api.SecureCredentialsEncrypted.parse_secureCredentialsEncrypted($0) }
    dict[-875679776] = { return Api.StatsPercentValue.parse_statsPercentValue($0) }
    dict[157948117] = { return Api.upload.File.parse_file($0) }
    dict[-242427324] = { return Api.upload.File.parse_fileCdnRedirect($0) }
    dict[-1078612597] = { return Api.ChannelLocation.parse_channelLocationEmpty($0) }
    dict[547062491] = { return Api.ChannelLocation.parse_channelLocation($0) }
    dict[182649427] = { return Api.MessageRange.parse_messageRange($0) }
    dict[946083368] = { return Api.messages.StickerSetInstallResult.parse_stickerSetInstallResultSuccess($0) }
    dict[904138920] = { return Api.messages.StickerSetInstallResult.parse_stickerSetInstallResultArchive($0) }
    dict[856375399] = { return Api.Config.parse_config($0) }
    dict[-75283823] = { return Api.TopPeerCategoryPeers.parse_topPeerCategoryPeers($0) }
    dict[-1107729093] = { return Api.Game.parse_game($0) }
    dict[1605510357] = { return Api.ChatAdminRights.parse_chatAdminRights($0) }
    dict[4883767] = { return Api.SecurePasswordKdfAlgo.parse_securePasswordKdfAlgoUnknown($0) }
    dict[-1141711456] = { return Api.SecurePasswordKdfAlgo.parse_securePasswordKdfAlgoPBKDF2HMACSHA512iter100000($0) }
    dict[-2042159726] = { return Api.SecurePasswordKdfAlgo.parse_securePasswordKdfAlgoSHA512($0) }
    dict[-1032140601] = { return Api.BotCommand.parse_botCommand($0) }
    dict[1474462241] = { return Api.account.ContentSettings.parse_contentSettings($0) }
    dict[1325740111] = { return Api.phone.GroupParticipants.parse_groupParticipants($0) }
    dict[-2066640507] = { return Api.messages.AffectedMessages.parse_affectedMessages($0) }
    dict[-402498398] = { return Api.messages.SavedGifs.parse_savedGifsNotModified($0) }
    dict[772213157] = { return Api.messages.SavedGifs.parse_savedGifs($0) }
    dict[-914167110] = { return Api.CdnPublicKey.parse_cdnPublicKey($0) }
    dict[1093204652] = { return Api.MessageReplies.parse_messageReplies($0) }
    dict[53231223] = { return Api.InputGame.parse_inputGameID($0) }
    dict[-1020139510] = { return Api.InputGame.parse_inputGameShortName($0) }
    dict[1107543535] = { return Api.help.CountryCode.parse_countryCode($0) }
    dict[-1502174430] = { return Api.InputMessage.parse_inputMessageID($0) }
    dict[-1160215659] = { return Api.InputMessage.parse_inputMessageReplyTo($0) }
    dict[-2037963464] = { return Api.InputMessage.parse_inputMessagePinned($0) }
    dict[-58224696] = { return Api.PhoneCallProtocol.parse_phoneCallProtocol($0) }
    dict[-1237848657] = { return Api.StatsDateRangeDays.parse_statsDateRangeDays($0) }
    dict[-1567175714] = { return Api.MessageFwdAuthor.parse_messageFwdAuthor($0) }
    dict[-1539849235] = { return Api.WallPaper.parse_wallPaper($0) }
    dict[-1963717851] = { return Api.WallPaper.parse_wallPaperNoFile($0) }
    dict[-1938715001] = { return Api.messages.Messages.parse_messages($0) }
    dict[1951620897] = { return Api.messages.Messages.parse_messagesNotModified($0) }
    dict[1682413576] = { return Api.messages.Messages.parse_channelMessages($0) }
    dict[978610270] = { return Api.messages.Messages.parse_messagesSlice($0) }
    dict[-1022713000] = { return Api.Invoice.parse_invoice($0) }
    dict[1933519201] = { return Api.PeerSettings.parse_peerSettings($0) }
    dict[1577067778] = { return Api.auth.SentCode.parse_sentCode($0) }
    dict[480546647] = { return Api.InputChatPhoto.parse_inputChatPhotoEmpty($0) }
    dict[-1991004873] = { return Api.InputChatPhoto.parse_inputChatPhoto($0) }
    dict[-968723890] = { return Api.InputChatPhoto.parse_inputChatUploadedPhoto($0) }
    dict[-1228606141] = { return Api.messages.MessageViews.parse_messageViews($0) }
    dict[-368917890] = { return Api.PaymentCharge.parse_paymentCharge($0) }
    dict[-1387279939] = { return Api.MessageInteractionCounters.parse_messageInteractionCounters($0) }
    dict[-1107852396] = { return Api.stats.BroadcastStats.parse_broadcastStats($0) }
    dict[-484987010] = { return Api.Updates.parse_updatesTooLong($0) }
    dict[2027216577] = { return Api.Updates.parse_updateShort($0) }
    dict[1918567619] = { return Api.Updates.parse_updatesCombined($0) }
    dict[1957577280] = { return Api.Updates.parse_updates($0) }
    dict[301019932] = { return Api.Updates.parse_updateShortSentMessage($0) }
    dict[580309704] = { return Api.Updates.parse_updateShortMessage($0) }
    dict[1076714939] = { return Api.Updates.parse_updateShortChatMessage($0) }
    dict[-276825834] = { return Api.stats.MegagroupStats.parse_megagroupStats($0) }
    dict[-884757282] = { return Api.StatsAbsValueAndPrev.parse_statsAbsValueAndPrev($0) }
    dict[1038967584] = { return Api.MessageMedia.parse_messageMediaEmpty($0) }
    dict[1457575028] = { return Api.MessageMedia.parse_messageMediaGeo($0) }
    dict[-1618676578] = { return Api.MessageMedia.parse_messageMediaUnsupported($0) }
    dict[-1557277184] = { return Api.MessageMedia.parse_messageMediaWebPage($0) }
    dict[-38694904] = { return Api.MessageMedia.parse_messageMediaGame($0) }
    dict[-2074799289] = { return Api.MessageMedia.parse_messageMediaInvoice($0) }
    dict[784356159] = { return Api.MessageMedia.parse_messageMediaVenue($0) }
    dict[1766936791] = { return Api.MessageMedia.parse_messageMediaPhoto($0) }
    dict[-1666158377] = { return Api.MessageMedia.parse_messageMediaDocument($0) }
    dict[-873313984] = { return Api.MessageMedia.parse_messageMediaContact($0) }
    dict[1272375192] = { return Api.MessageMedia.parse_messageMediaPoll($0) }
    dict[1065280907] = { return Api.MessageMedia.parse_messageMediaDice($0) }
    dict[-1186937242] = { return Api.MessageMedia.parse_messageMediaGeoLive($0) }
    dict[-842892769] = { return Api.PaymentSavedCredentials.parse_paymentSavedCredentialsCard($0) }
    dict[1450380236] = { return Api.Null.parse_null($0) }
    dict[1923290508] = { return Api.auth.CodeType.parse_codeTypeSms($0) }
    dict[1948046307] = { return Api.auth.CodeType.parse_codeTypeCall($0) }
    dict[577556219] = { return Api.auth.CodeType.parse_codeTypeFlashCall($0) }
    dict[1815593308] = { return Api.DocumentAttribute.parse_documentAttributeImageSize($0) }
    dict[297109817] = { return Api.DocumentAttribute.parse_documentAttributeAnimated($0) }
    dict[1662637586] = { return Api.DocumentAttribute.parse_documentAttributeSticker($0) }
    dict[250621158] = { return Api.DocumentAttribute.parse_documentAttributeVideo($0) }
    dict[-1739392570] = { return Api.DocumentAttribute.parse_documentAttributeAudio($0) }
    dict[358154344] = { return Api.DocumentAttribute.parse_documentAttributeFilename($0) }
    dict[-1744710921] = { return Api.DocumentAttribute.parse_documentAttributeHasStickers($0) }
    dict[-177732982] = { return Api.BankCardOpenUrl.parse_bankCardOpenUrl($0) }
    dict[307276766] = { return Api.account.Authorizations.parse_authorizations($0) }
    dict[935395612] = { return Api.ChatPhoto.parse_chatPhotoEmpty($0) }
    dict[-770990276] = { return Api.ChatPhoto.parse_chatPhoto($0) }
    dict[1869903447] = { return Api.PageCaption.parse_pageCaption($0) }
    dict[1062645411] = { return Api.payments.PaymentForm.parse_paymentForm($0) }
    dict[1342771681] = { return Api.payments.PaymentReceipt.parse_paymentReceipt($0) }
    dict[863093588] = { return Api.messages.PeerDialogs.parse_peerDialogs($0) }
    dict[-1831650802] = { return Api.UrlAuthResult.parse_urlAuthResultRequest($0) }
    dict[-1886646706] = { return Api.UrlAuthResult.parse_urlAuthResultAccepted($0) }
    dict[-1445536993] = { return Api.UrlAuthResult.parse_urlAuthResultDefault($0) }
    dict[-4838507] = { return Api.InputStickerSet.parse_inputStickerSetEmpty($0) }
    dict[-1645763991] = { return Api.InputStickerSet.parse_inputStickerSetID($0) }
    dict[-2044933984] = { return Api.InputStickerSet.parse_inputStickerSetShortName($0) }
    dict[42402760] = { return Api.InputStickerSet.parse_inputStickerSetAnimatedEmoji($0) }
    dict[-427863538] = { return Api.InputStickerSet.parse_inputStickerSetDice($0) }
    dict[-1729618630] = { return Api.BotInfo.parse_botInfo($0) }
    dict[-1519637954] = { return Api.updates.State.parse_state($0) }
    dict[372165663] = { return Api.FoundGif.parse_foundGif($0) }
    dict[-1670052855] = { return Api.FoundGif.parse_foundGifCached($0) }
    dict[537022650] = { return Api.User.parse_userEmpty($0) }
    dict[-1820043071] = { return Api.User.parse_user($0) }
    dict[-2082087340] = { return Api.Message.parse_messageEmpty($0) }
    dict[1487813065] = { return Api.Message.parse_message($0) }
    dict[678405636] = { return Api.Message.parse_messageService($0) }
    dict[831924812] = { return Api.StatsGroupTopInviter.parse_statsGroupTopInviter($0) }
    dict[186120336] = { return Api.messages.RecentStickers.parse_recentStickersNotModified($0) }
    dict[586395571] = { return Api.messages.RecentStickers.parse_recentStickers($0) }
    dict[-182231723] = { return Api.InputFileLocation.parse_inputEncryptedFileLocation($0) }
    dict[-876089816] = { return Api.InputFileLocation.parse_inputSecureFileLocation($0) }
    dict[-539317279] = { return Api.InputFileLocation.parse_inputFileLocation($0) }
    dict[1075322878] = { return Api.InputFileLocation.parse_inputPhotoFileLocation($0) }
    dict[-1160743548] = { return Api.InputFileLocation.parse_inputDocumentFileLocation($0) }
    dict[668375447] = { return Api.InputFileLocation.parse_inputPeerPhotoFileLocation($0) }
    dict[230353641] = { return Api.InputFileLocation.parse_inputStickerSetThumb($0) }
    dict[286776671] = { return Api.GeoPoint.parse_geoPointEmpty($0) }
    dict[-1297942941] = { return Api.GeoPoint.parse_geoPoint($0) }
    dict[506920429] = { return Api.InputPhoneCall.parse_inputPhoneCall($0) }
    dict[-1551583367] = { return Api.ReceivedNotifyMessage.parse_receivedNotifyMessage($0) }
    dict[-57668565] = { return Api.ChatParticipants.parse_chatParticipantsForbidden($0) }
    dict[1061556205] = { return Api.ChatParticipants.parse_chatParticipants($0) }
    dict[1949890536] = { return Api.DialogFilter.parse_dialogFilter($0) }
    dict[-1056001329] = { return Api.InputPaymentCredentials.parse_inputPaymentCredentialsSaved($0) }
    dict[873977640] = { return Api.InputPaymentCredentials.parse_inputPaymentCredentials($0) }
    dict[178373535] = { return Api.InputPaymentCredentials.parse_inputPaymentCredentialsApplePay($0) }
    dict[-905587442] = { return Api.InputPaymentCredentials.parse_inputPaymentCredentialsAndroidPay($0) }
    dict[-1239335713] = { return Api.ShippingOption.parse_shippingOption($0) }
    dict[859091184] = { return Api.InputSecureFile.parse_inputSecureFileUploaded($0) }
    dict[1399317950] = { return Api.InputSecureFile.parse_inputSecureFile($0) }
    dict[512535275] = { return Api.PostAddress.parse_postAddress($0) }
    dict[-70073706] = { return Api.InputFolderPeer.parse_inputFolderPeer($0) }
    dict[2104790276] = { return Api.DataJSON.parse_dataJSON($0) }
    dict[-433014407] = { return Api.InputWallPaper.parse_inputWallPaper($0) }
    dict[1913199744] = { return Api.InputWallPaper.parse_inputWallPaperSlug($0) }
    dict[-2077770836] = { return Api.InputWallPaper.parse_inputWallPaperNoFile($0) }
    dict[-1118798639] = { return Api.InputThemeSettings.parse_inputThemeSettings($0) }
    dict[1251549527] = { return Api.InputStickeredMedia.parse_inputStickeredMediaPhoto($0) }
    dict[70813275] = { return Api.InputStickeredMedia.parse_inputStickeredMediaDocument($0) }
    dict[1421174295] = { return Api.WebPageAttribute.parse_webPageAttributeTheme($0) }
    dict[-958657434] = { return Api.messages.FeaturedStickers.parse_featuredStickersNotModified($0) }
    dict[-1230257343] = { return Api.messages.FeaturedStickers.parse_featuredStickers($0) }
    dict[-2048646399] = { return Api.PhoneCallDiscardReason.parse_phoneCallDiscardReasonMissed($0) }
    dict[-527056480] = { return Api.PhoneCallDiscardReason.parse_phoneCallDiscardReasonDisconnect($0) }
    dict[1471006352] = { return Api.PhoneCallDiscardReason.parse_phoneCallDiscardReasonHangup($0) }
    dict[-84416311] = { return Api.PhoneCallDiscardReason.parse_phoneCallDiscardReasonBusy($0) }
    dict[-1910892683] = { return Api.NearestDc.parse_nearestDc($0) }
    dict[-1059185703] = { return Api.JSONObjectValue.parse_jsonObjectValue($0) }
    dict[-1916114267] = { return Api.photos.Photos.parse_photos($0) }
    dict[352657236] = { return Api.photos.Photos.parse_photosSlice($0) }
    dict[2010127419] = { return Api.contacts.ImportedContacts.parse_importedContacts($0) }
    dict[-1678949555] = { return Api.InputWebDocument.parse_inputWebDocument($0) }
    dict[-326966976] = { return Api.phone.PhoneCall.parse_phoneCall($0) }
    dict[995769920] = { return Api.ChannelAdminLogEvent.parse_channelAdminLogEvent($0) }
    dict[-1132882121] = { return Api.Bool.parse_boolFalse($0) }
    dict[-1720552011] = { return Api.Bool.parse_boolTrue($0) }
    dict[-892239370] = { return Api.LangPackString.parse_langPackString($0) }
    dict[1816636575] = { return Api.LangPackString.parse_langPackStringPluralized($0) }
    dict[695856818] = { return Api.LangPackString.parse_langPackStringDeleted($0) }
    dict[-1036396922] = { return Api.InputWebFileLocation.parse_inputWebFileLocation($0) }
    dict[1430205163] = { return Api.InputWebFileLocation.parse_inputWebFileGeoMessageLocation($0) }
    dict[-1625153079] = { return Api.InputWebFileLocation.parse_inputWebFileGeoPointLocation($0) }
    dict[1601666510] = { return Api.MessageFwdHeader.parse_messageFwdHeader($0) }
    dict[-1012849566] = { return Api.BaseTheme.parse_baseThemeClassic($0) }
    dict[-69724536] = { return Api.BaseTheme.parse_baseThemeDay($0) }
    dict[-1212997976] = { return Api.BaseTheme.parse_baseThemeNight($0) }
    dict[1834973166] = { return Api.BaseTheme.parse_baseThemeTinted($0) }
    dict[1527845466] = { return Api.BaseTheme.parse_baseThemeArctic($0) }
    dict[398898678] = { return Api.help.Support.parse_support($0) }
    dict[1474492012] = { return Api.MessagesFilter.parse_inputMessagesFilterEmpty($0) }
    dict[-1777752804] = { return Api.MessagesFilter.parse_inputMessagesFilterPhotos($0) }
    dict[-1614803355] = { return Api.MessagesFilter.parse_inputMessagesFilterVideo($0) }
    dict[1458172132] = { return Api.MessagesFilter.parse_inputMessagesFilterPhotoVideo($0) }
    dict[-648121413] = { return Api.MessagesFilter.parse_inputMessagesFilterPhotoVideoDocuments($0) }
    dict[-1629621880] = { return Api.MessagesFilter.parse_inputMessagesFilterDocument($0) }
    dict[2129714567] = { return Api.MessagesFilter.parse_inputMessagesFilterUrl($0) }
    dict[-3644025] = { return Api.MessagesFilter.parse_inputMessagesFilterGif($0) }
    dict[1358283666] = { return Api.MessagesFilter.parse_inputMessagesFilterVoice($0) }
    dict[928101534] = { return Api.MessagesFilter.parse_inputMessagesFilterMusic($0) }
    dict[975236280] = { return Api.MessagesFilter.parse_inputMessagesFilterChatPhotos($0) }
    dict[-2134272152] = { return Api.MessagesFilter.parse_inputMessagesFilterPhoneCalls($0) }
    dict[2054952868] = { return Api.MessagesFilter.parse_inputMessagesFilterRoundVoice($0) }
    dict[-1253451181] = { return Api.MessagesFilter.parse_inputMessagesFilterRoundVideo($0) }
    dict[-1040652646] = { return Api.MessagesFilter.parse_inputMessagesFilterMyMentions($0) }
    dict[1187706024] = { return Api.MessagesFilter.parse_inputMessagesFilterMyMentionsUnread($0) }
    dict[-419271411] = { return Api.MessagesFilter.parse_inputMessagesFilterGeo($0) }
    dict[-530392189] = { return Api.MessagesFilter.parse_inputMessagesFilterContacts($0) }
    dict[464520273] = { return Api.MessagesFilter.parse_inputMessagesFilterPinned($0) }
    dict[364538944] = { return Api.messages.Dialogs.parse_dialogs($0) }
    dict[1910543603] = { return Api.messages.Dialogs.parse_dialogsSlice($0) }
    dict[-253500010] = { return Api.messages.Dialogs.parse_dialogsNotModified($0) }
    dict[-1986399595] = { return Api.stats.MessageStats.parse_messageStats($0) }
    dict[-709641735] = { return Api.EmojiKeyword.parse_emojiKeyword($0) }
    dict[594408994] = { return Api.EmojiKeyword.parse_emojiKeywordDeleted($0) }
    dict[-290921362] = { return Api.upload.CdnFile.parse_cdnFileReuploadNeeded($0) }
    dict[-1449145777] = { return Api.upload.CdnFile.parse_cdnFile($0) }
    dict[1984136919] = { return Api.wallet.LiteResponse.parse_liteResponse($0) }
    dict[415997816] = { return Api.help.InviteText.parse_inviteText($0) }
    dict[-1937807902] = { return Api.BotInlineMessage.parse_botInlineMessageText($0) }
    dict[1984755728] = { return Api.BotInlineMessage.parse_botInlineMessageMediaAuto($0) }
    dict[-1970903652] = { return Api.BotInlineMessage.parse_botInlineMessageMediaVenue($0) }
    dict[416402882] = { return Api.BotInlineMessage.parse_botInlineMessageMediaContact($0) }
    dict[85477117] = { return Api.BotInlineMessage.parse_botInlineMessageMediaGeo($0) }
    dict[-1673717362] = { return Api.InputPeerNotifySettings.parse_inputPeerNotifySettings($0) }
    dict[-1634752813] = { return Api.messages.FavedStickers.parse_favedStickersNotModified($0) }
    dict[-209768682] = { return Api.messages.FavedStickers.parse_favedStickers($0) }
    dict[1776236393] = { return Api.ExportedChatInvite.parse_chatInviteEmpty($0) }
    dict[-64092740] = { return Api.ExportedChatInvite.parse_chatInviteExported($0) }
    dict[-1389486888] = { return Api.account.AuthorizationForm.parse_authorizationForm($0) }
    dict[-1392388579] = { return Api.Authorization.parse_authorization($0) }
    dict[-1361650766] = { return Api.MaskCoords.parse_maskCoords($0) }
    dict[-395967805] = { return Api.messages.AllStickers.parse_allStickersNotModified($0) }
    dict[-302170017] = { return Api.messages.AllStickers.parse_allStickers($0) }
    dict[-1655957568] = { return Api.PhoneConnection.parse_phoneConnection($0) }
    dict[1667228533] = { return Api.PhoneConnection.parse_phoneConnectionWebrtc($0) }
    dict[-206688531] = { return Api.help.UserInfo.parse_userInfoEmpty($0) }
    dict[32192344] = { return Api.help.UserInfo.parse_userInfo($0) }
    dict[-1194283041] = { return Api.AccountDaysTTL.parse_accountDaysTTL($0) }
    dict[-1658158621] = { return Api.SecureValueType.parse_secureValueTypePersonalDetails($0) }
    dict[1034709504] = { return Api.SecureValueType.parse_secureValueTypePassport($0) }
    dict[115615172] = { return Api.SecureValueType.parse_secureValueTypeDriverLicense($0) }
    dict[-1596951477] = { return Api.SecureValueType.parse_secureValueTypeIdentityCard($0) }
    dict[-1717268701] = { return Api.SecureValueType.parse_secureValueTypeInternalPassport($0) }
    dict[-874308058] = { return Api.SecureValueType.parse_secureValueTypeAddress($0) }
    dict[-63531698] = { return Api.SecureValueType.parse_secureValueTypeUtilityBill($0) }
    dict[-1995211763] = { return Api.SecureValueType.parse_secureValueTypeBankStatement($0) }
    dict[-1954007928] = { return Api.SecureValueType.parse_secureValueTypeRentalAgreement($0) }
    dict[-1713143702] = { return Api.SecureValueType.parse_secureValueTypePassportRegistration($0) }
    dict[-368907213] = { return Api.SecureValueType.parse_secureValueTypeTemporaryRegistration($0) }
    dict[-1289704741] = { return Api.SecureValueType.parse_secureValueTypePhone($0) }
    dict[-1908627474] = { return Api.SecureValueType.parse_secureValueTypeEmail($0) }
    dict[-732254058] = { return Api.PasswordKdfAlgo.parse_passwordKdfAlgoUnknown($0) }
    dict[982592842] = { return Api.PasswordKdfAlgo.parse_passwordKdfAlgoSHA256SHA256PBKDF2HMACSHA512iter100000SHA256ModPow($0) }
    dict[-1390001672] = { return Api.account.Password.parse_password($0) }
    dict[-1462213465] = { return Api.InputBotInlineResult.parse_inputBotInlineResultPhoto($0) }
    dict[-459324] = { return Api.InputBotInlineResult.parse_inputBotInlineResultDocument($0) }
    dict[1336154098] = { return Api.InputBotInlineResult.parse_inputBotInlineResultGame($0) }
    dict[-2000710887] = { return Api.InputBotInlineResult.parse_inputBotInlineResult($0) }
    dict[1352683077] = { return Api.account.PrivacyRules.parse_privacyRules($0) }
    dict[-123988] = { return Api.PrivacyRule.parse_privacyValueAllowContacts($0) }
    dict[1698855810] = { return Api.PrivacyRule.parse_privacyValueAllowAll($0) }
    dict[1297858060] = { return Api.PrivacyRule.parse_privacyValueAllowUsers($0) }
    dict[-125240806] = { return Api.PrivacyRule.parse_privacyValueDisallowContacts($0) }
    dict[-1955338397] = { return Api.PrivacyRule.parse_privacyValueDisallowAll($0) }
    dict[209668535] = { return Api.PrivacyRule.parse_privacyValueDisallowUsers($0) }
    dict[415136107] = { return Api.PrivacyRule.parse_privacyValueAllowChatParticipants($0) }
    dict[-1397881200] = { return Api.PrivacyRule.parse_privacyValueDisallowChatParticipants($0) }
    dict[-1230047312] = { return Api.MessageAction.parse_messageActionEmpty($0) }
    dict[-1503425638] = { return Api.MessageAction.parse_messageActionChatCreate($0) }
    dict[-1247687078] = { return Api.MessageAction.parse_messageActionChatEditTitle($0) }
    dict[2144015272] = { return Api.MessageAction.parse_messageActionChatEditPhoto($0) }
    dict[-1780220945] = { return Api.MessageAction.parse_messageActionChatDeletePhoto($0) }
    dict[1217033015] = { return Api.MessageAction.parse_messageActionChatAddUser($0) }
    dict[-1297179892] = { return Api.MessageAction.parse_messageActionChatDeleteUser($0) }
    dict[-123931160] = { return Api.MessageAction.parse_messageActionChatJoinedByLink($0) }
    dict[-1781355374] = { return Api.MessageAction.parse_messageActionChannelCreate($0) }
    dict[1371385889] = { return Api.MessageAction.parse_messageActionChatMigrateTo($0) }
    dict[-1336546578] = { return Api.MessageAction.parse_messageActionChannelMigrateFrom($0) }
    dict[-1799538451] = { return Api.MessageAction.parse_messageActionPinMessage($0) }
    dict[-1615153660] = { return Api.MessageAction.parse_messageActionHistoryClear($0) }
    dict[-1834538890] = { return Api.MessageAction.parse_messageActionGameScore($0) }
    dict[-1892568281] = { return Api.MessageAction.parse_messageActionPaymentSentMe($0) }
    dict[1080663248] = { return Api.MessageAction.parse_messageActionPaymentSent($0) }
    dict[-2132731265] = { return Api.MessageAction.parse_messageActionPhoneCall($0) }
    dict[1200788123] = { return Api.MessageAction.parse_messageActionScreenshotTaken($0) }
    dict[-85549226] = { return Api.MessageAction.parse_messageActionCustomAction($0) }
    dict[-1410748418] = { return Api.MessageAction.parse_messageActionBotAllowed($0) }
    dict[455635795] = { return Api.MessageAction.parse_messageActionSecureValuesSentMe($0) }
    dict[-648257196] = { return Api.MessageAction.parse_messageActionSecureValuesSent($0) }
    dict[-202219658] = { return Api.MessageAction.parse_messageActionContactSignUp($0) }
    dict[-1730095465] = { return Api.MessageAction.parse_messageActionGeoProximityReached($0) }
    dict[2047704898] = { return Api.MessageAction.parse_messageActionGroupCall($0) }
    dict[254144570] = { return Api.MessageAction.parse_messageActionInviteToGroupCall($0) }
    dict[1399245077] = { return Api.PhoneCall.parse_phoneCallEmpty($0) }
    dict[462375633] = { return Api.PhoneCall.parse_phoneCallWaiting($0) }
    dict[-2014659757] = { return Api.PhoneCall.parse_phoneCallRequested($0) }
    dict[-1719909046] = { return Api.PhoneCall.parse_phoneCallAccepted($0) }
    dict[-2025673089] = { return Api.PhoneCall.parse_phoneCall($0) }
    dict[1355435489] = { return Api.PhoneCall.parse_phoneCallDiscarded($0) }
    dict[-483352705] = { return Api.help.TermsOfServiceUpdate.parse_termsOfServiceUpdateEmpty($0) }
    dict[686618977] = { return Api.help.TermsOfServiceUpdate.parse_termsOfServiceUpdate($0) }
    dict[1674235686] = { return Api.account.AutoDownloadSettings.parse_autoDownloadSettings($0) }
    dict[-445792507] = { return Api.DialogPeer.parse_dialogPeer($0) }
    dict[1363483106] = { return Api.DialogPeer.parse_dialogPeerFolder($0) }
    dict[-104284986] = { return Api.WebDocument.parse_webDocumentNoProxy($0) }
    dict[475467473] = { return Api.WebDocument.parse_webDocument($0) }
    dict[42930452] = { return Api.Theme.parse_theme($0) }
    dict[-1290580579] = { return Api.contacts.Found.parse_found($0) }
    dict[-368018716] = { return Api.ChannelAdminLogEventsFilter.parse_channelAdminLogEventsFilter($0) }
    dict[-1676371894] = { return Api.ThemeSettings.parse_themeSettings($0) }
    dict[1889961234] = { return Api.PeerNotifySettings.parse_peerNotifySettingsEmpty($0) }
    dict[-1353671392] = { return Api.PeerNotifySettings.parse_peerNotifySettings($0) }
    dict[-1995686519] = { return Api.InputBotInlineMessageID.parse_inputBotInlineMessageID($0) }
    dict[-1282352120] = { return Api.PageRelatedArticle.parse_pageRelatedArticle($0) }
    dict[313694676] = { return Api.StickerPack.parse_stickerPack($0) }
    dict[1326562017] = { return Api.UserProfilePhoto.parse_userProfilePhotoEmpty($0) }
    dict[1775479590] = { return Api.UserProfilePhoto.parse_userProfilePhoto($0) }
    dict[-74456004] = { return Api.payments.SavedInfo.parse_savedInfo($0) }
    dict[1041346555] = { return Api.updates.ChannelDifference.parse_channelDifferenceEmpty($0) }
    dict[543450958] = { return Api.updates.ChannelDifference.parse_channelDifference($0) }
    dict[-1531132162] = { return Api.updates.ChannelDifference.parse_channelDifferenceTooLong($0) }
    dict[-1815339214] = { return Api.help.CountriesList.parse_countriesListNotModified($0) }
    dict[-2016381538] = { return Api.help.CountriesList.parse_countriesList($0) }
    dict[-309659827] = { return Api.channels.AdminLogResults.parse_adminLogResults($0) }
    dict[-264117680] = { return Api.ChatOnlines.parse_chatOnlines($0) }
    dict[488313413] = { return Api.InputAppEvent.parse_inputAppEvent($0) }
    dict[-1148011883] = { return Api.MessageEntity.parse_messageEntityUnknown($0) }
    dict[-100378723] = { return Api.MessageEntity.parse_messageEntityMention($0) }
    dict[1868782349] = { return Api.MessageEntity.parse_messageEntityHashtag($0) }
    dict[1827637959] = { return Api.MessageEntity.parse_messageEntityBotCommand($0) }
    dict[1859134776] = { return Api.MessageEntity.parse_messageEntityUrl($0) }
    dict[1692693954] = { return Api.MessageEntity.parse_messageEntityEmail($0) }
    dict[-1117713463] = { return Api.MessageEntity.parse_messageEntityBold($0) }
    dict[-2106619040] = { return Api.MessageEntity.parse_messageEntityItalic($0) }
    dict[681706865] = { return Api.MessageEntity.parse_messageEntityCode($0) }
    dict[1938967520] = { return Api.MessageEntity.parse_messageEntityPre($0) }
    dict[1990644519] = { return Api.MessageEntity.parse_messageEntityTextUrl($0) }
    dict[892193368] = { return Api.MessageEntity.parse_messageEntityMentionName($0) }
    dict[546203849] = { return Api.MessageEntity.parse_inputMessageEntityMentionName($0) }
    dict[-1687559349] = { return Api.MessageEntity.parse_messageEntityPhone($0) }
    dict[1280209983] = { return Api.MessageEntity.parse_messageEntityCashtag($0) }
    dict[-1672577397] = { return Api.MessageEntity.parse_messageEntityUnderline($0) }
    dict[-1090087980] = { return Api.MessageEntity.parse_messageEntityStrike($0) }
    dict[34469328] = { return Api.MessageEntity.parse_messageEntityBlockquote($0) }
    dict[1981704948] = { return Api.MessageEntity.parse_messageEntityBankCard($0) }
    dict[483901197] = { return Api.InputPhoto.parse_inputPhotoEmpty($0) }
    dict[1001634122] = { return Api.InputPhoto.parse_inputPhoto($0) }
    dict[-567906571] = { return Api.contacts.TopPeers.parse_topPeersNotModified($0) }
    dict[1891070632] = { return Api.contacts.TopPeers.parse_topPeers($0) }
    dict[-1255369827] = { return Api.contacts.TopPeers.parse_topPeersDisabled($0) }
    dict[1035688326] = { return Api.auth.SentCodeType.parse_sentCodeTypeApp($0) }
    dict[-1073693790] = { return Api.auth.SentCodeType.parse_sentCodeTypeSms($0) }
    dict[1398007207] = { return Api.auth.SentCodeType.parse_sentCodeTypeCall($0) }
    dict[-1425815847] = { return Api.auth.SentCodeType.parse_sentCodeTypeFlashCall($0) }
    dict[1577484359] = { return Api.PageListOrderedItem.parse_pageListOrderedItemText($0) }
    dict[-1730311882] = { return Api.PageListOrderedItem.parse_pageListOrderedItemBlocks($0) }
    dict[-1417756512] = { return Api.EncryptedChat.parse_encryptedChatEmpty($0) }
    dict[1006044124] = { return Api.EncryptedChat.parse_encryptedChatWaiting($0) }
    dict[-94974410] = { return Api.EncryptedChat.parse_encryptedChat($0) }
    dict[332848423] = { return Api.EncryptedChat.parse_encryptedChatDiscarded($0) }
    dict[1651608194] = { return Api.EncryptedChat.parse_encryptedChatRequested($0) }
    dict[-901375139] = { return Api.PeerLocated.parse_peerLocated($0) }
    dict[-118740917] = { return Api.PeerLocated.parse_peerSelfLocated($0) }
    dict[922273905] = { return Api.Document.parse_documentEmpty($0) }
    dict[512177195] = { return Api.Document.parse_document($0) }
    dict[-1707344487] = { return Api.messages.HighScores.parse_highScores($0) }
    dict[-892779534] = { return Api.WebAuthorization.parse_webAuthorization($0) }
    dict[-805141448] = { return Api.ImportedContact.parse_importedContact($0) }
    dict[1042605427] = { return Api.payments.BankCardData.parse_bankCardData($0) }
    return dict
}()

public struct Api {
    public static func parse(_ buffer: Buffer) -> Any? {
        let reader = BufferReader(buffer)
        if let signature = reader.readInt32() {
            return parse(reader, signature: signature)
        }
        return nil
    }
    
        public static func parse(_ reader: BufferReader, signature: Int32) -> Any? {
            if let parser = parsers[signature] {
                return parser(reader)
            }
            else {
                telegramApiLog("Type constructor \(String(UInt32(bitPattern: signature), radix: 16, uppercase: false)) not found")
                return nil
            }
        }
        
        public static func parseVector<T>(_ reader: BufferReader, elementSignature: Int32, elementType: T.Type) -> [T]? {
        if let count = reader.readInt32() {
            var array = [T]()
            var i: Int32 = 0
            while i < count {
                var signature = elementSignature
                if elementSignature == 0 {
                    if let unboxedSignature = reader.readInt32() {
                        signature = unboxedSignature
                    }
                    else {
                        return nil
                    }
                }
                if elementType == Buffer.self {
                    if let item = parseBytes(reader) as? T {
                        array.append(item)
                    } else {
                        return nil
                    }
                } else {
                if let item = Api.parse(reader, signature: signature) as? T {
                    array.append(item)
                }
                else {
                    return nil
                }
                }
                i += 1
            }
            return array
        }
        return nil
    }
    
    public static func serializeObject(_ object: Any, buffer: Buffer, boxed: Swift.Bool) {
        switch object {
            case let _1 as Api.messages.StickerSet:
                _1.serialize(buffer, boxed)
            case let _1 as Api.GroupCall:
                _1.serialize(buffer, boxed)
            case let _1 as Api.InputGeoPoint:
                _1.serialize(buffer, boxed)
            case let _1 as Api.payments.ValidatedRequestedInfo:
                _1.serialize(buffer, boxed)
            case let _1 as Api.ChatFull:
                _1.serialize(buffer, boxed)
            case let _1 as Api.PollResults:
                _1.serialize(buffer, boxed)
            case let _1 as Api.ChatParticipant:
                _1.serialize(buffer, boxed)
            case let _1 as Api.updates.Difference:
                _1.serialize(buffer, boxed)
            case let _1 as Api.CdnConfig:
                _1.serialize(buffer, boxed)
            case let _1 as Api.PageBlock:
                _1.serialize(buffer, boxed)
            case let _1 as Api.account.TmpPassword:
                _1.serialize(buffer, boxed)
            case let _1 as Api.SecureRequiredType:
                _1.serialize(buffer, boxed)
            case let _1 as Api.auth.LoginToken:
                _1.serialize(buffer, boxed)
            case let _1 as Api.JSONValue:
                _1.serialize(buffer, boxed)
            case let _1 as Api.Photo:
                _1.serialize(buffer, boxed)
            case let _1 as Api.Chat:
                _1.serialize(buffer, boxed)
            case let _1 as Api.StatsURL:
                _1.serialize(buffer, boxed)
            case let _1 as Api.ChatInvite:
                _1.serialize(buffer, boxed)
            case let _1 as Api.AutoDownloadSettings:
                _1.serialize(buffer, boxed)
            case let _1 as Api.StickerSetCovered:
                _1.serialize(buffer, boxed)
            case let _1 as Api.RecentMeUrl:
                _1.serialize(buffer, boxed)
            case let _1 as Api.RestrictionReason:
                _1.serialize(buffer, boxed)
            case let _1 as Api.channels.ChannelParticipants:
                _1.serialize(buffer, boxed)
            case let _1 as Api.RichText:
                _1.serialize(buffer, boxed)
            case let _1 as Api.UserFull:
                _1.serialize(buffer, boxed)
            case let _1 as Api.InputChannel:
                _1.serialize(buffer, boxed)
            case let _1 as Api.DcOption:
                _1.serialize(buffer, boxed)
            case let _1 as Api.PollAnswerVoters:
                _1.serialize(buffer, boxed)
            case let _1 as Api.account.PasswordSettings:
                _1.serialize(buffer, boxed)
            case let _1 as Api.LangPackLanguage:
                _1.serialize(buffer, boxed)
            case let _1 as Api.VideoSize:
                _1.serialize(buffer, boxed)
            case let _1 as Api.help.AppUpdate:
                _1.serialize(buffer, boxed)
            case let _1 as Api.LangPackDifference:
                _1.serialize(buffer, boxed)
            case let _1 as Api.WallPaperSettings:
                _1.serialize(buffer, boxed)
            case let _1 as Api.EmojiURL:
                _1.serialize(buffer, boxed)
            case let _1 as Api.StatsGroupTopAdmin:
                _1.serialize(buffer, boxed)
            case let _1 as Api.channels.ChannelParticipant:
                _1.serialize(buffer, boxed)
            case let _1 as Api.InputCheckPasswordSRP:
                _1.serialize(buffer, boxed)
            case let _1 as Api.storage.FileType:
                _1.serialize(buffer, boxed)
            case let _1 as Api.messages.ArchivedStickers:
                _1.serialize(buffer, boxed)
            case let _1 as Api.InputEncryptedFile:
                _1.serialize(buffer, boxed)
            case let _1 as Api.messages.InactiveChats:
                _1.serialize(buffer, boxed)
            case let _1 as Api.GroupCallParticipant:
                _1.serialize(buffer, boxed)
            case let _1 as Api.messages.SentEncryptedMessage:
                _1.serialize(buffer, boxed)
            case let _1 as Api.ExportedMessageLink:
                _1.serialize(buffer, boxed)
            case let _1 as Api.auth.Authorization:
                _1.serialize(buffer, boxed)
            case let _1 as Api.InputFile:
                _1.serialize(buffer, boxed)
            case let _1 as Api.Peer:
                _1.serialize(buffer, boxed)
            case let _1 as Api.PaymentRequestedInfo:
                _1.serialize(buffer, boxed)
            case let _1 as Api.UserStatus:
                _1.serialize(buffer, boxed)
            case let _1 as Api.Folder:
                _1.serialize(buffer, boxed)
            case let _1 as Api.Dialog:
                _1.serialize(buffer, boxed)
            case let _1 as Api.SendMessageAction:
                _1.serialize(buffer, boxed)
            case let _1 as Api.PrivacyKey:
                _1.serialize(buffer, boxed)
            case let _1 as Api.Update:
                _1.serialize(buffer, boxed)
            case let _1 as Api.messages.VotesList:
                _1.serialize(buffer, boxed)
            case let _1 as Api.PopularContact:
                _1.serialize(buffer, boxed)
            case let _1 as Api.FolderPeer:
                _1.serialize(buffer, boxed)
            case let _1 as Api.ChannelParticipant:
                _1.serialize(buffer, boxed)
            case let _1 as Api.MessageUserVote:
                _1.serialize(buffer, boxed)
            case let _1 as Api.contacts.Blocked:
                _1.serialize(buffer, boxed)
            case let _1 as Api.InputDialogPeer:
                _1.serialize(buffer, boxed)
            case let _1 as Api.Error:
                _1.serialize(buffer, boxed)
            case let _1 as Api.KeyboardButton:
                _1.serialize(buffer, boxed)
            case let _1 as Api.ContactStatus:
                _1.serialize(buffer, boxed)
            case let _1 as Api.SecureFile:
                _1.serialize(buffer, boxed)
            case let _1 as Api.account.Themes:
                _1.serialize(buffer, boxed)
            case let _1 as Api.PhotoSize:
                _1.serialize(buffer, boxed)
            case let _1 as Api.messages.Stickers:
                _1.serialize(buffer, boxed)
            case let _1 as Api.GlobalPrivacySettings:
                _1.serialize(buffer, boxed)
            case let _1 as Api.InlineBotSwitchPM:
                _1.serialize(buffer, boxed)
            case let _1 as Api.messages.FoundStickerSets:
                _1.serialize(buffer, boxed)
            case let _1 as Api.account.WallPapers:
                _1.serialize(buffer, boxed)
            case let _1 as Api.InputTheme:
                _1.serialize(buffer, boxed)
            case let _1 as Api.messages.FoundGifs:
                _1.serialize(buffer, boxed)
            case let _1 as Api.FileLocation:
                _1.serialize(buffer, boxed)
            case let _1 as Api.Poll:
                _1.serialize(buffer, boxed)
            case let _1 as Api.InputNotifyPeer:
                _1.serialize(buffer, boxed)
            case let _1 as Api.EncryptedMessage:
                _1.serialize(buffer, boxed)
            case let _1 as Api.ChannelParticipantsFilter:
                _1.serialize(buffer, boxed)
            case let _1 as Api.WebPage:
                _1.serialize(buffer, boxed)
            case let _1 as Api.InputBotInlineMessage:
                _1.serialize(buffer, boxed)
            case let _1 as Api.KeyboardButtonRow:
                _1.serialize(buffer, boxed)
            case let _1 as Api.StickerSet:
                _1.serialize(buffer, boxed)
            case let _1 as Api.SecureSecretSettings:
                _1.serialize(buffer, boxed)
            case let _1 as Api.photos.Photo:
                _1.serialize(buffer, boxed)
            case let _1 as Api.InputContact:
                _1.serialize(buffer, boxed)
            case let _1 as Api.TopPeerCategory:
                _1.serialize(buffer, boxed)
            case let _1 as Api.contacts.Contacts:
                _1.serialize(buffer, boxed)
            case let _1 as Api.ChannelMessagesFilter:
                _1.serialize(buffer, boxed)
            case let _1 as Api.DialogFilterSuggested:
                _1.serialize(buffer, boxed)
            case let _1 as Api.auth.PasswordRecovery:
                _1.serialize(buffer, boxed)
            case let _1 as Api.messages.BotResults:
                _1.serialize(buffer, boxed)
            case let _1 as Api.InputDocument:
                _1.serialize(buffer, boxed)
            case let _1 as Api.PollAnswer:
                _1.serialize(buffer, boxed)
            case let _1 as Api.contacts.ResolvedPeer:
                _1.serialize(buffer, boxed)
            case let _1 as Api.SecureData:
                _1.serialize(buffer, boxed)
            case let _1 as Api.InputMedia:
                _1.serialize(buffer, boxed)
            case let _1 as Api.InputPeer:
                _1.serialize(buffer, boxed)
            case let _1 as Api.upload.WebFile:
                _1.serialize(buffer, boxed)
            case let _1 as Api.Contact:
                _1.serialize(buffer, boxed)
            case let _1 as Api.help.PassportConfig:
                _1.serialize(buffer, boxed)
            case let _1 as Api.FileHash:
                _1.serialize(buffer, boxed)
            case let _1 as Api.BotInlineResult:
                _1.serialize(buffer, boxed)
            case let _1 as Api.messages.BotCallbackAnswer:
                _1.serialize(buffer, boxed)
            case let _1 as Api.payments.PaymentResult:
                _1.serialize(buffer, boxed)
            case let _1 as Api.messages.Chats:
                _1.serialize(buffer, boxed)
            case let _1 as Api.InputGroupCall:
                _1.serialize(buffer, boxed)
            case let _1 as Api.InputSingleMedia:
                _1.serialize(buffer, boxed)
            case let _1 as Api.MessageViews:
                _1.serialize(buffer, boxed)
            case let _1 as Api.InputPrivacyRule:
                _1.serialize(buffer, boxed)
            case let _1 as Api.messages.DhConfig:
                _1.serialize(buffer, boxed)
            case let _1 as Api.ChannelAdminLogEventAction:
                _1.serialize(buffer, boxed)
            case let _1 as Api.auth.ExportedAuthorization:
                _1.serialize(buffer, boxed)
            case let _1 as Api.SecurePlainData:
                _1.serialize(buffer, boxed)
            case let _1 as Api.messages.AffectedHistory:
                _1.serialize(buffer, boxed)
            case let _1 as Api.StatsGraph:
                _1.serialize(buffer, boxed)
            case let _1 as Api.account.PasswordInputSettings:
                _1.serialize(buffer, boxed)
            case let _1 as Api.PageTableCell:
                _1.serialize(buffer, boxed)
            case let _1 as Api.ChatBannedRights:
                _1.serialize(buffer, boxed)
            case let _1 as Api.messages.MessageEditData:
                _1.serialize(buffer, boxed)
            case let _1 as Api.LabeledPrice:
                _1.serialize(buffer, boxed)
            case let _1 as Api.messages.ChatFull:
                _1.serialize(buffer, boxed)
            case let _1 as Api.InputSecureValue:
                _1.serialize(buffer, boxed)
            case let _1 as Api.messages.DiscussionMessage:
                _1.serialize(buffer, boxed)
            case let _1 as Api.help.DeepLinkInfo:
                _1.serialize(buffer, boxed)
            case let _1 as Api.account.WebAuthorizations:
                _1.serialize(buffer, boxed)
            case let _1 as Api.help.TermsOfService:
                _1.serialize(buffer, boxed)
            case let _1 as Api.ReportReason:
                _1.serialize(buffer, boxed)
            case let _1 as Api.InputEncryptedChat:
                _1.serialize(buffer, boxed)
            case let _1 as Api.PageTableRow:
                _1.serialize(buffer, boxed)
            case let _1 as Api.DraftMessage:
                _1.serialize(buffer, boxed)
            case let _1 as Api.help.Country:
                _1.serialize(buffer, boxed)
            case let _1 as Api.StatsGroupTopPoster:
                _1.serialize(buffer, boxed)
            case let _1 as Api.account.SentEmailCode:
                _1.serialize(buffer, boxed)
            case let _1 as Api.EncryptedFile:
                _1.serialize(buffer, boxed)
            case let _1 as Api.CodeSettings:
                _1.serialize(buffer, boxed)
            case let _1 as Api.SecureValueError:
                _1.serialize(buffer, boxed)
            case let _1 as Api.help.PromoData:
                _1.serialize(buffer, boxed)
            case let _1 as Api.NotifyPeer:
                _1.serialize(buffer, boxed)
            case let _1 as Api.wallet.KeySecretSalt:
                _1.serialize(buffer, boxed)
            case let _1 as Api.InputPrivacyKey:
                _1.serialize(buffer, boxed)
            case let _1 as Api.help.RecentMeUrls:
                _1.serialize(buffer, boxed)
            case let _1 as Api.ReplyMarkup:
                _1.serialize(buffer, boxed)
            case let _1 as Api.EmojiKeywordsDifference:
                _1.serialize(buffer, boxed)
            case let _1 as Api.HighScore:
                _1.serialize(buffer, boxed)
            case let _1 as Api.TopPeer:
                _1.serialize(buffer, boxed)
            case let _1 as Api.MessageReplyHeader:
                _1.serialize(buffer, boxed)
            case let _1 as Api.SecureValue:
                _1.serialize(buffer, boxed)
            case let _1 as Api.SecureValueHash:
                _1.serialize(buffer, boxed)
            case let _1 as Api.phone.GroupCall:
                _1.serialize(buffer, boxed)
            case let _1 as Api.messages.SearchCounter:
                _1.serialize(buffer, boxed)
            case let _1 as Api.auth.CheckedPhone:
                _1.serialize(buffer, boxed)
            case let _1 as Api.PageListItem:
                _1.serialize(buffer, boxed)
            case let _1 as Api.PeerBlocked:
                _1.serialize(buffer, boxed)
            case let _1 as Api.InputUser:
                _1.serialize(buffer, boxed)
            case let _1 as Api.Page:
                _1.serialize(buffer, boxed)
            case let _1 as Api.SecureCredentialsEncrypted:
                _1.serialize(buffer, boxed)
            case let _1 as Api.StatsPercentValue:
                _1.serialize(buffer, boxed)
            case let _1 as Api.upload.File:
                _1.serialize(buffer, boxed)
            case let _1 as Api.ChannelLocation:
                _1.serialize(buffer, boxed)
            case let _1 as Api.MessageRange:
                _1.serialize(buffer, boxed)
            case let _1 as Api.messages.StickerSetInstallResult:
                _1.serialize(buffer, boxed)
            case let _1 as Api.Config:
                _1.serialize(buffer, boxed)
            case let _1 as Api.TopPeerCategoryPeers:
                _1.serialize(buffer, boxed)
            case let _1 as Api.Game:
                _1.serialize(buffer, boxed)
            case let _1 as Api.ChatAdminRights:
                _1.serialize(buffer, boxed)
            case let _1 as Api.SecurePasswordKdfAlgo:
                _1.serialize(buffer, boxed)
            case let _1 as Api.BotCommand:
                _1.serialize(buffer, boxed)
            case let _1 as Api.account.ContentSettings:
                _1.serialize(buffer, boxed)
            case let _1 as Api.phone.GroupParticipants:
                _1.serialize(buffer, boxed)
            case let _1 as Api.messages.AffectedMessages:
                _1.serialize(buffer, boxed)
            case let _1 as Api.messages.SavedGifs:
                _1.serialize(buffer, boxed)
            case let _1 as Api.CdnPublicKey:
                _1.serialize(buffer, boxed)
            case let _1 as Api.MessageReplies:
                _1.serialize(buffer, boxed)
            case let _1 as Api.InputGame:
                _1.serialize(buffer, boxed)
            case let _1 as Api.help.CountryCode:
                _1.serialize(buffer, boxed)
            case let _1 as Api.InputMessage:
                _1.serialize(buffer, boxed)
            case let _1 as Api.PhoneCallProtocol:
                _1.serialize(buffer, boxed)
            case let _1 as Api.StatsDateRangeDays:
                _1.serialize(buffer, boxed)
            case let _1 as Api.MessageFwdAuthor:
                _1.serialize(buffer, boxed)
            case let _1 as Api.WallPaper:
                _1.serialize(buffer, boxed)
            case let _1 as Api.messages.Messages:
                _1.serialize(buffer, boxed)
            case let _1 as Api.Invoice:
                _1.serialize(buffer, boxed)
            case let _1 as Api.PeerSettings:
                _1.serialize(buffer, boxed)
            case let _1 as Api.auth.SentCode:
                _1.serialize(buffer, boxed)
            case let _1 as Api.InputChatPhoto:
                _1.serialize(buffer, boxed)
            case let _1 as Api.messages.MessageViews:
                _1.serialize(buffer, boxed)
            case let _1 as Api.PaymentCharge:
                _1.serialize(buffer, boxed)
            case let _1 as Api.MessageInteractionCounters:
                _1.serialize(buffer, boxed)
            case let _1 as Api.stats.BroadcastStats:
                _1.serialize(buffer, boxed)
            case let _1 as Api.Updates:
                _1.serialize(buffer, boxed)
            case let _1 as Api.stats.MegagroupStats:
                _1.serialize(buffer, boxed)
            case let _1 as Api.StatsAbsValueAndPrev:
                _1.serialize(buffer, boxed)
            case let _1 as Api.MessageMedia:
                _1.serialize(buffer, boxed)
            case let _1 as Api.PaymentSavedCredentials:
                _1.serialize(buffer, boxed)
            case let _1 as Api.Null:
                _1.serialize(buffer, boxed)
            case let _1 as Api.auth.CodeType:
                _1.serialize(buffer, boxed)
            case let _1 as Api.DocumentAttribute:
                _1.serialize(buffer, boxed)
            case let _1 as Api.BankCardOpenUrl:
                _1.serialize(buffer, boxed)
            case let _1 as Api.account.Authorizations:
                _1.serialize(buffer, boxed)
            case let _1 as Api.ChatPhoto:
                _1.serialize(buffer, boxed)
            case let _1 as Api.PageCaption:
                _1.serialize(buffer, boxed)
            case let _1 as Api.payments.PaymentForm:
                _1.serialize(buffer, boxed)
            case let _1 as Api.payments.PaymentReceipt:
                _1.serialize(buffer, boxed)
            case let _1 as Api.messages.PeerDialogs:
                _1.serialize(buffer, boxed)
            case let _1 as Api.UrlAuthResult:
                _1.serialize(buffer, boxed)
            case let _1 as Api.InputStickerSet:
                _1.serialize(buffer, boxed)
            case let _1 as Api.BotInfo:
                _1.serialize(buffer, boxed)
            case let _1 as Api.updates.State:
                _1.serialize(buffer, boxed)
            case let _1 as Api.FoundGif:
                _1.serialize(buffer, boxed)
            case let _1 as Api.User:
                _1.serialize(buffer, boxed)
            case let _1 as Api.Message:
                _1.serialize(buffer, boxed)
            case let _1 as Api.StatsGroupTopInviter:
                _1.serialize(buffer, boxed)
            case let _1 as Api.messages.RecentStickers:
                _1.serialize(buffer, boxed)
            case let _1 as Api.InputFileLocation:
                _1.serialize(buffer, boxed)
            case let _1 as Api.GeoPoint:
                _1.serialize(buffer, boxed)
            case let _1 as Api.InputPhoneCall:
                _1.serialize(buffer, boxed)
            case let _1 as Api.ReceivedNotifyMessage:
                _1.serialize(buffer, boxed)
            case let _1 as Api.ChatParticipants:
                _1.serialize(buffer, boxed)
            case let _1 as Api.DialogFilter:
                _1.serialize(buffer, boxed)
            case let _1 as Api.InputPaymentCredentials:
                _1.serialize(buffer, boxed)
            case let _1 as Api.ShippingOption:
                _1.serialize(buffer, boxed)
            case let _1 as Api.InputSecureFile:
                _1.serialize(buffer, boxed)
            case let _1 as Api.PostAddress:
                _1.serialize(buffer, boxed)
            case let _1 as Api.InputFolderPeer:
                _1.serialize(buffer, boxed)
            case let _1 as Api.DataJSON:
                _1.serialize(buffer, boxed)
            case let _1 as Api.InputWallPaper:
                _1.serialize(buffer, boxed)
            case let _1 as Api.InputThemeSettings:
                _1.serialize(buffer, boxed)
            case let _1 as Api.InputStickeredMedia:
                _1.serialize(buffer, boxed)
            case let _1 as Api.WebPageAttribute:
                _1.serialize(buffer, boxed)
            case let _1 as Api.messages.FeaturedStickers:
                _1.serialize(buffer, boxed)
            case let _1 as Api.PhoneCallDiscardReason:
                _1.serialize(buffer, boxed)
            case let _1 as Api.NearestDc:
                _1.serialize(buffer, boxed)
            case let _1 as Api.JSONObjectValue:
                _1.serialize(buffer, boxed)
            case let _1 as Api.photos.Photos:
                _1.serialize(buffer, boxed)
            case let _1 as Api.contacts.ImportedContacts:
                _1.serialize(buffer, boxed)
            case let _1 as Api.InputWebDocument:
                _1.serialize(buffer, boxed)
            case let _1 as Api.phone.PhoneCall:
                _1.serialize(buffer, boxed)
            case let _1 as Api.ChannelAdminLogEvent:
                _1.serialize(buffer, boxed)
            case let _1 as Api.Bool:
                _1.serialize(buffer, boxed)
            case let _1 as Api.LangPackString:
                _1.serialize(buffer, boxed)
            case let _1 as Api.InputWebFileLocation:
                _1.serialize(buffer, boxed)
            case let _1 as Api.MessageFwdHeader:
                _1.serialize(buffer, boxed)
            case let _1 as Api.BaseTheme:
                _1.serialize(buffer, boxed)
            case let _1 as Api.help.Support:
                _1.serialize(buffer, boxed)
            case let _1 as Api.MessagesFilter:
                _1.serialize(buffer, boxed)
            case let _1 as Api.messages.Dialogs:
                _1.serialize(buffer, boxed)
            case let _1 as Api.stats.MessageStats:
                _1.serialize(buffer, boxed)
            case let _1 as Api.EmojiKeyword:
                _1.serialize(buffer, boxed)
            case let _1 as Api.upload.CdnFile:
                _1.serialize(buffer, boxed)
            case let _1 as Api.wallet.LiteResponse:
                _1.serialize(buffer, boxed)
            case let _1 as Api.help.InviteText:
                _1.serialize(buffer, boxed)
            case let _1 as Api.BotInlineMessage:
                _1.serialize(buffer, boxed)
            case let _1 as Api.InputPeerNotifySettings:
                _1.serialize(buffer, boxed)
            case let _1 as Api.messages.FavedStickers:
                _1.serialize(buffer, boxed)
            case let _1 as Api.ExportedChatInvite:
                _1.serialize(buffer, boxed)
            case let _1 as Api.account.AuthorizationForm:
                _1.serialize(buffer, boxed)
            case let _1 as Api.Authorization:
                _1.serialize(buffer, boxed)
            case let _1 as Api.MaskCoords:
                _1.serialize(buffer, boxed)
            case let _1 as Api.messages.AllStickers:
                _1.serialize(buffer, boxed)
            case let _1 as Api.PhoneConnection:
                _1.serialize(buffer, boxed)
            case let _1 as Api.help.UserInfo:
                _1.serialize(buffer, boxed)
            case let _1 as Api.AccountDaysTTL:
                _1.serialize(buffer, boxed)
            case let _1 as Api.SecureValueType:
                _1.serialize(buffer, boxed)
            case let _1 as Api.PasswordKdfAlgo:
                _1.serialize(buffer, boxed)
            case let _1 as Api.account.Password:
                _1.serialize(buffer, boxed)
            case let _1 as Api.InputBotInlineResult:
                _1.serialize(buffer, boxed)
            case let _1 as Api.account.PrivacyRules:
                _1.serialize(buffer, boxed)
            case let _1 as Api.PrivacyRule:
                _1.serialize(buffer, boxed)
            case let _1 as Api.MessageAction:
                _1.serialize(buffer, boxed)
            case let _1 as Api.PhoneCall:
                _1.serialize(buffer, boxed)
            case let _1 as Api.help.TermsOfServiceUpdate:
                _1.serialize(buffer, boxed)
            case let _1 as Api.account.AutoDownloadSettings:
                _1.serialize(buffer, boxed)
            case let _1 as Api.DialogPeer:
                _1.serialize(buffer, boxed)
            case let _1 as Api.WebDocument:
                _1.serialize(buffer, boxed)
            case let _1 as Api.Theme:
                _1.serialize(buffer, boxed)
            case let _1 as Api.contacts.Found:
                _1.serialize(buffer, boxed)
            case let _1 as Api.ChannelAdminLogEventsFilter:
                _1.serialize(buffer, boxed)
            case let _1 as Api.ThemeSettings:
                _1.serialize(buffer, boxed)
            case let _1 as Api.PeerNotifySettings:
                _1.serialize(buffer, boxed)
            case let _1 as Api.InputBotInlineMessageID:
                _1.serialize(buffer, boxed)
            case let _1 as Api.PageRelatedArticle:
                _1.serialize(buffer, boxed)
            case let _1 as Api.StickerPack:
                _1.serialize(buffer, boxed)
            case let _1 as Api.UserProfilePhoto:
                _1.serialize(buffer, boxed)
            case let _1 as Api.payments.SavedInfo:
                _1.serialize(buffer, boxed)
            case let _1 as Api.updates.ChannelDifference:
                _1.serialize(buffer, boxed)
            case let _1 as Api.help.CountriesList:
                _1.serialize(buffer, boxed)
            case let _1 as Api.channels.AdminLogResults:
                _1.serialize(buffer, boxed)
            case let _1 as Api.ChatOnlines:
                _1.serialize(buffer, boxed)
            case let _1 as Api.InputAppEvent:
                _1.serialize(buffer, boxed)
            case let _1 as Api.MessageEntity:
                _1.serialize(buffer, boxed)
            case let _1 as Api.InputPhoto:
                _1.serialize(buffer, boxed)
            case let _1 as Api.contacts.TopPeers:
                _1.serialize(buffer, boxed)
            case let _1 as Api.auth.SentCodeType:
                _1.serialize(buffer, boxed)
            case let _1 as Api.PageListOrderedItem:
                _1.serialize(buffer, boxed)
            case let _1 as Api.EncryptedChat:
                _1.serialize(buffer, boxed)
            case let _1 as Api.PeerLocated:
                _1.serialize(buffer, boxed)
            case let _1 as Api.Document:
                _1.serialize(buffer, boxed)
            case let _1 as Api.messages.HighScores:
                _1.serialize(buffer, boxed)
            case let _1 as Api.WebAuthorization:
                _1.serialize(buffer, boxed)
            case let _1 as Api.ImportedContact:
                _1.serialize(buffer, boxed)
            case let _1 as Api.payments.BankCardData:
                _1.serialize(buffer, boxed)
            default:
                break
        }
    }

}
