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
    
    private func formatDateTime(_ originalDateString: String) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"
        guard let originalDate = dateFormatter.date(from: originalDateString) else {
            print("Failed to convert date from string: \(originalDateString)")
            return
        }
        
        let newDateFormat = DateFormatter()
        newDateFormat.dateFormat = "dd-MM-yyyy"
        let newTimeFormat = DateFormatter()
        newTimeFormat.dateFormat = "HH:mm"
        let newDateString = newDateFormat.string(from: originalDate)
        let newTimeString = newTimeFormat.string(from: originalDate)
        view?.showDateTime(date: newDateString, time: newTimeString)
    }
    
    func displayWeatherImage(isDay: Int, weatherCondition: Int) {
        var imageName = ""
        let weatherCode = WeatherMapper.mapWeatherConditionToCategory(conditionCode: weatherCondition)

        if isDay == 0 {
            imageName += "night_"
        } else {
            imageName += "day_"
        }

        imageName += weatherCode
        view?.backgroundImage(image: imageName)
    }
    func didLoadWidget(_ isShow: Bool) {
        view?.showLoaderWidget(isShow)
    }
    
    func viewDidLoaded() {
        interactor.getLoaded()
    }
    
    func didLoadDate(date: String) {
        formatDateTime(date)
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
    
    func updateCityName(_ newName: String) {
        interactor.updateCityName(newName)
        interactor.getLoaded()
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
