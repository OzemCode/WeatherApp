//
//  TextFieldExtension.swift
//  WeatherApp
//
//  Created by Valentyn Kashkalda on 21.12.2023.
//

import UIKit

extension UITextField {
    func setupCityTextField() {
        let placeholderText = "Enter the city name"
        let attributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.8015831954) ,
            .font: UIFont.systemFont(ofSize: 14)  // Розмір шрифту
        ]
        self.attributedPlaceholder = NSAttributedString(string: placeholderText, attributes: attributes)
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: self.frame.height))
        let paddingViewRight = UIView(frame: CGRect(x: 0, y: 0, width: 60, height: self.frame.height))
        self.rightView = paddingViewRight
        self.rightViewMode = .always
        self.leftView = paddingView
        self.clearButtonMode = .whileEditing
        self.textColor = .white
        self.leftViewMode = .always
        self.backgroundColor = #colorLiteral(red: 0.34971416, green: 0.3541162312, blue: 0.3540387154, alpha: 0.4042580712)
        self.layer.cornerRadius = 10
        self.tintColor = .white
        self.translatesAutoresizingMaskIntoConstraints = false
        self.font = UIFont.systemFont(ofSize: 20)
    }
    
    func addClearButton() {
        let clearButton = UIButton(type: .custom)
        clearButton.setImage(UIImage(systemName: "xmark.circle.fill"), for: .normal)
        clearButton.tintColor = .systemGray
        clearButton.frame = CGRect(x: 50, y: 0, width: 20, height: 20)
        clearButton.contentMode = .scaleAspectFit
        clearButton.addTarget(self, action: #selector(clearText), for: .touchUpInside)
        rightView = clearButton
        rightViewMode = .whileEditing
    }

    @objc func clearText() {
        self.text = ""
    }
}
