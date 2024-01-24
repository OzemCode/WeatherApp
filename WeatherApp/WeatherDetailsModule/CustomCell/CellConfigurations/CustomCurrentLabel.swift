//
//  File.swift
//  WeatherApp
//
//  Created by Valentyn Kashkalda on 13.12.2023.
//

import SnapKit

class CustomCurrentLabel: UILabel {
    
    // MARK: - Properties
    
    private let customView = UIView()
    
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Configuration
        
    private func configureLabel() {
        textColor = .white
        font = .systemFont(ofSize: 35, weight: .semibold)
        textAlignment = .left
        adjustsFontSizeToFitWidth = true
        numberOfLines = 0
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    // MARK: - Setup

    func setupConstraints(_ view: UIView) {
        snp.makeConstraints { (make) in
            make.leading.equalTo(view.snp.leading).offset(20)
            make.top.equalTo(view.snp.top).offset(30)
            make.width.equalTo(view.snp.width)
            make.height.equalTo(50)
        }
    }
}

