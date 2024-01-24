//
//  WeatherModuleBuilder.swift
//  WeatherApp
//
//  Created by Valentyn Kashkalda on 02.10.2023.
//

import Foundation

class WeatherModuleBuilder {
    static func build() -> WeatherDateViewController {
        let view = WeatherDateViewController()
        let interactor = WeatherDateInteractor()
        let router = WeatherDateRouter()
        let presenter = WeatherDatePresenter(router: router, interactor: interactor)
        view.presenter = presenter
        presenter.view = view
        interactor.presenter = presenter
        router.viewController = view
        
        return view
    }
}
