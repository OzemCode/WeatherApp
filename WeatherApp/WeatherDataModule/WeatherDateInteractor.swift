//
//  WeatherDateInteractor.swift
//  WeatherApp
//
//  Created by Valentyn Kashkalda on 02.10.2023.
//

import Foundation

protocol WeatherDateInteractorProtocol: AnyObject {
    func getLoaded()
    func updateCityName(_ newName: String)
    func makeCollectionData() -> [WeatherCollectionSectionModel]
    func makeTableData() -> [WeatherTableSectionModel]
}

class WeatherDateInteractor: WeatherDateInteractorProtocol {
    
    // MARK: - Properties
    
    weak var presenter: WeatherDatePresenterProtocol?
    private let apiProvider = APIDataProvider<ApiCases>()
    private var forecastResponse: ForecastResponse?
    
    var defaultName = "Kyiv"
    
    // MARK: - WeatherDateInteractorProtocol Implementation
    
    func updateCityName(_ newName: String) {
        defaultName = newName
    }
    
    func makeTableData() -> [WeatherTableSectionModel] {
        guard let forecastDays = forecastResponse?.forecast.forecastday[0].astro else {
            return []
        }
        
        return [
            .init(items: .sunrise(value: forecastDays.sunrise)),
            .init(items: .sunset(value: forecastDays.sunset)),
            .init(items: .moonrise(value: forecastDays.moonrise)),
            .init(items: .moonset(value: forecastDays.moonset))
        ]
    }
    
    func makeCollectionData() -> [WeatherCollectionSectionModel] {
        guard let current = forecastResponse?.current else {
            return []
        }
        
        return [
            .init(
                items: [
                    .feelslikeItem(.init(feelslikeType: current.feelslike_c)),
                    .pressureItem(.init(pressureType: current.pressure_mb)),
                    .windItem(.init(windType: current.wind_kph, windTypeDegree: current.wind_degree)),
                    .humidityItem(.init(humidityType: current.humidity)),
                    .precipItem(.init(precipeType: current.precip_mm)),
                    .visItem(.init(visType: current.vis_km))
                ])
        ]
    }
    
    func getLoaded() {
        presenter?.didLoadIndicator(true)
        apiProvider.loadJson(
            request: .getCurrentWeather(city: defaultName),
            decodeType: ForecastResponse.self) { [weak self] result in
                guard let self else { return }
                
                switch result {
                case .success(_, let weatherData):
                    
                    self.forecastResponse = weatherData
                    DispatchQueue.main.async {
                        self.presenter?.displayWeatherImage(isDay: weatherData.current.is_day, weatherCondition: weatherData.current.condition.code)
                        self.presenter?.didLoadDate(date: weatherData.location.localtime)
                        self.presenter?.didLoadCityRegion(city: weatherData.location.name, region: weatherData.location.region)
                        self.presenter?.didLoadTemperature(tempC: weatherData.current.temp_c, condition: weatherData.current.condition.text)
                        self.presenter?.didLoadIndicator(false)
                        self.presenter?.didLoadFullImage(false)
                        self.presenter?.didLoadWidget(false)
                    }
                case .failure(_, let error):
                    DispatchQueue.main.async {
                        self.presenter?.didLoadIndicator(false)
                        print(error)
                    }
                }
            }
    }
    
}
