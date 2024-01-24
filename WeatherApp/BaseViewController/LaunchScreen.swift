//
//  FullScreenImageView.swift
//  WeatherApp
//
//  Created by Valentyn Kashkalda on 11.01.2024.
//

import UIKit
import SnapKit

class LaunchScreen: UIView {

    private let imageView = UIImageView()
    private let label = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupImageView()
//        setupLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupImageView() {
        addSubview(imageView)
        
        if let gifURL = Bundle.main.url(forResource: "loadImageView", withExtension: "gif"),
           let gifData = try? Data(contentsOf: gifURL),
           let gif = try? UIImage(gifData: gifData) {
            imageView.setGifImage(gif)
        }
        
        imageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()

        }
    }
    
    private func setupLabel() {
        label.textColor = .white
        label.text = "Weather App"
        label.font = .systemFont(ofSize: 30, weight: .bold)
        label.textAlignment = .center
        addSubview(label)
        
        label.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-50)
            make.centerX.equalToSuperview()
        }
    }
    
    func addConstraintFullScreanImage(_ view: UIView) {
        view.addSubview(self)
        
        snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    func viewHide(_ isShow: Bool) {
        UIView.animate(withDuration: 0.5, animations: {
            if isShow {
                self.alpha = 1.0
            } else {
                self.alpha = 0.0
            }
        }, completion: { _ in
            if !isShow {
                self.isHidden = true
            }
        })
    }
}
