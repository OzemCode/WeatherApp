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
            .foregroundColor: #colorLiteral(red: 0.8737124801, green: 0.8960101008, blue: 0.8956211209, alpha: 1) ,
            .font: UIFont.systemFont(ofSize: 14)
        ]
        attributedPlaceholder = NSAttributedString(string: placeholderText, attributes: attributes)
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: self.frame.height))
        let paddingViewRight = UIView(frame: CGRect(x: 0, y: 0, width: 60, height: self.frame.height))
        rightView = paddingViewRight
        rightViewMode = .always
        leftView = paddingView
        clearButtonMode = .whileEditing
        textColor = .white
        leftViewMode = .always
        layer.cornerRadius = 10
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.5
        layer.shadowOffset = CGSize(width: 2, height: 2)
        layer.shadowRadius = 4
        contentMode = .scaleAspectFill
        tintColor = .white
        translatesAutoresizingMaskIntoConstraints = false
        font = UIFont.systemFont(ofSize: 20)
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
