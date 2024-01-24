//
//  WeatherGestoreApp.swift
//  WeatherApp
//
//  Created by Valentyn Kashkalda on 28.12.2023.
//

import UIKit

extension WeatherDateViewController {
    
    func gestureDidLoaded() {
        setupSwipeGesture()
        setupTapGesture()
        setupSwipeGestureForSideMenu()
        setupSwipeGestureToCloseMenu()
    }
    
   private func setupSwipeGesture() {
        let swipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(_:)))
        swipeGesture.direction = .up
        view.addGestureRecognizer(swipeGesture)
    }
    
    @objc func handleSwipe(_ gesture: UISwipeGestureRecognizer) {
        if gesture.direction == .up {
            presenter?.navigateToNewScreen()
            showSideMenu(false)
        }
    }
    
    private func setupTapGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc private func handleTap() {
        view.endEditing(true)
    }
    
    private func setupSwipeGestureForSideMenu() {
        let swipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipeForSideMenu(_:)))
        swipeGesture.direction = .left
        view.addGestureRecognizer(swipeGesture)
    }
    
    @objc private func handleSwipeForSideMenu(_ gesture: UISwipeGestureRecognizer) {
        if gesture.direction == .left {
            showSideMenu(true)
            presenter?.navigateToAstroScreen()
        }
    }
    
    func showSideMenu(_ show: Bool) {
        if sideMenuViewController == nil {
            sideMenuViewController = SideDataViewController()
            sideMenuViewController?.view.frame = CGRect(x: view.frame.width,
                                                        y: view.frame.height / 3.3,
                                                        width: view.frame.width / 2,
                                                        height: view.frame.height / 3)
            
            astroLabel.text = "A\nS\nT\nR\nO"
            astroLabel.textAlignment = .center
            astroLabel.font = .systemFont(ofSize: 16, weight: .semibold)
            astroLabel.textColor = .white
            astroLabel.numberOfLines = 0
            astroLabel.translatesAutoresizingMaskIntoConstraints = false
            sideMenuViewController?.view.addSubview(astroLabel)
            
            NSLayoutConstraint.activate([
                astroLabel.trailingAnchor.constraint(equalTo: sideMenuViewController!.view.leadingAnchor, constant: -5),
                astroLabel.centerYAnchor.constraint(equalTo: sideMenuViewController!.view.centerYAnchor),
            ])
            
            view.addSubview(sideMenuViewController!.view)
            addChild(sideMenuViewController!)
            sideMenuViewController?.didMove(toParent: self)
        }
        
        UIView.animate(withDuration: 0.3) {
            self.sideMenuViewController?.view.frame.origin.x = show ? self.view.frame.width / 1.4 : self.view.frame.width
        }
    }

    private func setupSwipeGestureToCloseMenu() {
        let swipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipeToCloseMenu(_:)))
        swipeGesture.direction = .right
        view.addGestureRecognizer(swipeGesture)
    }

    @objc private func handleSwipeToCloseMenu(_ gesture: UISwipeGestureRecognizer) {
        if gesture.direction == .right {
            showSideMenu(false)
        }
    }
}
