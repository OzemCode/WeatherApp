//
//  SecondViewController.swift
//  WeatherApp
//
//  Created by Valentyn Kashkalda on 23.11.2023.
//

import UIKit

class WeatherDetailsViewController: UIViewController {
    
    // MARK: - Properties

    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        return collectionView
    }()

    // MARK: - Array

    var source: [WeatherCollectionSectionModel] = []

    // MARK: - Initialization

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addBlurEffect()
        setupCollectionView()
                
        if let sheet = self.presentationController as? UISheetPresentationController {
            sheet.detents = [.medium()]
            sheet.prefersGrabberVisible = false
        }
    }
    
    // MARK: - Setup

    private func setupCollectionView() {
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.showsVerticalScrollIndicator = false
        collectionView.backgroundColor = .clear
        collectionView.layer.cornerRadius = 20
        collectionView.layer.masksToBounds = true
        collectionView.register(CustomCellWind.self)
        collectionView.register(CustomCellPressure.self)
        collectionView.register(CustomCellFeelslike.self)
        collectionView.register(CustomCellHumidity.self)
        collectionView.register(CustomCellPrecip.self)
        collectionView.register(CustomCellVis.self)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(collectionView)
        NSLayoutConstraint.activate(
            [
                collectionView.topAnchor.constraint(equalTo: view.topAnchor),
                collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            ]
        )
        
        
    }
}

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
        let size = (collectionView.frame.width * 0.5) - 20.0
        return .init(width: size, height: size)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 15.0
    }
}
