//
//  CustomCellProtocol.swift
//  WeatherApp
//
//  Created by Valentyn Kashkalda on 05.12.2023.
//

import SnapKit

class CustomCellFeelslike: UICollectionViewCell {
    
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
        setupHeaderForCell()
        currentLabel.setupConstraints(self)
        createTextLabel()
    }
    
    private func setupHeaderForCell() {
        addSubview(headerForCell)
        headerForCell.configure(with: "thermometer.medium", labelText: "FEELS LIKE")
        headerForCell.setupConstraints(self)
    }
    
    private func createTextLabel() {
        textLabel.configureCustomLabel("Due to the wind, the weather feels colde")
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
        let value = Int(input.feelslikeType.rounded())
        currentLabel.text = String("\(value)°")
    }
}

extension CustomCellFeelslike {
    struct Input {
        let feelslikeType: Double
    }
}
