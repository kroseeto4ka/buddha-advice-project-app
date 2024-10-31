//
//  addMultipleTranslates + UIView.swift
//  Buddha advice
//
//  Created by Никита Сорочинский on 29.10.2024.
//

import UIKit

extension UIView {
    func addMultipleTranslatesAutoresizingMaskIntoConstraints(_ views: [UIView]) {
        for view in views {
            view.translatesAutoresizingMaskIntoConstraints = false
        }
    }
}
