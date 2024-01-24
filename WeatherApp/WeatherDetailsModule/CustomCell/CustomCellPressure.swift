//
//  CustomCellPressure.swift
//  WeatherApp
//
//  Created by Valentyn Kashkalda on 05.12.2023.
//

import UIKit

class CustomCellPressure: UICollectionViewCell {
    
    // MARK: - Properties
    
    private let headerForCell = CustomHeaderView()
    private let pressureScaleView = ScaleView()
    
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
        addSubview(pressureScaleView)
        sendSubviewToBack(pressureScaleView)
        pressureScaleView.setupConstraints(self)
        setupHeaderForCell()
    }
    
    private func setupHeaderForCell() {
        addSubview(headerForCell)
        headerForCell.configure(with: "exclamationmark.circle", labelText: "PRESSURE")
        headerForCell.setupConstraints(self)
    }
    
    // MARK: - SetupInput

    func setInput(_ input: Input) {
        pressureScaleView.setupChangeLine(input.pressureType)
    }
}

extension CustomCellPressure {
    struct Input {
        let pressureType: Double
    }
}

