import Foundation
import UIKit
import AVFoundation
import SwiftSignalKit

private final class SampleBufferLayerImplNullAction: NSObject, CAAction {
    @objc func run(forKey event: String, object anObject: Any, arguments dict: [AnyHashable : Any]?) {
    }
}

private final class SampleBufferLayerImpl: AVSampleBufferDisplayLayer {
    override func action(forKey event: String) -> CAAction? {
        return SampleBufferLayerImplNullAction()
    }
}

public final class SampleBufferLayer {
    public let layer: AVSampleBufferDisplayLayer
    private let enqueue: (AVSampleBufferDisplayLayer) -> Void
    
    public var isFreed: Bool = false
    fileprivate init(layer: AVSampleBufferDisplayLayer, enqueue: @escaping (AVSampleBufferDisplayLayer) -> Void) {
        self.layer = layer
        self.enqueue = enqueue
    }
    
    deinit {
        if !self.isFreed {
            self.enqueue(self.layer)
        }
    }
}

private let pool = Atomic<[AVSampleBufferDisplayLayer]>(value: [])

private var addToPoolInProgress = Atomic<Bool>(value: false)

public func clearSampleBufferLayerPoll() {
    let _ = pool.modify { _ in return [] }
}

public func takeSampleBufferLayer() -> SampleBufferLayer {
    var layer: AVSampleBufferDisplayLayer?
    let _ = pool.modify { list in
        var list = list
        if !list.isEmpty {
            layer = list.removeLast()
        }
        return list
    }
    if layer == nil {
        layer = SampleBufferLayerImpl()
    }
    
    let _ = addToPoolInProgress.modify { inProgress in
        if inProgress { return inProgress }
        return addToPoolIfNeeded()
    }
    
    return SampleBufferLayer(layer: layer!, enqueue: { layer in
        Queue.mainQueue().async {
            layer.flushAndRemoveImage()
            layer.setAffineTransform(CGAffineTransform.identity)
            if #available(iOS 13.0, *) {
                layer.preventsCapture = false
                layer.preventsDisplaySleepDuringVideoPlayback = true
            }
            #if targetEnvironment(simulator)
            #else
            let _ = pool.modify { list in
                var list = list
                list.append(layer)
                return list
            }
            #endif
        }
    })
}

private func addToPoolIfNeeded() -> Bool {
    #if targetEnvironment(simulator)
    return false
    #else
    let maximumPoolSize = 8
    var poolSize = pool.with({ layers in layers.count })
    if poolSize >= maximumPoolSize {
        return false
    }
    Queue(name: "SampleBufferLayerQueue").async {
        while poolSize < maximumPoolSize {
            let layer = SampleBufferLayerImpl()
            let _ = pool.modify { list in
                var list = list
                list.append(layer)
                poolSize = list.count
                return list
            }
        }
        let _ = addToPoolInProgress.modify { _ in
            return false
        }
    }
    return true
    #endif
}
