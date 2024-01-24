//
//  CellHeaderBannerView.swift
//  WeatherApp
//
//  Created by Valentyn Kashkalda on 14.12.2023.
//

import SnapKit

class CustomHeaderView: UIView {
    
    // MARK: - Properties
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .customGray
        return imageView
    }()
    
    private let label: UILabel = {
        let label = UILabel()
        label.textColor = .customGray
        label.adjustsFontSizeToFitWidth = true
        label.font = .systemFont(ofSize: 16, weight: .bold)
        return label
    }()
    
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
        addSubview(imageView)
        addSubview(label)
        
        imageView.snp.makeConstraints { (make) in
            make.leading.equalToSuperview().offset(10)
            make.centerY.equalToSuperview()
            make.width.height.equalTo(25)
        }
        
        label.snp.makeConstraints { (make) in
            make.leading.equalTo(imageView.snp.trailing).offset(5)
            make.centerY.equalTo(imageView)
            make.trailing.equalToSuperview()
        }
    }
    
    // MARK: - Configuration
    
    func configure(with imageName: String, labelText: String) {
        imageView.image = UIImage(systemName: imageName)
        label.text = labelText
    }
    
    func setupConstraints(_ view: UIView) {
        snp.makeConstraints { (make) in
            make.top.equalTo(view.snp.top).offset(5)
            make.leading.equalTo(view.snp.leading)
            make.height.equalTo(20)
            make.width.equalTo(view.snp.width).offset(-30)
        }
    }
}

