//
//  DetectedEmotion.swift
//  EmotionCore
//
//  Created by Peter Entwistle on 08/01/2017.
//  Copyright © 2017 Peter Entwistle. All rights reserved.
//

@objc public class DetectedEmotion: NSObject {
    private var _frame: UIImage
    private var _emotion: Emotion
    
    public var frame: UIImage {
        return _frame
    }
    
    public var emotion: Emotion {
        return _emotion
    }
    
    public init(frame: UIImage, emotion: Emotion) {
        _frame = frame
        _emotion = emotion
    }
    
}
