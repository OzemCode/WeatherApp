//
//  CustomCellPrecip.swift
//  WeatherApp
//
//  Created by Valentyn Kashkalda on 05.12.2023.
//

import SnapKit

class CustomCellPrecip: UICollectionViewCell {
    
    // MARK: - Properties
    
    private let currentLabel = CustomCurrentLabel()
    private let headerForCell = CustomHeaderView()
    private let textLabel = UILabel()
    
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
        addSubview(currentLabel)
        currentLabel.setupConstraints(self)
        setupHeaderForCell()
        createTextLabel()
    }
    
    private func setupHeaderForCell() {
        addSubview(headerForCell)
        headerForCell.configure(with: "drop.fill", labelText: "PRECIP")
        headerForCell.setupConstraints(self)
    }
    
    private func createTextLabel() {
        textLabel.configureCustomLabel("Over the past \n24 hours")
        textLabel.numberOfLines = 0
        textLabel.font = .systemFont(ofSize: 18, weight: .semibold)
        addSubview(textLabel)
        
        textLabel.snp.makeConstraints { make in
            make.leading.centerY.equalToSuperview().offset(20)
        }
    }
        
    func setInput(_ input: Input) {
        let value = Int(input.precipeType.rounded())
        currentLabel.text = String("\(value) мм")
    }
}

extension CustomCellPrecip {
    struct Input {
        let precipeType: Double
    }
}

