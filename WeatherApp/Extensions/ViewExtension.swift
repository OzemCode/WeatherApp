//
//  ViewExtension.swift
//  WeatherApp
//
//  Created by Valentyn Kashkalda on 25.12.2023.
//

import UIKit

extension UIView {
    func addBlurEffect(_ style: UIBlurEffect.Style = .light, alpha: CGFloat = 1.0) {
        let blurEffect = UIBlurEffect(style: style)
        let blurView = UIVisualEffectView(effect: blurEffect)
        blurView.alpha = alpha
        blurView.frame = bounds
        blurView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        insertSubview(blurView, at: 0)
    }

    func removeBlurEffect() {
        for subview in subviews {
            if subview is UIVisualEffectView {
                subview.removeFromSuperview()
            }
        }
    }
}
