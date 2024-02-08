//
//  WeatherDateViewController.swift
//  WeatherApp
//
//  Created by Valentyn Kashkalda on 02.10.2023.
//

import SnapKit

protocol WeatherDateViewProtocol: AnyObject {
    func showDate(date: String, time: String)
    func showTemperature(tempC: Double, condition: String)
    func showCityRegion(city: String, region: String)
    func showLoaderIndicator(_ isShow: Bool)
    func updateCityName(_ newName: String)
    func backgroundImage(image: String, _ backgroundColor: UIColor)
    func showLoaderFullImage(_ isShow: Bool)
    func showLoaderWidget(_ isShow: Bool)
    
}

class WeatherDateViewController: BaseViewController {
    
    // MARK: - Properties
    
    var presenter: WeatherDatePresenterProtocol?
    var sideMenuViewController: SideDataViewController?

    
    private let conditionImageView = UIImageView()
    private let locationImageView = UIImageView()
    private let cityTextField = UITextField()
    private let updateButton = UIButton()
    private let metricLabel = UILabel()
    private let fullScreenImageView = LaunchScreen()
    private let instructionWidget = InstructionWidget()
    let astroLabel = UILabel()
    
    private let cityNameLabel = CustomWeatherLabel(of: 26, font: .medium)
    private let temperatureLabel = CustomWeatherLabel(of: 120, font: .medium)
    private let conditionLabel = CustomWeatherLabel(of: 20, font: .medium)
    private let locationDataLabel = CustomWeatherLabel(of: 16, font: .medium)
    private let locationTimeLabel = CustomWeatherLabel(of: 16, font: .medium)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoaded()
        setupUIElements()
    }
    
    // MARK: - UI Setup
    
    private func setupUIElements() {
        showSideMenu(false)
        setupConditionImage()
        setupCityText()
        setupConstraints()
        setupUpdateButton()
        gestureDidLoaded()
    }
    
    private func setupConstraints() {
        view.addSubview(cityNameLabel)
        view.addSubview(temperatureLabel)
        view.addSubview(metricLabel)
        view.addSubview(conditionLabel)
        view.addSubview(locationDataLabel)
        view.addSubview(locationTimeLabel)
        view.addSubview(locationImageView)
        
        cityNameLabel.snp.makeConstraints { make in
            make.top.equalTo(cityTextField.snp.bottom).offset(15)
            make.centerX.equalToSuperview().offset(-10)
        }
        
        locationDataLabel.snp.makeConstraints { make in
            make.top.equalTo(cityNameLabel.snp.bottom)
            make.centerX.equalToSuperview()
        }
        
        locationTimeLabel.snp.makeConstraints { make in
            make.top.equalTo(locationDataLabel.snp.bottom)
            make.centerX.equalToSuperview()
        }
                
        conditionImageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(locationDataLabel.snp.bottom).offset(50)
            make.width.equalToSuperview().multipliedBy(0.5)
            make.height.equalToSuperview().multipliedBy(0.25)
        }

        temperatureLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.15)
            make.top.equalTo(view.snp.centerY).offset(100)
        }

        metricLabel.snp.makeConstraints { make in
            make.top.equalTo(temperatureLabel.snp.top)
            make.leading.equalTo(temperatureLabel.snp.trailing)
        }

        conditionLabel.snp.makeConstraints { make in
            make.top.equalTo(temperatureLabel.snp.bottom)
            make.centerX.equalToSuperview()
        }
        
        locationImageView.snp.makeConstraints { make in
            make.right.equalTo(cityNameLabel.snp.left).offset(-5)
            make.bottom.equalTo(cityNameLabel.snp.bottom).offset(-5)
        }
        
        setupMetricLabel()
        setupConditionLabel()
        
        instructionWidget.addConstraintFullScreanImage(view)
        fullScreenImageView.addConstraintFullScreanImage(view)
    }
    
    private func setupCityText() {
        cityTextField.setupCityTextField()
        cityTextField.delegate = self
        view.addSubview(cityTextField)
        
        cityTextField.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(55)
            make.width.equalToSuperview().multipliedBy(0.9)
            make.height.equalTo(50)
        }

    }
    
    private func setupConditionImage() {
        view.addSubview(conditionImageView)
        view.sendSubviewToBack(conditionImageView)
        conditionImageView.layer.shadowColor = UIColor.black.cgColor
        conditionImageView.layer.shadowOpacity = 0.5
        conditionImageView.layer.shadowOffset = CGSize(width: 2, height: 2)
        conditionImageView.layer.shadowRadius = 4
        conditionImageView.contentMode = .scaleAspectFill
    }
    
    private func setupUpdateButton() {
        
        let image = UIImage(named: "search")
        updateButton.setImage(image, for: .normal)
        updateButton.addTarget(self, action: #selector(updateButtonTapped), for: .touchUpInside)
        view.addSubview(updateButton)
        
        updateButton.snp.makeConstraints { make in
            make.right.equalTo(cityTextField.snp.right).offset(-10)
            make.centerY.equalTo(cityTextField)
        }
        
    }
    
    private func setupMetricLabel() {
        metricLabel.text = "°"
        metricLabel.textColor = .white
        metricLabel.font = .systemFont(ofSize: 50)
    }
    
    private func setupConditionLabel() {
        conditionLabel.numberOfLines = 0
        conditionLabel.lineBreakMode = .byWordWrapping
    }
    // MARK: - Actions
    
    @objc private func updateButtonTapped() {
        if let newCityName = cityTextField.text, !newCityName.isEmpty {
            presenter?.updateCityName(newCityName)
            presenter?.navigateToAstroScreen()
            cityTextField.resignFirstResponder()
            showSideMenu(false)
        }
    }
}

extension WeatherDateViewController: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == cityTextField {
            updateButtonTapped()
            return true
        }
        return false
    }
}

// MARK: - WeatherDateViewProtocol

extension WeatherDateViewController: WeatherDateViewProtocol {
    
    func showLoaderWidget(_ isShow: Bool) {
        instructionWidget.viewWidgetHide(isShow)
    }
    
    func showLoaderFullImage(_ isShow: Bool) {
        fullScreenImageView.viewHide(isShow)
    }
    
    func backgroundImage(image: String, _ backgroundColor: UIColor) {
        UIView.transition(with: conditionImageView, duration: 0.4, options: .transitionCrossDissolve, animations: {
            self.conditionImageView.image = UIImage(named: image)
            self.view.backgroundColor = backgroundColor
            self.cityTextField.backgroundColor = backgroundColor
        }, completion: nil)
    }
    
    func updateCityName(_ newName: String) {
        cityTextField.text = newName
    }
    
    func showDate(date: String, time: String) {
        UIView.transition(with: locationDataLabel, duration: 0.3, options: .transitionCrossDissolve, animations: {
            self.locationDataLabel.text = date
            self.locationTimeLabel.text = time
        }, completion: nil)
    }
    
    func showTemperature(tempC: Double, condition: String) {
        let value = Int(tempC.rounded())
        UIView.transition(with: temperatureLabel, duration: 0.3, options: .transitionCrossDissolve, animations: {
            self.temperatureLabel.text = "\(value)"
            self.conditionLabel.text = condition
        }, completion: nil)

    }
    
    func showCityRegion(city: String, region: String) {
        UIView.transition(with: cityNameLabel, duration: 0.3, options: .transitionCrossDissolve, animations: {
            self.cityNameLabel.text = city
        }, completion: nil)
        cityNameLabel.setAttributedTextWithImageLeft(city, imageName: "location")
    }
    
    func showLoaderIndicator(_ isShow: Bool) {
        showIndicator(isShow)
    }
}
