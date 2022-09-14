//
//  Animation.swift
//  NiceAnimations
//
//  Created by Leon Fridman on 9/13/22.
//

import Foundation
import SpringAnimation


struct Animation {
    let animation: String
    let curves: String
    let force: Double
    let duration: Double
    let delay: Double
}


extension Animation {
static func getRandomAnimation() -> Animation {
    let randomAnimation: Animation
    let animationPresets = AnimationPreset.allCases.shuffled()
    let animationCurves = AnimationCurve.allCases.shuffled()
    
    randomAnimation = Animation(
        animation: animationPresets[0].rawValue,
        curves: animationCurves[0].rawValue,
        force: Double.random(in: 1..<1.5),
        duration: Double.random(in: 0..<1.5),
        delay: Double.random(in: 0..<0.5)
    )
    return randomAnimation
}
}
