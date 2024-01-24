//
//  Dictionary.swift
//  WeatherApp
//
//  Created by George Churikov on 06.01.2024.
//

import Foundation

extension Dictionary {
    var jsonData: Data? {
        return try? JSONSerialization.data(withJSONObject: self, options: [.prettyPrinted])
    }
    
}
