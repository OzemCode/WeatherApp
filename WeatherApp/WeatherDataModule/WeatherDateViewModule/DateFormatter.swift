//
//  DateFormatter.swift
//  WeatherApp
//
//  Created by Valentyn Kashkalda on 03.12.2023.
//

import Foundation

extension DateFormatter {
    static func dateFormat() -> DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yyyy"
        return formatter
    }
    
    static func timeFormat() -> DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        return formatter
    }
}
