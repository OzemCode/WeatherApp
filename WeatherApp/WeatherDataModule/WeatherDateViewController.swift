//
//  WeatherDateViewController.swift
//  WeatherApp
//
//  Created by Valentyn Kashkalda on 02.10.2023.
//
import UIKit
import SnapKit

protocol WeatherDateViewProtocol: AnyObject {
    func showDateTime(date: String, time: String)
    func showTemperature(tempC: Double, condition: String)
    func showCityRegion(city: String, region: String)
    func showLoaderIndicator(_ isShow: Bool)
    func updateCityName(_ newName: String)
    func backgroundImage(image: String)
    func showLoaderFullImage(_ isShow: Bool)
    func showLoaderWidget(_ isShow: Bool)
    
}

class WeatherDateViewController: BaseViewController {
    
    // MARK: - Properties
    
    var presenter: WeatherDatePresenterProtocol?
    var sideMenuViewController: SideDataViewController?

    
    private let backgroundImageView = UIImageView()
    private let cityTextField = UITextField()
    private let updateButton = UIButton()
    private let downBlurView = UIView()
    private let metricLabel = UILabel()
    private let fullScreenImageView = LaunchScreen()
    private let instructionWidget = InstructionWidget()
    let astroLabel = UILabel()
    
    private let cityNameLabel = CustomWeatherLabel(of: 34, font: .semibold)
    private let regionNameLabel = CustomWeatherLabel(of: 22, font: .regular)
    private let temperatureLabel = CustomWeatherLabel(of: 90, font: .thin)
    private let conditionLabel = CustomWeatherLabel(of: 22, font: .regular)
    private let locationTimeLabel = CustomWeatherLabel(of: 25, font: .regular)
    private let locationDataLabel = CustomWeatherLabel(of: 30, font: .regular)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showSideMenu(false)
        setupBackgroundImage()
        presenter?.viewDidLoaded()
        createCityText()
        setupUILabel()
        createUpdateButton()
        setupDownView()
        gestureDidLoaded()
        setupMetricLabel()
        setupConditionLabel()
        
        instructionWidget.addConstraintFullScreanImage(view)
        fullScreenImageView.addConstraintFullScreanImage(view)
    }
    
    // MARK: - UI Setup
    
    private func setupUILabel() {
        view.addSubview(cityNameLabel)
        view.addSubview(regionNameLabel)
        view.addSubview(temperatureLabel)
        view.addSubview(metricLabel)
        view.addSubview(conditionLabel)
        view.addSubview(locationTimeLabel)
        view.addSubview(locationDataLabel)
        
        cityNameLabel.snp.makeConstraints { make in
            make.top.equalTo(cityTextField.snp.bottom).offset(20)
            make.height.equalTo(view.snp.height).multipliedBy(0.1)
            make.width.equalTo(view.snp.width).multipliedBy(0.5)
            make.centerX.equalTo(view.snp.centerX)
        }

        regionNameLabel.snp.makeConstraints { make in
            make.centerY.equalTo(cityNameLabel.snp.bottom).offset(5)
            make.height.equalTo(cityNameLabel.snp.height).multipliedBy(0.8)
            make.width.equalTo(cityNameLabel.snp.width)
            make.centerX.equalTo(cityNameLabel.snp.centerX)
        }

        temperatureLabel.snp.makeConstraints { make in
            make.top.equalTo(regionNameLabel.snp.centerY).offset(10)
            make.centerX.equalTo(view.snp.centerX)
        }

        metricLabel.snp.makeConstraints { make in
            make.top.equalTo(temperatureLabel.snp.top)
            make.leading.equalTo(temperatureLabel.snp.trailing)
        }

        conditionLabel.snp.makeConstraints { make in
            make.top.equalTo(temperatureLabel.snp.bottom)
            make.centerX.equalTo(cityNameLabel.snp.centerX)
        }

        locationDataLabel.snp.makeConstraints { make in
            make.bottom.equalTo(view.snp.bottom).offset(-10)
            make.height.equalTo(cityNameLabel.snp.height)
            make.width.equalTo(cityNameLabel.snp.width)
            make.centerX.equalTo(cityNameLabel.snp.centerX)
        }

        locationTimeLabel.snp.makeConstraints { make in
            make.bottom.equalTo(locationDataLabel.snp.centerY)
            make.height.equalTo(cityNameLabel.snp.height)
            make.width.equalTo(cityNameLabel.snp.width)
            make.centerX.equalTo(cityNameLabel.snp.centerX)
        }

    }
    
    private func createCityText() {
        cityTextField.setupCityTextField()
        view.addSubview(cityTextField)
        
        NSLayoutConstraint.activate([
            cityTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            cityTextField.topAnchor.constraint(equalTo: view.topAnchor, constant: 60),
            cityTextField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9),
            cityTextField.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.07)
        ])
    }
    
    private func setupBackgroundImage() {
        backgroundImageView.contentMode = .scaleAspectFill
        backgroundImageView.frame = view.bounds
        backgroundImageView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.addSubview(backgroundImageView)
        view.sendSubviewToBack(backgroundImageView)
    }
    
    private func createUpdateButton() {
        let image = UIImage(named: "search")
        updateButton.setImage(image, for: .normal)
        updateButton.translatesAutoresizingMaskIntoConstraints = false
        updateButton.addTarget(self, action: #selector(updateButtonTapped), for: .touchUpInside)
        view.addSubview(updateButton)
        
        NSLayoutConstraint.activate([
            updateButton.rightAnchor.constraint(equalTo: cityTextField.rightAnchor, constant: -10),
            updateButton.centerYAnchor.constraint(equalTo: cityTextField.centerYAnchor),
            updateButton.widthAnchor.constraint(equalToConstant: 35),
            updateButton.heightAnchor.constraint(equalToConstant: 35)
        ])
    }
    
    private func setupDownView() {
        downBlurView.translatesAutoresizingMaskIntoConstraints = false
        downBlurView.backgroundColor = .clear
        downBlurView.layer.cornerRadius = 20
        downBlurView.layer.masksToBounds = true
        downBlurView.addBlurEffect(alpha: 0.5)
        view.addSubview(downBlurView)
        
        NSLayoutConstraint.activate([
            downBlurView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            downBlurView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 25),
            downBlurView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            downBlurView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.05)
        ])
    }
    
    private func setupMetricLabel() {
        metricLabel.text = "°"
        metricLabel.translatesAutoresizingMaskIntoConstraints = false
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

// MARK: - WeatherDateViewProtocol

extension WeatherDateViewController: WeatherDateViewProtocol {
    func showLoaderWidget(_ isShow: Bool) {
        instructionWidget.viewWidgetHide(isShow)
    }
    
    func showLoaderFullImage(_ isShow: Bool) {
        fullScreenImageView.viewHide(isShow)
    }
    
    func backgroundImage(image: String) {
        backgroundImageView.image = UIImage(named: image)
    }
    
    func updateCityName(_ newName: String) {
        self.cityTextField.text = newName
    }
    
    func showDateTime(date: String, time: String) {
        self.locationDataLabel.text = date
        self.locationTimeLabel.text = time
    }
    
    func showTemperature(tempC: Double, condition: String) {
        let value = Int(tempC.rounded())
        self.temperatureLabel.text = "\(value)"
        self.conditionLabel.text = condition
    }
    
    func showCityRegion(city: String, region: String) {
        self.cityNameLabel.text = city
        regionNameLabel.text = region
    }
    
    func showLoaderIndicator(_ isShow: Bool) {
        showIndicator(isShow)
    }
}
