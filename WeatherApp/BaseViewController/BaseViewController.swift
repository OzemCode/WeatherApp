//
//  BaseViewController.swift
//  WeatherApp
//
//  Created by Valentyn Kashkalda on 02.10.2023.
//

import SnapKit

class BaseViewController: UIViewController {

    
    // MARK: - UI Elements
    
    private var loadingIndicator: UIActivityIndicatorView!
    private var instructionWidget = InstructionWidget()

    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gradientColorNight
        setupLoadingIndicator()
    }
        
        
    // MARK: - Indicator Handling

     func showIndicator(_ isLoading: Bool) {
        if isLoading {
            loadingIndicator.startAnimating()
        } else {
            loadingIndicator.stopAnimating()
        }
        view.isUserInteractionEnabled = !isLoading
    }
    
    private func setupLoadingIndicator() {
        loadingIndicator = UIActivityIndicatorView(style: .large)
        loadingIndicator.color = .white
        view.addSubview(loadingIndicator)
        
        loadingIndicator.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
        }
    }
}
