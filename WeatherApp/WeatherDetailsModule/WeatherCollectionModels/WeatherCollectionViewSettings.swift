//
//  WeatherCollectionViewSettings.swift
//  WeatherApp
//
//  Created by Valentyn Kashkalda on 22.12.2023.
//

import UIKit

extension WeatherDetailsViewController:  UICollectionViewDataSource {
    
    // MARK: - UICollectionViewDataSource
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return source[section].items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let item = source[indexPath.section].items[indexPath.row]
        
        switch item {
        case .windItem(let input):
            let cell = collectionView.dequeueReusableCell(
                ofType: CustomCellWind.self,
                at: indexPath
            )
            cell.setInput(input)
            cell.layer.cornerRadius = 15
            cell.layer.masksToBounds = true
            return cell
        case .precipItem(let input):
            let cell = collectionView.dequeueReusableCell(
                ofType: CustomCellPrecip.self,
                at: indexPath
            )
            cell.setInput(input)
            cell.layer.cornerRadius = 15
            cell.layer.masksToBounds = true
            return cell
        case .humidityItem(let input):
            let cell = collectionView.dequeueReusableCell(
                ofType: CustomCellHumidity.self,
                at: indexPath
            )
            cell.setInput(input)
            cell.layer.cornerRadius = 15
            cell.layer.masksToBounds = true
            return cell
        case .pressureItem(let input):
            let cell = collectionView.dequeueReusableCell(
                ofType: CustomCellPressure.self,
                at: indexPath
            )
            cell.setInput(input)
            cell.layer.cornerRadius = 15
            cell.layer.masksToBounds = true
            return cell
        case .feelslikeItem(let input):
            let cell = collectionView.dequeueReusableCell(
                ofType: CustomCellFeelslike.self,
                at: indexPath
            )
            cell.setInput(input)
            cell.layer.cornerRadius = 15
            cell.layer.masksToBounds = true
            return cell
        case .visItem(let input):
            let cell = collectionView.dequeueReusableCell(
                ofType: CustomCellVis.self,
                at: indexPath
            )
            cell.setInput(input)
            cell.layer.cornerRadius = 15
            cell.layer.masksToBounds = true
            return cell
        }
    }
}

extension WeatherDetailsViewController: UICollectionViewDelegate {
    
    // MARK: - UICollectionViewDelegate
    
}

extension WeatherDetailsViewController: UICollectionViewDelegateFlowLayout {
    
    // MARK: - UICollectionViewDelegateFlowLayout

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = view.frame.width * 0.45
        return CGSize(width: width, height: width + 10)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 10)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 15.0
    }
}
