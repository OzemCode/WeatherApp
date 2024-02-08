//
//  WeatherMapper.swift
//  WeatherApp
//
//  Created by Valentyn Kashkalda on 19.12.2023.
//

import Foundation

class WeatherMapper {
    static func mapWeatherConditionToCategory(conditionCode: Int) -> String {
        switch conditionCode {
        case 1000, 113:
            return "clear"
        case 1003, 116, 1006, 119:
            return "cloud"
        case 1009, 1030, 1063, 1066, 1069, 1072, 1147, 1135:
            return "lightCloud"
        case 1180, 1183, 1186, 1189, 1192, 1195, 1198, 1201, 1204, 1207, 1153:
            return "lightRain"
        case 1240, 1243, 1246, 1249, 1252, 1258, 1261, 1264, 1168, 1171, 1150:
            return "rain"
        case 1114, 1117, 1216, 1219, 1222, 1225, 1237, 1213, 1210, 1255:
            return "snow"
        case 1087, 1273, 1276, 1279, 1282:
            return "thunder"
        default:
            return "unknown"
        }
    }
}
