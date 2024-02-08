//
//  InstructionWidget.swift
//  WeatherApp
//
//  Created by Valentyn Kashkalda on 18.01.2024.
//

import SnapKit

class InstructionWidget: UIView {

    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .center
        return imageView
    }()
    
    private let label: UILabel = {
        let label = UILabel()
        label.text = "Swipe for more details"
        label.textColor = .white
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        return label
    }()
    
    private let hasBeenDisplayedKey = "hasBeenDisplayed"

    init() {
        super.init(frame: .zero)
        setupUI()
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
            make.centerX.bottom.equalToSuperview()
        }
        
        label.snp.makeConstraints { make in
            make.centerX.top.equalToSuperview()
        }
    }
    
    func addConstraintFullScreanImage(_ view: UIView) {
        view.addSubview(self)
        
        snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().offset(-40)
        }
    }
    
    func viewWidgetHide(_ isShow: Bool) {
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 7) { [weak self] in
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
