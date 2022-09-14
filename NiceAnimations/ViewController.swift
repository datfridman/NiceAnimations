//
//  ViewController.swift
//  NiceAnimations
//
//  Created by Leon Fridman on 9/12/22.
//

import UIKit
import SpringAnimation

final class ViewController: UIViewController {

    @IBOutlet var animationView: SpringView!
    @IBOutlet var presetLabel: UILabel!
    @IBOutlet var curveLabel: UILabel!
    @IBOutlet var forceLabel: UILabel!
    @IBOutlet var durationLabel: UILabel!
    @IBOutlet var delayLabel: UILabel!
    @IBOutlet var startAnimationButton: SpringButton!
    
    
    @IBAction func startAnimationButtonPressed(_ sender: SpringButton) {
        
        animationView.animation = presetLabel.text ?? "pop"
        animationView.curve = curveLabel.text ?? "ease"
        animationView.force = Double(forceLabel.text!) ?? 1.0
        animationView.duration = Double(durationLabel.text!) ?? 1.5
        animationView.delay = Double(delayLabel.text!) ?? 0.5
        animationView.animate()
        
        
        DispatchQueue.main.asyncAfter(deadline: .now() + animationView.delay + animationView.duration) {
            let nextAnimation = Animation.getRandomAnimation()
            
            self.presetLabel.text = nextAnimation.animation
            self.curveLabel.text = nextAnimation.curves
            self.forceLabel.text = String(format: "%.1f", nextAnimation.force)
            self.durationLabel.text = String(format: "%.2f", nextAnimation.duration)
            self.delayLabel.text = String(format: "%.2f", nextAnimation.delay)
            
            self.startAnimationButton.setTitle("Start \( self.presetLabel.text ?? "Lol")", for: .normal)
        }
        
    }
}

