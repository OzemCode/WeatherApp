//
//  WeatherCollectionModels.swift
//  WeatherApp
//
//  Created by Valentyn Kashkalda on 13.12.2023.
//

import Foundation

enum WeatherCollectionItem {
    case humidityItem(_ input: CustomCellHumidity.Input)
    case feelslikeItem(_ input: CustomCellFeelslike.Input)
    case windItem(_ input: CustomCellWind.Input)
    case pressureItem(_ input: CustomCellPressure.Input)
    case precipItem(_ input: CustomCellPrecip.Input)
    case visItem(_ input: CustomCellVis.Input)
}

struct WeatherCollectionSectionModel {
    let items: [WeatherCollectionItem]
}
