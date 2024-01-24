//
//  CustomCellWidth.swift
//  WeatherApp
//
//  Created by Valentyn Kashkalda on 05.12.2023.
//

import UIKit

final class CustomCellWind: UICollectionViewCell {
    
    // MARK: - Properties

    private let compassView = CompassView()
    private let headerForCell = CustomHeaderView()
    
    // MARK: - Initialization

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup

    private func setupView() {
        backgroundColor = .customClear
        addSubview(compassView)
        sendSubviewToBack(compassView)
        compassView.setupConstraints(self)
        setupHeaderForCell()
    }
    
    private func setupHeaderForCell() {
        addSubview(headerForCell)
        headerForCell.configure(with: "wind", labelText: "WIND")
        headerForCell.setupConstraints(self)
    }
    
    // MARK: - SetupInput

    func setInput(_ input: Input) {
        compassView.rotateArrow(degrees: CGFloat(input.windTypeDegree), windType: input.windType)
    }
}

extension CustomCellWind {
    struct Input {
        let windType: Double
        let windTypeDegree: Int
    }
}
