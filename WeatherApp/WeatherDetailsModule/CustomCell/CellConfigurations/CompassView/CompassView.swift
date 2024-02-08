//
//  CompassView.swift
//  WeatherApp
//
//  Created by Valentyn Kashkalda on 13.12.2023.
//

import SnapKit

class CompassView: UIView {
    
    // MARK: - Properties
    
    private let arrowImage = UIImageView()
    private let circleLabel = UILabel()
    private let circleImageView = UIImageView()

    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCompass()
        translatesAutoresizingMaskIntoConstraints = false
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupCompass() {
        circleImageView.image = UIImage(named: "compass")
        addSubview(circleImageView)
        sendSubviewToBack(circleImageView)
        
        circleImageView.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
//            make.height.width.equalToSuperview().offset(-20)
        }
        
        circleLabel.layer.cornerRadius = 33.75
        circleLabel.layer.masksToBounds = true
        circleLabel.adjustsFontSizeToFitWidth = true
        circleLabel.backgroundColor = #colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 0.05096233444)
        circleLabel.textColor = .white
        circleLabel.numberOfLines = 0
        circleLabel.textAlignment = .center
        circleLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(circleLabel)
          
        circleLabel.snp.makeConstraints { make in
            make.centerX.centerY.equalTo(circleImageView)
            make.width.height.equalTo(67.5)
        }
                
        arrowImage.image = UIImage(named: "arrow")
        addSubview(arrowImage)
        
        arrowImage.snp.makeConstraints { make in
            make.centerY.centerX.equalTo(circleImageView)
            make.height.equalTo(circleImageView)
        }
    }
    
    func setupConstraints(_ view: UIView) {
        circleImageView.snp.makeConstraints { make in
            make.centerY.equalTo(view).offset(10)
            make.centerX.equalTo(view)
            make.height.width.equalTo(view).multipliedBy(0.75)
        }
    }
    
    func rotateArrow(degrees: CGFloat, windType: Double) {
        let value = Int(windType.rounded())
        let radians = degrees * .pi / 180.0
        circleLabel.setAttributedText(bigText: String(value), smallText: "\n km/h")
        arrowImage.transform = CGAffineTransform(rotationAngle: radians)
    }

}
