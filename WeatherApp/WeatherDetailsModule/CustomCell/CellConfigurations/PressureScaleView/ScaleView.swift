//
//  PressureScaleView.swift
//  WeatherApp
//
//  Created by Valentyn Kashkalda on 16.12.2023.
//

import UIKit

class ScaleView: UIView {
    
    // MARK: - Properties
    
    private let lineBlurImage = UIImageView()
    private let currentLabel = UILabel()
    private var arrowCurent = UIImageView()
    
    // MARK: - Initialization

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupScale()
        translatesAutoresizingMaskIntoConstraints = false
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Setup

    private func setupScale() {
        
        let circleImageView = UIImageView(image: UIImage(named: "scale"))
        circleImageView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(circleImageView)

        NSLayoutConstraint.activate([
            circleImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            circleImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            circleImageView.heightAnchor.constraint(equalTo: heightAnchor),
            circleImageView.widthAnchor.constraint(equalTo: widthAnchor)
        ])
        
        let arrowUp = UIImageView(image: UIImage(named: "arrowUp"))
        let arrowDown = UIImageView(image: UIImage(named: "arrowDown"))
        arrowCurent.image = UIImage(named: "arrowUp")
        
        arrowUp.tintColor = .white
        arrowUp.translatesAutoresizingMaskIntoConstraints = false
        addSubview(arrowUp)
        
        arrowDown.tintColor = .white
        arrowDown.translatesAutoresizingMaskIntoConstraints = false
        addSubview(arrowDown)
        
        arrowCurent.tintColor = .white
        arrowCurent.translatesAutoresizingMaskIntoConstraints = false
        addSubview(arrowCurent)
        
        NSLayoutConstraint.activate([
            arrowUp.bottomAnchor.constraint(equalTo: circleImageView.bottomAnchor),
            arrowUp.trailingAnchor.constraint(equalTo: circleImageView.trailingAnchor, constant: -15),
            arrowUp.heightAnchor.constraint(equalToConstant: 15),
            arrowUp.widthAnchor.constraint(equalToConstant: 15),
            
            arrowDown.bottomAnchor.constraint(equalTo: circleImageView.bottomAnchor),
            arrowDown.leadingAnchor.constraint(equalTo: circleImageView.leadingAnchor, constant: 15),
            arrowDown.heightAnchor.constraint(equalToConstant: 15),
            arrowDown.widthAnchor.constraint(equalToConstant: 15),
            
            arrowCurent.centerXAnchor.constraint(equalTo: circleImageView.centerXAnchor),
            arrowCurent.centerYAnchor.constraint(equalTo: circleImageView.centerYAnchor, constant: -25),
            arrowCurent.heightAnchor.constraint(equalToConstant: 20),
            arrowCurent.widthAnchor.constraint(equalToConstant: 20)
        ])
        
        currentLabel.layer.masksToBounds = true
        currentLabel.adjustsFontSizeToFitWidth = true
        currentLabel.textColor = .white
        currentLabel.numberOfLines = 0
        currentLabel.textAlignment = .center
        currentLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(currentLabel)
        
        NSLayoutConstraint.activate([
            currentLabel.centerXAnchor.constraint(equalTo: circleImageView.centerXAnchor),
            currentLabel.centerYAnchor.constraint(equalTo: circleImageView.centerYAnchor, constant: 10),
            currentLabel.heightAnchor.constraint(equalToConstant: 45),
            currentLabel.widthAnchor.constraint(equalToConstant: 70)
        ])
                
        lineBlurImage.image = UIImage(named: "line")
        lineBlurImage.translatesAutoresizingMaskIntoConstraints = false
        addSubview(lineBlurImage)
        
        NSLayoutConstraint.activate([
            lineBlurImage.centerYAnchor.constraint(equalTo: circleImageView.centerYAnchor),
            lineBlurImage.centerXAnchor.constraint(equalTo: circleImageView.centerXAnchor),
            lineBlurImage.heightAnchor.constraint(equalTo: circleImageView.heightAnchor, constant: 10),
            lineBlurImage.widthAnchor.constraint(equalToConstant: 7.5)
        ])
    }
    
    func setupConstraints(_ view: UIView) {
        translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 10),
            centerXAnchor.constraint(equalTo: view.centerXAnchor),
            widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7),
            heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.7)
        ])
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
