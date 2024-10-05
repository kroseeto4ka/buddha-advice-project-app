//
//  CustomButton.swift
//  Buddha advice
//
//  Created by Никита Сорочинский on 03.10.2024.
//
import UIKit

class CustomButton: UIButton {
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(buttonSelfColor: UIColor,
         buttonTextColor: UIColor,
         buttonText: String,
         isShadowRequired: Bool = false) {
        super.init(frame: .zero)
        setupButton(buttonSelfColor, buttonTextColor, buttonText, isShadowRequired)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let shadowPath = UIBezierPath(rect: bounds)
        layer.shadowPath = shadowPath.cgPath
    }
}

//MARK: - Setup View
extension CustomButton {
    private func setupButton(_ buttonSelfColor: UIColor,
                             _ buttonTextColor: UIColor,
                             _ buttonText: String,
                             _ isShadowRequired: Bool){
        setTitle(buttonText, for: .normal)
        titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
        setTitleColor(buttonTextColor, for: .normal)
        backgroundColor = buttonSelfColor
        layer.cornerRadius = 20
        
        if isShadowRequired {
            layer.shadowColor = UIColor.black.cgColor
            layer.shadowRadius = 20
            layer.shadowOpacity = 0.7
        }
    }
}
