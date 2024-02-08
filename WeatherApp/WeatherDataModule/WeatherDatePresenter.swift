//
//  File.swift
//  WeatherApp
//
//  Created by Valentyn Kashkalda on 02.10.2023.
//

import UIKit

protocol WeatherDatePresenterProtocol: AnyObject {
    func viewDidLoaded()
    func didLoadTemperature(tempC: Double, condition: String)
    func didLoadCityRegion(city: String, region: String)
    func didLoadIndicator(_ isShow: Bool)
    func didLoadFullImage(_ isShow: Bool)
    func didLoadWidget(_ isShow: Bool)
    func updateCityName(_ newName: String)
    func navigateToNewScreen()
    func navigateToAstroScreen()
    func didLoadDate(date: String)
    func displayWeatherImage(isDay: Int, weatherCondition: Int)
    func saveLastCityName(_ cityName: String)
    
}

class WeatherDatePresenter {
    weak var view: WeatherDateViewProtocol?
    var router: WeatherDateRouterProtocol
    var interactor: WeatherDateInteractorProtocol
    
    // MARK: - WeatherDatePresenterProtocol Implementation
    
    init(router: WeatherDateRouterProtocol, interactor: WeatherDateInteractorProtocol) {
        self.router = router
        self.interactor = interactor
    }
}

extension WeatherDatePresenter: WeatherDatePresenterProtocol {
        
    func displayWeatherImage(isDay: Int, weatherCondition: Int) {
        var imageName = ""
        var color = UIColor()
        let weatherCode = WeatherMapper.mapWeatherConditionToCategory(conditionCode: weatherCondition)
        
        if isDay == 0 {
            imageName += "night"
            color = .gradientColorNight
        } else {
            imageName += "day"
            color = .gradientColorDay
        }
        
        imageName += weatherCode
        view?.backgroundImage(image: imageName, color)
    }
    func didLoadWidget(_ isShow: Bool) {
        view?.showLoaderWidget(isShow)
    }
    
    func viewDidLoaded() {
        if let lastCityName = UserDefaults.standard.string(forKey: "LastCityName") {
            updateCityName(lastCityName)
        } else {
            interactor.getLoaded()
        }
    }
    
    func didLoadDate(date: String) {
        if let formattedDate = date.formatDateTime().date {
            let time = date.formatDateTime().time ?? ""
            view?.showDate(date: formattedDate, time: time)
        }
    }
    
    func didLoadTemperature(tempC: Double, condition: String) {
        view?.showTemperature(tempC: tempC, condition: condition)
    }
    
    func didLoadCityRegion(city: String, region: String) {
        view?.showCityRegion(city: city, region: region)
    }
    
    func didLoadFullImage(_ isShow: Bool) {
        view?.showLoaderFullImage(isShow)
    }
    
    func didLoadIndicator(_ isShow: Bool) {
        view?.showLoaderIndicator(isShow)
    }
    
    func saveLastCityName(_ cityName: String) {
        UserDefaults.standard.set(cityName, forKey: "LastCityName")
    }
    
    func updateCityName(_ newName: String) {
        interactor.updateCityName(newName)
        interactor.getLoaded()
        
        saveLastCityName(newName)
    }
    
    func navigateToNewScreen() {
        let collectionData = interactor.makeCollectionData()
        router.navigateToNewScreen(collectionData)
    }
    
    func navigateToAstroScreen() {
        let tableData = interactor.makeTableData()
        router.navigateToAstroScreen(tableData: tableData)
    }
}
