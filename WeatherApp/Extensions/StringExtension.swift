//
//  StringExtension.swift
//  WeatherApp
//
//  Created by Valentyn Kashkalda on 26.01.2024.
//

import Foundation

extension String {
    func formatDateTime() -> (date: String?, time: String?) {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"
        
        if let dateTime = dateFormatter.date(from: self) {
            dateFormatter.dateFormat = "E, d MMMM"
            let formattedDate = dateFormatter.string(from: dateTime)
            
            dateFormatter.dateFormat = "HH:mm"
            let formattedTime = dateFormatter.string(from: dateTime)
            
            return (date: formattedDate, time: formattedTime)
        }
        
        return (date: nil, time: nil)
    }
}
