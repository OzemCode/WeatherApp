//
//  InstructionWidget.swift
//  WeatherApp
//
//  Created by Valentyn Kashkalda on 18.01.2024.
//

import SnapKit
import SwiftyGif

class InstructionWidget: UIView {

    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .center
        return imageView
    }()
    
    private let label: UILabel = {
        let label = UILabel()
        label.text = "Swipe for \n more details"
        label.textColor = .white
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        return label
    }()
    
    private let hasBeenDisplayedKey = "hasBeenDisplayed"

    init() {
        super.init(frame: .zero)
        
        if !UserDefaults.standard.bool(forKey: hasBeenDisplayedKey) {
            setupUI()
            UserDefaults.standard.set(true, forKey: hasBeenDisplayedKey)
        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupUI() {
        addSubview(imageView)
        addSubview(label)
        
        if let gifURL = Bundle.main.url(forResource: "arrowUp", withExtension: "gif"),
           let gifData = try? Data(contentsOf: gifURL),
           let gif = try? UIImage(gifData: gifData) {
            imageView.setGifImage(gif)
        }
        
        imageView.snp.makeConstraints { make in
            make.centerX.top.equalToSuperview()
        }
        
        label.snp.makeConstraints { make in
            make.centerX.bottom.equalToSuperview()
        }
    }
    
    func addConstraintFullScreanImage(_ view: UIView) {
        view.addSubview(self)
        
        snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(200)
            make.width.equalToSuperview().multipliedBy(0.2)
            make.height.equalToSuperview().multipliedBy(0.15)
        }
    }
    
    func viewWidgetHide(_ isShow: Bool) {
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) { [weak self] in
            UIView.animate(withDuration: 0.5, animations: {
                if isShow {
                    self?.alpha = 1.0
                } else {
                    self?.alpha = 0.0
                }
            }, completion: { _ in
                if !isShow {
                    self?.isHidden = true
                }
            })
        }
    }
    
}

