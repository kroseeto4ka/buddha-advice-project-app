//
//  CustomCellInternal.swift
//  Buddha advice
//
//  Created by Никита Сорочинский on 21.11.2024.
//
import UIKit

class CustomCellInternalView: UIView {
    private let monkImage = UIImageView()
    private let buddhaName = UILabel()
    private let buddhaQuote = UILabel()
    
    private let checkboxButton = UIButton()
    
    private var toggleCheckbox = false
    
    var action: (() -> ())?
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        UIView.animate(withDuration: 0.5) {
            self.backgroundColor = UIColor(
                cgColor: self.getRandomCGColor()
            )
            self.layer.cornerRadius = 0
        } completion: { _ in
            self.layer.cornerRadius = 20
        }
    }
    
    @objc
    private func actionButtonTapped() {
        toggleCheckbox.toggle()
        
        let checkbox: String
        
        if toggleCheckbox {
            checkbox = "checkmark.square.fill"
            setupCheckboxButton(.red)
        } else {
            checkbox = "checkmark.square"
            setupCheckboxButton(.black)
        }
        checkboxButton.setImage(UIImage(systemName: checkbox), for: .normal)
        action?()
    }
    
    func configure(buddha: BuddhaModel) {
        buddhaName.text = buddha.imageName
        buddhaQuote.text = buddha.quote
        monkImage.image = UIImage(named: buddha.imageName)
        toggleCheckbox = buddha.isMark
        
        let checkbox: String
        
        if toggleCheckbox {
            checkbox = "checkmark.square.fill"
            setupCheckboxButton(.red)
        } else {
            checkbox = "checkmark.square"
            setupCheckboxButton(.black)
        }
        checkboxButton.setImage(UIImage(systemName: checkbox), for: .normal)
    }
}

//MARK: - Setup View
extension CustomCellInternalView {
    private func setupView() {
        backgroundColor = UIColor(
            cgColor: CGColor(
                red: 180/255,
                green: 180/255,
                blue: 180/255,
                alpha: 1
            )
        )
        
        layer.cornerRadius = 20
        
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.3
        layer.shadowOffset = CGSize(width: 5, height: 5)
        layer.shadowRadius = 10
        
        addSubviews()
        setupTitleLabel()
        setupQuoteLabel()
        setupImageView()
        setupCheckboxButton(.black)
        
        setupLayout()
    }
    
    private func addSubviews() {
        [
            monkImage,
            buddhaName,
            buddhaQuote,
            checkboxButton
        ].forEach { view in
            addSubview(view)
        }
    }
    
    private func setupTitleLabel() {
        buddhaName.font = .boldSystemFont(ofSize: 20)
        buddhaName.textColor = .red
    }
    
    private func setupQuoteLabel() {
        buddhaQuote.font = .systemFont(ofSize: 12)
        buddhaQuote.numberOfLines = 0
    }
    
    private func setupImageView() {
        monkImage.widthAnchor.constraint(equalToConstant: 100).isActive = true
        monkImage.heightAnchor.constraint(equalToConstant: 100).isActive = true
        monkImage.contentMode = .scaleAspectFill
    }
    
    private func setupCheckboxButton(_ color: UIColor) {
        checkboxButton.tintColor = color
        
        checkboxButton.addTarget(self, action: #selector(actionButtonTapped), for: .touchUpInside)
    }
    
    private func getRandomCGColor() -> CGColor {
        let randomRed = CGFloat(Int.random(in: 180...255)) / 255
        let randomGreen = CGFloat(Int.random(in: 180...255)) / 255
        let randomBlue = CGFloat(Int.random(in: 180...255)) / 255
        
        return CGColor(red: randomRed, green: randomGreen, blue: randomBlue, alpha: 1)
    }
}

//MARK: - Setup Layout
extension CustomCellInternalView {
    private func setupLayout() {
        [
            monkImage,
            buddhaName,
            buddhaQuote,
            checkboxButton
        ].forEach { view in
            view.translatesAutoresizingMaskIntoConstraints = false
        }
        
        let lowestConstraint = monkImage.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20)
        lowestConstraint.priority = .defaultLow
        
        NSLayoutConstraint.activate([
            monkImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
            monkImage.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            lowestConstraint,
            
            buddhaName.leadingAnchor.constraint(equalTo: monkImage.trailingAnchor, constant: 25),
            buddhaName.topAnchor.constraint(equalTo: monkImage.topAnchor, constant: 3),
            buddhaName.heightAnchor.constraint(equalToConstant: 22),
            
            buddhaQuote.leadingAnchor.constraint(equalTo: buddhaName.leadingAnchor),
            buddhaQuote.topAnchor.constraint(equalTo: buddhaName.bottomAnchor, constant: 4),
            buddhaQuote.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            buddhaQuote.bottomAnchor.constraint(equalTo: monkImage.bottomAnchor),
            
            checkboxButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            checkboxButton.centerYAnchor.constraint(equalTo: buddhaName.centerYAnchor),
            checkboxButton.widthAnchor.constraint(equalToConstant: 24),
            checkboxButton.heightAnchor.constraint(equalToConstant: 24)
        ])
    }
}
