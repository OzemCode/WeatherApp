//
//  ExtensionImage.swift
//  WeatherApp
//
//  Created by Valentyn Kashkalda on 21.12.2023.
//

import UIKit

extension UIImage {
    func resize(withPercentage percentage: CGFloat) -> UIImage? {
        let newSize = CGSize(width: size.width * percentage, height: size.height * percentage)
        let renderer = UIGraphicsImageRenderer(size: newSize)
        return renderer.image { (context) in
            self.draw(in: CGRect(origin: .zero, size: newSize))
        }
    }
}
