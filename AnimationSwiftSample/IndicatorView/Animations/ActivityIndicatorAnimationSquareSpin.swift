//
//  ActivityIndicatorAnimationSquareSpin.swift
//  AnimationSwiftSample
//
//  Created by leo.chang on 11/6/15.
//  Copyright © 2015 MagV. All rights reserved.
//

import UIKit

class ActivityIndicatorAnimationSquareSpin: ActivityIndicatorAnimationDelegate {
    
    func setUpAnimationLayer(layer: CALayer, size: CGSize, color: UIColor) {
        let duration : CFTimeInterval = 3
        let timingFunction = CAMediaTimingFunction(controlPoints: 0.09, 0.57, 0.49, 0.9)
        
        //animation
        let animation = CAKeyframeAnimation(keyPath: "transform")
        
        animation.keyTimes = [0, 0.25, 0.5, 0.75, 1]
        animation.timingFunctions = [timingFunction, timingFunction, timingFunction, timingFunction]
        animation.values = [
            NSValue(CATransform3D: CATransform3DConcat(createRotateXTransform(angle: 0), createRotateYTransform(angle: 0))),
            NSValue(CATransform3D: CATransform3DConcat(createRotateXTransform(angle: CGFloat(M_PI)), createRotateYTransform(angle: 0))),
            NSValue(CATransform3D: CATransform3DConcat(createRotateXTransform(angle: CGFloat(M_PI)), createRotateYTransform(angle: CGFloat(M_PI)))),
            NSValue(CATransform3D: CATransform3DConcat(createRotateXTransform(angle: 0), createRotateYTransform(angle: CGFloat(M_PI)))),
            NSValue(CATransform3D: CATransform3DConcat(createRotateXTransform(angle: 0), createRotateYTransform(angle: 0)))
        ]
        
        animation.duration = duration
        animation.repeatCount = HUGE
        animation.removedOnCompletion = false
        
        //Draw square
        let square = ActivityIndicatorShape.Retangle.createLayerWith(size, color: color)
        let frame = CGRect(x: (CGRectGetWidth(layer.bounds) - size.width)/2, y: (CGRectGetHeight(layer.bounds) - size.height)/2, width: size.width, height: size.height)
        
        square.frame = frame
        square.addAnimation(animation, forKey: "animation")
        layer.addSublayer(square)
    }
    
    func createRotateXTransform(angle angle: CGFloat) -> CATransform3D {
        var transform = CATransform3DMakeRotation(angle, 1, 0, 0)
        
        transform.m34 = CGFloat(-1) / 100
        
        return transform
    }
    
    func createRotateYTransform(angle angle: CGFloat) -> CATransform3D {
        var transform = CATransform3DMakeRotation(angle, 0, 1, 0)
        
        transform.m34 = CGFloat(-1) / 100
        
        return transform
    }
}
