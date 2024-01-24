//
//  DataManager.swift
//  WeatherApp
//
//  Created by Valentyn Kashkalda on 26.12.2023.
//

import Foundation

class DataManager {
    static let shared = DataManager()

    var astroData: [WeatherTableSectionModel]?

    private init() {}
}
