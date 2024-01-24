//
//  ImageViewExtension.swift
//  WeatherApp
//
//  Created by Valentyn Kashkalda on 16.12.2023.
//

import UIKit

extension UIImageView {
    func resize(newSize: CGFloat) {
        guard var image = self.image else { return }

        let aspectRatio = image.size.width / image.size.height
        let newWidth = newSize
        let newHeight = newSize / aspectRatio
        
        UIGraphicsBeginImageContextWithOptions(CGSize(width: newWidth, height: newHeight), false, 0.0)
        image.draw(in: CGRect(x: 0, y: 0, width: newWidth, height: newHeight))
        image = UIGraphicsGetImageFromCurrentImageContext() ?? UIImage()
        UIGraphicsEndImageContext()
        
        self.image = image
        let frame = self.frame
        self.frame = CGRect(x: frame.origin.x, y: frame.origin.y, width: newWidth, height: newHeight)
    }
}
