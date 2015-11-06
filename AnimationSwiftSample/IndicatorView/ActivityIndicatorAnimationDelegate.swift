//
//  ActivityIndicatorAnimationDelegate.swift
//  AnimationSwiftSample
//
//  Created by leo.chang on 11/6/15.
//  Copyright © 2015 MagV. All rights reserved.
//

import UIKit

public protocol ActivityIndicatorAnimationDelegate {
    
    func setUpAnimationLayer(layer : CALayer, size : CGSize, color : UIColor)
}