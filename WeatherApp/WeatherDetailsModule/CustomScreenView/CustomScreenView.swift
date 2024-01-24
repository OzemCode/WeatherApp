//
//  CustomScreenView.swift
//  WeatherApp
//
//  Created by Valentyn Kashkalda on 22.12.2023.
//

import UIKit

class CustomScreenView: UIView {
    let clearView = UIView()
    let blurView = UIVisualEffectView(effect: UIBlurEffect(style: .light))

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        clearView.translatesAutoresizingMaskIntoConstraints = false
        clearView.backgroundColor = .clear
        addSubview(clearView)

        NSLayoutConstraint.activate([
            clearView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5),
            clearView.widthAnchor.constraint(equalTo: widthAnchor),
            clearView.centerXAnchor.constraint(equalTo: centerXAnchor),
            clearView.bottomAnchor.constraint(equalTo: centerYAnchor)
        ])

        blurView.translatesAutoresizingMaskIntoConstraints = false
        blurView.layer.cornerRadius = 15
        blurView.layer.masksToBounds = true
        addSubview(blurView)

        NSLayoutConstraint.activate([
            blurView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5),
            blurView.widthAnchor.constraint(equalTo: widthAnchor),
            blurView.centerXAnchor.constraint(equalTo: centerXAnchor),
            blurView.topAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
}

