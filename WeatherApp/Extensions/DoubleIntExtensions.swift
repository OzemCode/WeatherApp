//
//  DoubleExtensions.swift
//  WeatherApp
//
//  Created by Valentyn Kashkalda on 14.12.2023.
//

import UIKit

extension Double {
    var rounded: Int {
        if self - floor(self) >= 0.5 {
            return Int(ceil(self))
        } else {
            return Int(floor(self))
        }
    }
}

extension Int {
    static var random: Int {
        return Int(arc4random_uniform(11))
    }
}
