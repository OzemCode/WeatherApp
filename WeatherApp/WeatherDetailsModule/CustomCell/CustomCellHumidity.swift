//
//  CustomCellHumidity.swift
//  WeatherApp
//
//  Created by Valentyn Kashkalda on 05.12.2023.
//

import SnapKit

class CustomCellHumidity: UICollectionViewCell {
    
    // MARK: - Properties

    private let headerForCell = CustomHeaderView()
    private let currentLabel = CustomCurrentLabel()
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
        setupHeaderForCell()
        currentLabel.setupConstraints(self)
        createTextLabel()
    }
    
    private func setupHeaderForCell() {
        addSubview(headerForCell)
        headerForCell.configure(with: "humidity", labelText: "HUMIDITY")
        headerForCell.setupConstraints(self)
    }
    
    private func createTextLabel() {
        textLabel.configureCustomLabel("Dew point right now \(Int.random)°.")
        textLabel.font = .systemFont(ofSize: 17, weight: .semibold)
        addSubview(textLabel)
        
        textLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.bottom.equalToSuperview()
            make.width.equalToSuperview().offset(-40)
            make.height.equalToSuperview().multipliedBy(0.5)
        }
    }
    
    // MARK: - SetupInput

    func setInput(_ input: Input) {
        currentLabel.text = String("\(input.humidityType)%")
    }
}

extension CustomCellHumidity {
    struct Input {
        let humidityType: Int
    }
    
    
}
