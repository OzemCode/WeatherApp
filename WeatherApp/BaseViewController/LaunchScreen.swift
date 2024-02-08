//
//  FullScreenImageView.swift
//  WeatherApp
//
//  Created by Valentyn Kashkalda on 11.01.2024.
//

import SnapKit

class LaunchScreen: UIView {

    private let imageView = UIImageView()
    private let label = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupImageView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupImageView() {
        addSubview(imageView)
        imageView.setGifImage(named: "loadImageView")
        
        imageView.snp.makeConstraints { make in
            make.centerX.top.bottom.equalToSuperview()
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
