//
//  UILabelExtensions.swift
//  WeatherApp
//
//  Created by Valentyn Kashkalda on 26.01.2024.
//

import UIKit

import UIKit

extension UILabel {
    func setAttributedTextWithImageLeft(_ text: String, imageName: String) {
        let attachment = NSTextAttachment()
        attachment.image = UIImage(named: imageName)

        let attachmentString = NSAttributedString(attachment: attachment)
        let spaceString = NSAttributedString(string: " ")

        let updatedString = NSMutableAttributedString()
        updatedString.append(attachmentString)
        updatedString.append(spaceString)
        updatedString.append(NSAttributedString(string: text))

        attributedText = updatedString
    }
}

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

extension UILabel {
    func addMetricSymbol(_ ofSize: CGFloat, _ color: UIColor = .white) {
        text = "°"
        textColor = color
        font = .systemFont(ofSize: ofSize)
    }
}

