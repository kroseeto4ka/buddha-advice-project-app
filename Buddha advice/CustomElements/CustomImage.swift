//
//  CustomImage.swift
//  Buddha advice
//
//  Created by Никита Сорочинский on 03.10.2024.
//

import UIKit

class CustomImage: UIView {
    private let image = UIImageView()
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(imageName: String, cornerRadius: CGFloat, isShadowRequired: Bool){
        super.init(frame: .zero)
        setupImage(imageName, cornerRadius)
        setupImageView(isShadowRequired, cornerRadius)
        setupLayout()
    }
    
    func updateImage(_ imageName: String) {
        image.image = UIImage(named: imageName)
    }
}

//MARK: - Setup view
extension CustomImage{
    private func setupImage(_ imageName: String, _ cornerRadius: CGFloat) {
        image.image = UIImage(named: imageName)
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.cornerRadius = cornerRadius
        image.clipsToBounds = true
        
        image.contentMode = .scaleAspectFill
    }
    
    private func setupImageView(_ isShadowRequired: Bool, _ cornerRadius: CGFloat) {
        if isShadowRequired {
            layer.shadowColor = UIColor.black.cgColor
            layer.shadowOffset = CGSize(width: 10, height: 10)
            layer.shadowOpacity = 1
            layer.shadowRadius = cornerRadius
        }
        addSubview(image)
    }
}

//MARK: - Setup Layout
extension CustomImage{
    private func setupLayout() {
        image.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            image.topAnchor.constraint(equalTo: topAnchor),
            image.bottomAnchor.constraint(equalTo: bottomAnchor),
            image.leadingAnchor.constraint(equalTo: leadingAnchor),
            image.trailingAnchor.constraint(equalTo: trailingAnchor)
            ])
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let shadowPath = UIBezierPath(rect: bounds)
        layer.shadowPath = shadowPath.cgPath
    }
}
