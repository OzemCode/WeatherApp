//
//  UIlabelExtensions.swift
//  WeatherApp
//
//  Created by Valentyn Kashkalda on 15.12.2023.
//

import UIKit

extension UILabel {
    func setAttributedText(bigText: String, smallText: String, bigSize: CGFloat = 26, smallSize: CGFloat = 14) {
        let labelText = "\(bigText) \(smallText)"
        let attributedText = NSMutableAttributedString(string: labelText)
        
        let bigTextRange = (labelText as NSString).range(of: bigText)
        let bigTextAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: bigSize, weight: .bold),
        ]
        attributedText.addAttributes(bigTextAttributes, range: bigTextRange)

        let smallTextRange = (labelText as NSString).range(of: smallText)
        let smallTextAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: smallSize, weight: .semibold),
        ]
        attributedText.addAttributes(smallTextAttributes, range: smallTextRange)
        self.attributedText = attributedText
    }
}

extension UILabel {
    func configureCustomLabel(_ text: String?) {
        self.text = text
        textColor = .white
        textAlignment = .left
        adjustsFontSizeToFitWidth = true
        numberOfLines = 0
    }
}

