//
//  ActivityIndicatorAnimationBallClipRotateMultiple.swift
//  AnimationSwiftSample
//
//  Created by leo.chang on 11/6/15.
//  Copyright © 2015 MagV. All rights reserved.
//

import UIKit

class ActivityIndicatorAnimationBallClipRotateMultiple: ActivityIndicatorAnimationDelegate {
    
    func setUpAnimationLayer(layer: CALayer, size: CGSize, color: UIColor) {
        let bigCircleSize : CGFloat = size.width
        let smallCircleSize : CGFloat = size.width/2
        let longDuration : CFTimeInterval = 1
        let timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        
        circleOf(shape: .RingTwoHalfHorizontal, duration: longDuration, timingFunction: timingFunction, layer: layer, size: CGSize(width: bigCircleSize, height: bigCircleSize), color: color, reverse: false)
        
        circleOf(shape: .RingTwoHalfVertical, duration: longDuration, timingFunction: timingFunction, layer: layer, size: CGSize(width: smallCircleSize, height: smallCircleSize), color: color, reverse: true)
    }

    func createAnimationIn(duration : CFTimeInterval, timingFunction : CAMediaTimingFunction, reverse : Bool) -> CAAnimation {
        let scaleAnimation = CAKeyframeAnimation(keyPath: "transform.scale")
        scaleAnimation.keyTimes = [0, 0.5, 1]
        scaleAnimation.values = [1, 0.6, 1]
        scaleAnimation.duration = duration
        
        let rotateAnimation = CAKeyframeAnimation(keyPath: "transform.rotation.z")
        rotateAnimation.keyTimes = scaleAnimation.keyTimes
        rotateAnimation.timingFunctions = [timingFunction, timingFunction]
        if (!reverse) {
            rotateAnimation.values = [0, M_PI, 2 * M_PI]
        }
        else {
            rotateAnimation.values = [0, -M_PI, -2 * M_PI]
        }
        
        rotateAnimation.duration = duration
        
        let animation = CAAnimationGroup()
        
        animation.animations = [scaleAnimation, rotateAnimation]
        animation.duration = duration
        animation.repeatCount = HUGE
        animation.removedOnCompletion = false
        
        return animation
    }
    
    func circleOf(shape shape : ActivityIndicatorShape, duration : CFTimeInterval, timingFunction : CAMediaTimingFunction, layer : CALayer, size : CGSize, color : UIColor, reverse : Bool) {
        let circle = shape.createLayerWith(size, color: color)
        let frame = CGRect(x: (CGRectGetWidth(layer.bounds) - size.width)/2, y: (CGRectGetHeight(layer.bounds) - size.height)/2, width: size.width, height: size.height)
        
        let animation = createAnimationIn(duration, timingFunction: timingFunction, reverse: reverse)
        
        circle.frame = frame
        circle.addAnimation(animation, forKey: "animation")
        layer.addSublayer(circle)
    }
}
