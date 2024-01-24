//
//  WeatherTableModels.swift
//  WeatherApp
//
//  Created by Valentyn Kashkalda on 25.12.2023.
//

import Foundation

enum WeatherTableItem {
    case sunrise(value: String)
    case sunset(value: String)
    case moonrise(value: String)
    case moonset(value: String)
}

struct WeatherTableSectionModel {
    let items: WeatherTableItem
}


