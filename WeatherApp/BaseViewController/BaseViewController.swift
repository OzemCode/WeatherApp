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
        setupLoadingIndicator()
//        setupInstructionWidgetIfNeeded()
    }
        
        
    // MARK: - Indicator Handling

     func showIndicator(_ isLoading: Bool) {
        if isLoading {
            loadingIndicator.startAnimating()
            view.backgroundColor = #colorLiteral(red: 0.4142881632, green: 0.6379151344, blue: 0.9611112475, alpha: 0.6466266556)
        } else {
            loadingIndicator.stopAnimating()
            view.backgroundColor = .clear
        }
        view.isUserInteractionEnabled = !isLoading
    }
    
    private func setupLoadingIndicator() {
        loadingIndicator = UIActivityIndicatorView(style: .large)
        loadingIndicator.color = .white
        view.addSubview(loadingIndicator)
        
        loadingIndicator.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
    }
    
}
