//
//  ApiCases.swift
//  WeatherApp
//
//  Created by George Churikov on 06.01.2024.
//

import Foundation

enum ApiHttpMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
}


enum Methods: String {
    case get
    case post
    
    var methodTitle: String {
        return rawValue.uppercased()
    }
}

enum ApiCases {
    case getCurrentWeather(city: String)
    
    
}

extension ApiCases {
    var baseURL: String {
        return "https://api.weatherapi.com/v1/"
    }
    
    var apiKey: String {
        return "7c4883e131a64fa4bd9202044232809"
    }
    
    var path: String {
        switch self {
        case .getCurrentWeather:
            return "forecast.json"
        }
    }
}

extension ApiCases: APIDataRequest {
    var body: [String: Any]? {
        nil
    }
    
    var parameters: [String: Any]? {
        switch self {
        case .getCurrentWeather(let city):
            return ["key": apiKey, "q": city, "aqi": "no"]
        }
    }
    
    var headers: [String : String]? {
        [:]
    }
    
    var method: ApiHttpMethod {
        .get
    }
    
    
}
