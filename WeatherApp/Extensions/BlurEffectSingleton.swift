//
//  BlurEffectSingleton.swift
//  WeatherApp
//
//  Created by Valentyn Kashkalda on 25.12.2023.
//

import UIKit

class BlurEffectSingleton {
    
    static let shared = BlurEffectSingleton()
    
    private var blurView: UIVisualEffectView?
    
    private init() {
        setupBlurEffect()
    }
    
    private func setupBlurEffect() {
        let blurEffect = UIBlurEffect(style: .light)
        blurView = UIVisualEffectView(effect: blurEffect)
        blurView?.frame = UIScreen.main.bounds
    }
    
    func addBlurEffect(to view: UIView) {
        guard let blurView = blurView else { return }
        view.addSubview(blurView)
        view.sendSubviewToBack(blurView)
    }
}
