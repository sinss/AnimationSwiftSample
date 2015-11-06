//
//  ViewController.swift
//  AnimationSwiftSample
//
//  Created by leo.chang on 11/6/15.
//  Copyright © 2015 MagV. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let width : CGFloat = CGFloat(100)
        let height : CGFloat = CGFloat(100)
        var x : CGFloat = CGFloat(0)
        var y : CGFloat = CGFloat(0)
        
        var frame = CGRect(x: x, y: y, width: width, height: height)
        var activityIndicator = LCActivityIndicatorView(frame: frame, type: .BallBeat)
        activityIndicator.startAnimation()
        
        self.view.addSubview(activityIndicator)
        
        x = x + 5 + width
        
        frame = CGRect(x: x, y: y, width: width, height: height)
        activityIndicator = LCActivityIndicatorView(frame: frame, type: .BallClipRotate)
        activityIndicator.startAnimation()
        
        self.view.addSubview(activityIndicator)
        
        x = x + 5 + width
        
        frame = CGRect(x: x, y: y, width: width, height: height)
        activityIndicator = LCActivityIndicatorView(frame: frame, type: .BallClipRotateMultiple)
        activityIndicator.startAnimation()
        
        self.view.addSubview(activityIndicator)
        
        x = 0
        y = y + 5 + height
        
        frame = CGRect(x: x, y: y, width: width, height: height)
        activityIndicator = LCActivityIndicatorView(frame: frame, type: .SquareSpin)
        activityIndicator.startAnimation()
        
        self.view.addSubview(activityIndicator)
        
        self.view.backgroundColor = UIColor.redColor()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

