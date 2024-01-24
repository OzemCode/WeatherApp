//
//  CreateUILabel.swift
//  WeatherApp
//
//  Created by Valentyn Kashkalda on 03.10.2023.
//

import UIKit

class CustomWeatherLabel: UILabel {
    
    init(of size: CGFloat, font weight: UIFont.Weight, _ textAlign: NSTextAlignment = .center) {
        super.init(frame: .zero)
        
        font = .systemFont(ofSize: size, weight: weight)
        textColor = .white
        
        backgroundColor = .clear
        textAlignment = textAlign
        numberOfLines = 0
        sizeToFit()
        translatesAutoresizingMaskIntoConstraints = false
        adjustsFontSizeToFitWidth = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}

