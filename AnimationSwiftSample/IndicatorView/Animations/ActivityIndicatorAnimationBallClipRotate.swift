//
//  ActivityIndicatorAnimationBallClipRotate.swift
//  AnimationSwiftSample
//
//  Created by leo.chang on 11/6/15.
//  Copyright © 2015 MagV. All rights reserved.
//

import UIKit

class ActivityIndicatorAnimationBallClipRotate: ActivityIndicatorAnimationDelegate {
    func setUpAnimationLayer(layer: CALayer, size: CGSize, color: UIColor) {
        let duration : CFTimeInterval = 0.75
        
        //scale animation
        let scaleAnimation = CAKeyframeAnimation(keyPath: "transform.scale")
        scaleAnimation.keyTimes = [0, 0.5, 1]
        scaleAnimation.values = [1, 0.6, 1]
        
        //Rotate animation
        let rotateAnimation = CAKeyframeAnimation(keyPath: "transform.rotation.z")
        rotateAnimation.keyTimes = scaleAnimation.keyTimes
        rotateAnimation.values = [0, M_PI, 2 * M_PI]
        
        //animation
        let animation = CAAnimationGroup()
        
        animation.animations = [scaleAnimation, rotateAnimation]
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
        animation.duration = duration
        animation.repeatCount = HUGE
        animation.removedOnCompletion = false
        
        //draw circle
        let circle = ActivityIndicatorShape.RingThirdFour.createLayerWith(CGSize(width: size.width, height: size.height), color: color)
        let frame = CGRect(x: (CGRectGetWidth(layer.bounds) - size.width) / 2, y: (CGRectGetHeight(layer.bounds) - size.height) / 2, width: size.width, height: size.height)
        
        circle.frame = frame
        circle.addAnimation(animation, forKey: "animation")
        layer.addSublayer(circle)
    }
}
