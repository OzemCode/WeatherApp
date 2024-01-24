//
//  CustomCellVis.swift
//  WeatherApp
//
//  Created by Valentyn Kashkalda on 17.12.2023.
//


import SnapKit

class CustomCellVis: UICollectionViewCell {
    
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
        headerForCell.configure(with: "eye.fill", labelText: "VIS")
        headerForCell.setupConstraints(self)
    }
    
    private func createTextLabel() {
        textLabel.configureCustomLabel("Dew point right now \(Int.random)°.")
        textLabel.font = .systemFont(ofSize: 17, weight: .semibold)
        addSubview(textLabel)
        
        textLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.bottom.equalToSuperview().offset(-5)
            make.width.equalToSuperview().offset(-40)
            make.height.equalToSuperview().multipliedBy(0.4)
        }
    }
    
    func displayVisibilityText(_ visibilityInKm: Double) -> String {
        switch visibilityInKm {
        case ..<1:
            return "Visibility is very limited or practically absent."
        case 1..<3:
            return "This may be due to heavy fog, rain, or snowfall."
        case 3..<5:
            return "Objects are visible at a short distance."
        case 5..<7:
            return "This can occur in conditions of light fog or smoke."
        case 7..<10:
            return "Visibility is limited, but objects can still be discerned."
        case 10..<15:
            return "Usually indicates good weather conditions."
        case 15..<20:
            return "Objects are visible at a satisfactory distance."
        case 20..<30:
            return "High transparency of the atmosphere."
        default:
            return "Objects are visible at a great distance without any difficulty."
        }
    }
    
    // MARK: - SetupInput

    func setInput(_ input: Input) {
        let value = Int(input.visType.rounded())
        currentLabel.text = String("\(value) km")
        textLabel.configureCustomLabel(displayVisibilityText(input.visType))
    }
}

extension CustomCellVis {
    struct Input {
        let visType: Double
    }
}
