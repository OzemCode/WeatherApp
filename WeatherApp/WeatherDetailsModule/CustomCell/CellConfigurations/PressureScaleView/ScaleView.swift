//
//  PressureScaleView.swift
//  WeatherApp
//
//  Created by Valentyn Kashkalda on 16.12.2023.
//

import SnapKit

class ScaleView: UIView {
    
    // MARK: - Properties
    
    private let lineBlurImage = UIImageView()
    private let currentLabel = UILabel()
    private var arrowCurent = UIImageView()
    
    // MARK: - Initialization

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupScale()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Setup

    private func setupScale() {
        
        let circleImageView = UIImageView(image: UIImage(named: "scale"))
        addSubview(circleImageView)
        
        circleImageView.snp.makeConstraints { make in
            make.centerY.centerX.equalToSuperview()
        }
        
        let arrowUp = UIImageView(image: UIImage(named: "arrowUp"))
        let arrowDown = UIImageView(image: UIImage(named: "arrowDown"))
        arrowCurent.image = UIImage(named: "arrowUp")
        
        arrowUp.tintColor = .white
        arrowDown.tintColor = .white
        arrowCurent.tintColor = .white
        
        addSubview(arrowUp)
        addSubview(arrowDown)
        addSubview(arrowCurent)
        
        arrowUp.snp.makeConstraints { make in
            make.bottom.equalTo(circleImageView)
            make.left.equalTo(circleImageView.snp.centerX).offset(20)
        }
        
        arrowDown.snp.makeConstraints { make in
            make.bottom.equalTo(circleImageView)
            make.right.equalTo(circleImageView.snp.centerX).offset(-20)
        }
        
        arrowCurent.snp.makeConstraints { make in
            make.centerX.equalTo(circleImageView)
            make.centerY.equalTo(circleImageView).offset(-25)
        }
        
        currentLabel.layer.masksToBounds = true
        currentLabel.adjustsFontSizeToFitWidth = true
        currentLabel.textColor = .white
        currentLabel.numberOfLines = 0
        currentLabel.textAlignment = .center
        addSubview(currentLabel)
        
        currentLabel.snp.makeConstraints { make in
            make.centerX.equalTo(circleImageView)
            make.centerY.equalTo(circleImageView).offset(10)
            make.height.equalToSuperview().offset(45)
            make.width.equalToSuperview().offset(70)
        }
                
        lineBlurImage.image = UIImage(named: "line")
        addSubview(lineBlurImage)
        
        lineBlurImage.snp.makeConstraints { make in
            make.centerY.centerX.equalTo(circleImageView)
            make.height.equalTo(circleImageView).offset(10)
        }
    }
    
    func setupConstraints(_ view: UIView) {
        snp.makeConstraints { make in
            make.centerX.centerY.equalTo(view).offset(10)
            make.width.height.equalTo(view).multipliedBy(0.7)
        }
    }
    
    func setupChangeLine(_ valueGPa: Double ) {
        let value = Int(valueGPa.rounded())
        currentLabel.setAttributedText(bigText: String(value), smallText: "\n gPa")
        updateRotationAngle(valueGPa)
    }
    
   private func updateRotationAngle(_ valueGPa: Double) {
        let normalizedPressure = max(900.0, min(valueGPa, 1100.0))
        let normalizedRotation = ((normalizedPressure - 900.0) / 200.0) * 260.0 - 130.0
        lineBlurImage.transform = CGAffineTransform(rotationAngle: CGFloat(normalizedRotation) * .pi / 180.0)
        
        if normalizedPressure >= 1020 {
            arrowCurent.image = UIImage(named: "arrowUp")
        } else if normalizedPressure >= 1000 {
            arrowCurent.image = UIImage(named: "equal")
        } else {
            arrowCurent.image = UIImage(named: "arrowDown")
        }
    }
}
