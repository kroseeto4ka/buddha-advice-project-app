//
//  ViewController.swift
//  Buddha advice
//
//  Created by Никита Сорочинский on 03.10.2024.
//

import UIKit

class ViewController: UIViewController {
    private let numberLabel = UILabel()
    private let quoteLabel = UILabel()
    private let horizontalStack = UIStackView()
    private let mainStack = UIStackView()
    private let monkImage: CustomImage = CustomImage(
        imageName: Images.standartImage,
        cornerRadius: 20,
        isShadowRequired: true)
    let lastButton = CustomButton(buttonSelfColor: .black,
                                          buttonTextColor: .white,
                                          buttonText: "Last",
                                          isShadowRequired: false)
    let nextButton = CustomButton(buttonSelfColor: .black,
                                  buttonTextColor: .white,
                                  buttonText: "Next",
                                  isShadowRequired: false)
    private let firstButton = CustomButton(buttonSelfColor: .systemRed,
                                           buttonTextColor: .white,
                                           buttonText: "First",
                                           isShadowRequired: false)
    
    private let buddhaDataManager = BuddhaDataManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNumberLabel()
        setupQuoteLabel()
        setupHorizontalStack()
        setupMainStack()
        setupView()
        
        view.addSubview(mainStack)
        
        addAction()
        
        setupLayout()
    }
}

// MARK: - Setup View
extension ViewController {
    func addAction() {
        //настройка nextButton
        let nextButtonAction = UIAction { _ in
            let buddhaData = self.buddhaDataManager.getNextBuddha()
            self.monkImage.updateImage(buddhaData.imageName)
            self.quoteLabel.text = buddhaData.quote
            self.numberLabel.text = buddhaData.number
        }
        nextButton.addAction(nextButtonAction, for: .touchUpInside)
        
        //настройка lastButton
        let lastButtonAction = UIAction { _ in
            let buddhaData = self.buddhaDataManager.getPreviousBuddha()
            self.monkImage.updateImage(buddhaData.imageName)
            self.quoteLabel.text = buddhaData.quote
            self.numberLabel.text = buddhaData.number
        }
        lastButton.addAction(lastButtonAction, for: .touchUpInside)
        
        //настройка firstButton
        let firstButtonAction = UIAction { _ in
            let buddhaData = self.buddhaDataManager.getFirstBuddha()
            self.monkImage.updateImage(buddhaData.imageName)
            self.quoteLabel.text = buddhaData.quote
            self.numberLabel.text = buddhaData.number
        }
        firstButton.addAction(firstButtonAction, for: .touchUpInside)
    }
    
    private func setupView() {
        view.backgroundColor = .white
    }
    
    private func setupNumberLabel() {
        numberLabel.textColor = .black
        numberLabel.font = .systemFont(ofSize: 30, weight: .bold)
        numberLabel.text = "\(buddhaDataManager.getCurrentBuddha().number)"
        numberLabel.textAlignment = .center
    }
    
    private func setupQuoteLabel() {
        quoteLabel.textColor = .black
        quoteLabel.font = .systemFont(ofSize: 17, weight: .semibold)
        quoteLabel.text = buddhaDataManager.getCurrentBuddha().quote
        quoteLabel.textAlignment = .justified
        quoteLabel.numberOfLines = 6
        quoteLabel.lineBreakMode = .byWordWrapping
    }
    
    private func setupHorizontalStack() {
        horizontalStack.axis = .horizontal
        horizontalStack.distribution = .fillEqually
        horizontalStack.spacing = 10
        horizontalStack.alignment = .fill
        
        horizontalStack.addArrangedSubview(lastButton)
        horizontalStack.addArrangedSubview(nextButton)
    }
    
    private func setupMainStack() {
        mainStack.axis = .vertical
        mainStack.distribution = .equalSpacing
        mainStack.spacing = 10
        mainStack.alignment = .fill
        
        mainStack.addArrangedSubview(numberLabel)
        mainStack.addArrangedSubview(monkImage)
        mainStack.addArrangedSubview(quoteLabel)
        mainStack.addArrangedSubview(horizontalStack)
        mainStack.addArrangedSubview(firstButton)
    }
}

// MARK: - Setup Layout
extension ViewController {
    private func setupLayout() {
        mainStack.translatesAutoresizingMaskIntoConstraints = false
        monkImage.translatesAutoresizingMaskIntoConstraints = false
        quoteLabel.translatesAutoresizingMaskIntoConstraints = false
        horizontalStack.translatesAutoresizingMaskIntoConstraints = false
        firstButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            mainStack.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            mainStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 60),
            mainStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -60),
            mainStack.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100),
            
            numberLabel.heightAnchor.constraint(equalToConstant: 50),
            
            monkImage.heightAnchor.constraint(equalTo: mainStack.widthAnchor, multiplier: 0.8125),
            
            quoteLabel.topAnchor.constraint(equalTo: monkImage.bottomAnchor, constant: 20),
            
            horizontalStack.heightAnchor.constraint(equalToConstant: 50),
            
            firstButton.heightAnchor.constraint(equalTo: horizontalStack.heightAnchor)
        ])
        
    }
}

// MARK: - Constants
extension ViewController {
    enum Images {
        static let standartImage: String = "buddhaDesert"
    }
}
