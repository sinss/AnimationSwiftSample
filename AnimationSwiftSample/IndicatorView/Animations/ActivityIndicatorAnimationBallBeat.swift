//
//  ActivityIndicatorAnimationBallBeat.swift
//  AnimationSwiftSample
//
//  Created by leo.chang on 11/6/15.
//  Copyright © 2015 MagV. All rights reserved.
//

import UIKit

class ActivityIndicatorAnimationBallBeat: ActivityIndicatorAnimationDelegate {
    
    func setUpAnimationLayer(layer: CALayer, size: CGSize, color: UIColor) {
        let circleSpacing : CGFloat = 2
        let circleSize = (size.width - circleSpacing * 2) / 3
        let x = (CGRectGetWidth(layer.bounds) - size.width) / 2
        let y = (CGRectGetHeight(layer.bounds) - circleSize) / 2
        let duration : CFTimeInterval = 0.7
        let beginTime = CACurrentMediaTime()
        let beginTimes = [0.35, 0, 0.35]
        
        //Scale animation
        let scaleAnimation = CAKeyframeAnimation(keyPath: "transform.scale")
        scaleAnimation.keyTimes = [0, 0.5, 1]
        scaleAnimation.values = [1, 0.75, 1]
        scaleAnimation.duration = duration
        
        //Opacity animation
        let opacityAnimation = CAKeyframeAnimation(keyPath: "opacity")
        opacityAnimation.keyTimes = [0, 0.5, 1]
        opacityAnimation.values = [1, 0.2, 1]
        opacityAnimation.duration = duration
        
        let animation = CAAnimationGroup()
        animation.animations = [scaleAnimation, opacityAnimation]
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
        animation.duration = duration
        animation.repeatCount = HUGE
        animation.removedOnCompletion = false
        
        for var i = 0; i < 3; i++ {
            let circle = ActivityIndicatorShape.Circle.createLayerWith(CGSize(width: circleSize, height: circleSize), color: color)
            let frame = CGRect(x: x + circleSize * CGFloat(i) + circleSpacing * CGFloat(i),
                y: y, width: circleSize, height: circleSize)
            animation.beginTime = beginTime - beginTimes[i]
            circle.frame = frame
            circle.addAnimation(animation, forKey: "animation")
            layer.addSublayer(circle)
        }
    }
}
