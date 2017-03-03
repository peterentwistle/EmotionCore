//
//  DetectedResult.swift
//  EmotionCore
//
//  Created by Peter Entwistle on 08/01/2017.
//  Copyright © 2017 Peter Entwistle. All rights reserved.
//

@objc public class DetectedResult: NSObject {
    private var _detectedEmotion: DetectedEmotion
    private var _frame: UIImage
    
    public var detectedEmotion: DetectedEmotion? {
        return _detectedEmotion
    }
    
    public var frame: UIImage? {
        return _frame
    }
    
    public init(detectedEmotion: DetectedEmotion, frame: UIImage) {
        _detectedEmotion = detectedEmotion
        _frame = frame
    }
    
}
