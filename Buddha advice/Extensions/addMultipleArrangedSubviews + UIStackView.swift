//
//  addMultipleArrangedSubviews + UIView.swift
//  Buddha advice
//
//  Created by Никита Сорочинский on 29.10.2024.
//

import UIKit

extension UIStackView {
    func addMultipleArrangedSubviews(_ subviews: [UIView]) {
        for subview in subviews {
            self.addArrangedSubview(subview)
        }
    }
}


