//
//  UIImageViewExtensions.swift
//  WeatherApp
//
//  Created by Valentyn Kashkalda on 25.01.2024.
//

import UIKit
import SwiftyGif

extension UIImageView {
    func setGifImage(named imageName: String, withExtension extensionName: String = "gif") {
        if let gifURL = Bundle.main.url(forResource: imageName, withExtension: extensionName),
           let gifData = try? Data(contentsOf: gifURL),
           let gif = try? UIImage(gifData: gifData) {
            self.setGifImage(gif)
        }
    }
}
