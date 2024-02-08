//
//  CustomColor.swift
//  WeatherApp
//
//  Created by Valentyn Kashkalda on 13.12.2023.
//

import UIKit

extension UIColor {
    static var customClear: UIColor {
        return #colorLiteral(red: 0.3106688261, green: 0.4022356272, blue: 0.5015692115, alpha: 0.3084385348)
    }
    
    static var customGray: UIColor {
        return #colorLiteral(red: 0.8277774453, green: 0.8432546258, blue: 0.8830294609, alpha: 1)
    }
}

extension UIColor {
    
    static var gradientColorDay: UIColor {
        let colorFirst = #colorLiteral(red: 0.1441877484, green: 0.3635602295, blue: 1, alpha: 1)
        let colorSecond = #colorLiteral(red: 0.1891328692, green: 0.6866943836, blue: 0.8649599552, alpha: 1)
        return gradientColor(from: colorFirst, to: colorSecond)
    }
    
    static var gradientColorNight: UIColor {
        let colorFirst = #colorLiteral(red: 0.3947219849, green: 0.3745799661, blue: 0.3120832145, alpha: 1)
        let colorSecond = #colorLiteral(red: 0.1856258214, green: 0.1856258214, blue: 0.1856258214, alpha: 1)
        return gradientColor(from: colorFirst, to: colorSecond)
    }
    
    static func gradientColor(from startColor: UIColor,
                              to endColor: UIColor,
                              with locations: [NSNumber] = [0.1, 0.8],
                              size: CGSize = UIScreen.main.bounds.size) -> UIColor {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [startColor.cgColor, endColor.cgColor]
        gradientLayer.locations = locations
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
        gradientLayer.frame = CGRect(origin: .zero, size: size)

        UIGraphicsBeginImageContext(size)
        guard let context = UIGraphicsGetCurrentContext() else { return startColor }

        gradientLayer.render(in: context)
        guard let image = UIGraphicsGetImageFromCurrentImageContext() else { return startColor }

        UIGraphicsEndImageContext()

        return UIColor(patternImage: image)
    }
}


