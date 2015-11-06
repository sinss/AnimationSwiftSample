//
//  ActivityIndicatorType.swift
//  AnimationSwiftSample
//
//  Created by leo.chang on 11/6/15.
//  Copyright © 2015 MagV. All rights reserved.
//

import Foundation

public enum ActivityIndicatorType {
    case Blank
    case BallPulse
    case BallGridPulse
    case BallClipRotate
    case SquareSpin
    case BallClipRotatePulse
    case BallClipRotateMultiple
    case BallPulseRise
    case BallRotate
    case CubeTransition
    case BallZigZag
    case BallZigBagDeflect
    case BallTrianglePath
    case BallScale
    case LineScale
    case LineScaleParty
    case BallScaleMultiple
    case BallPulseSync
    case BallBeat
    case LineScalePulseOut
    case LineScalePulseOutRapid
    case BallScaleRipple
    case BallScaleRippleMultiple
    case BallSpinFadeLoader
    case LineSpinFadeLoader
    case TriangleSkewSpin
    case Pacman
    case BallGridBeat
    case SemCircleSpin
    
    public func animation() -> ActivityIndicatorAnimationDelegate {
        switch self {
        case .BallBeat:
            return ActivityIndicatorAnimationBallBeat()
        case .BallClipRotate:
            return ActivityIndicatorAnimationBallClipRotate()
        case .SquareSpin:
            return ActivityIndicatorAnimationSquareSpin()
        case .BallClipRotateMultiple:
            return ActivityIndicatorAnimationBallClipRotateMultiple()
        default:
            return ActivityIndicatorAnimationBallBeat()
        }
    }
}

