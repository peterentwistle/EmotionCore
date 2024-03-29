//
//  CameraUtil.swift
//  EmotionCore
//
//  Created by gibachan on 2014/10/19.
//  Mmodified by Peter Entwistle on 03/03/2017.
//  Copyright © 2017 Peter Entwistle. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation

@objc public class CameraUtil: NSObject {
    
    // Convert sampleBuffer to UIImage
    public class func imageFromSampleBuffer(_ sampleBuffer: CMSampleBuffer) -> UIImage {
        let imageBuffer: CVImageBuffer! = CMSampleBufferGetImageBuffer(sampleBuffer)
        
        // Lock the base address of the pixel buffer.
        CVPixelBufferLockBaseAddress(imageBuffer, CVPixelBufferLockFlags(rawValue: CVOptionFlags(0)))
        
        // Get the base address of the plane at the specified plane index.
        let baseAddress: UnsafeMutableRawPointer = CVPixelBufferGetBaseAddressOfPlane(imageBuffer, 0)!
        
        let bytesPerRow: Int = CVPixelBufferGetBytesPerRow(imageBuffer)
        let width: Int = CVPixelBufferGetWidth(imageBuffer)
        let height: Int = CVPixelBufferGetHeight(imageBuffer)
        
        // Create RGB colour space
        let colorSpace: CGColorSpace! = CGColorSpaceCreateDeviceRGB()
        
        // Create Bitmap graphic context
        let bitsPerComponent: Int = 8
        let bitmapInfo = CGBitmapInfo(rawValue: (CGBitmapInfo.byteOrder32Little.rawValue | CGImageAlphaInfo.premultipliedFirst.rawValue) as UInt32)
        let newContext: CGContext! = CGContext(data: baseAddress, width: width, height: height, bitsPerComponent: bitsPerComponent, bytesPerRow: bytesPerRow, space: colorSpace, bitmapInfo: bitmapInfo.rawValue) as CGContext!
        
        // QCreate quartz image
        let imageRef: CGImage! = newContext!.makeImage()
        
        // Unlock base address
        CVPixelBufferUnlockBaseAddress(imageBuffer, CVPixelBufferLockFlags(rawValue: CVOptionFlags(0)))
        
        // Create UIImage
        let resultImage: UIImage = UIImage(cgImage: imageRef)
        
        return resultImage
    }
    
}
