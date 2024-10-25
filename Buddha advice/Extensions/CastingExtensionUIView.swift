//
//  CastingExtensionUIView.swift
//  Buddha advice
//
//  Created by Никита Сорочинский on 25.10.2024.
//
import UIKit

extension UIView {
    func elementsAmount(_ views: UIView...){
        var counter = 0
        for view in views {
            if (view is UIButton){
                counter += 1
            }
        }
        print("\(counter) examples of UIButton")
    }
    
    func elementsNames(_ views: UIView...){
        for view in views {
            if let button = view as? CustomButton {
                print(button.elementName ?? "Button Error")
            }
            
            if let image = view as? CustomImage {
                print(image.elementName ?? "Image Error")
            }
        }
    }
}
