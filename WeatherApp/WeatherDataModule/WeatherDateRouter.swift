//
//  WeatherDateRouter.swift
//  WeatherApp
//
//  Created by Valentyn Kashkalda on 02.10.2023.
//

import UIKit

protocol WeatherDateRouterProtocol: AnyObject {
    func navigateToNewScreen(_ collectionData: [WeatherCollectionSectionModel])
    func navigateToAstroScreen(tableData: [WeatherTableSectionModel]) 
}

class WeatherDateRouter: WeatherDateRouterProtocol {
    weak var viewController: WeatherDateViewController?
    
    func navigateToNewScreen(_ collectionData: [WeatherCollectionSectionModel]) {
        let newViewController = WeatherDetailsViewController()
        newViewController.source = collectionData
        viewController?.present(newViewController, animated: true)
    }
    
    func navigateToAstroScreen(tableData: [WeatherTableSectionModel]) {
        viewController?.sideMenuViewController?.source = tableData
        viewController?.sideMenuViewController?.reloadTableView()
        viewController?.showSideMenu(true)
    }
}

