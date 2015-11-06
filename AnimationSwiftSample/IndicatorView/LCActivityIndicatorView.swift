//
//  LCActivityIndicatorView.swift
//  AnimationSwiftSample
//
//  Created by leo.chang on 11/6/15.
//  Copyright © 2015 MagV. All rights reserved.
//

import UIKit

struct Settings {
    private static let DEFAULT_TYPE = ActivityIndicatorType.BallBeat
    private static let DEFAULT_COLOR = UIColor.whiteColor()
    private static let DEFAULT_SIZE : CGSize = CGSize(width: 40, height: 40)
}

public class LCActivityIndicatorView: UIView {

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    
    
    private var IndicatorType : ActivityIndicatorType
    private var color : UIColor
    private var size : CGSize
    
    var animating : Bool = false
    var hidesWhenStopped : Bool = true
    
    required public init?(coder aDecoder: NSCoder) {
        self.IndicatorType = Settings.DEFAULT_TYPE
        self.color = Settings.DEFAULT_COLOR
        self.size = Settings.DEFAULT_SIZE
        super.init(coder: aDecoder)
        
        self.backgroundColor = UIColor.clearColor()
    }
    
    public init (frame : CGRect, type : ActivityIndicatorType = Settings.DEFAULT_TYPE, color : UIColor = Settings.DEFAULT_COLOR, size : CGSize = Settings.DEFAULT_SIZE) {
        self.IndicatorType = type
        self.color = color
        self.size = size
        super.init(frame: frame)
    }

    //MARK: Start / Stop animation
    public func startAnimation() {
        if hidesWhenStopped && hidden {
            hidden = false
        }
        
        if (self.layer.sublayers == nil) {
            setupAnimation()
        }
        self.layer.speed = 1
        self.animating = true
    }
    
    public func stopAnimation() {
        self.layer.speed = 0
        self.animating = false
        if hidesWhenStopped && !hidden {
            hidden = true
        }
    }
    
    //MARK: Private methods
    private func setupAnimation() {
        let animation : protocol<ActivityIndicatorAnimationDelegate> = self.IndicatorType.animation()
        self.layer.sublayers = nil;
        
        animation.setUpAnimationLayer(self.layer, size: self.size, color: self.color)
    }
}
