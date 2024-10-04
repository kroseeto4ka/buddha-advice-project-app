//
//  ViewController.swift
//  Buddha advice
//
//  Created by Никита Сорочинский on 03.10.2024.
//

import UIKit

class ViewController: UIViewController {
    private let textLabel = UILabel()
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
        setupTextLabel()
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
            let imageName = self.buddhaDataManager.getNextBuddha().imageName
            let buddhaText = self.buddhaDataManager.getCurrentBuddha().quote
            self.monkImage.updateImage(imageName)
            self.textLabel.text = buddhaText
        }
        nextButton.addAction(nextButtonAction, for: .touchUpInside)
        
        //настройка lastButton
        let lastButtonAction = UIAction { _ in
            let imageName = self.buddhaDataManager.getPreviousBuddha().imageName
            let buddhaText = self.buddhaDataManager.getCurrentBuddha().quote
            self.monkImage.updateImage(imageName)
            self.textLabel.text = buddhaText
        }
        lastButton.addAction(lastButtonAction, for: .touchUpInside)
        
        //настройка firstButton
        let firstButtonAction = UIAction { _ in
            let imageName = self.buddhaDataManager.getFirstBuddha().imageName
            let buddhaText = self.buddhaDataManager.getCurrentBuddha().quote
            self.monkImage.updateImage(imageName)
            self.textLabel.text = buddhaText
        }
        firstButton.addAction(firstButtonAction, for: .touchUpInside)
    }
    
    private func setupView() {
        view.backgroundColor = .white
    }
    
    private func setupTextLabel() {
        textLabel.textColor = .black
        textLabel.font = .systemFont(ofSize: 17, weight: .semibold)
        textLabel.text = buddhaDataManager.getCurrentBuddha().quote
        textLabel.textAlignment = .justified
        textLabel.numberOfLines = 5
        textLabel.lineBreakMode = .byWordWrapping
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
        
        mainStack.addArrangedSubview(monkImage)
        mainStack.addArrangedSubview(textLabel)
        mainStack.addArrangedSubview(horizontalStack)
        mainStack.addArrangedSubview(firstButton)
    }
}

// MARK: - Setup Layout
extension ViewController {
    private func setupLayout() {
        mainStack.translatesAutoresizingMaskIntoConstraints = false
        monkImage.translatesAutoresizingMaskIntoConstraints = false
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        horizontalStack.translatesAutoresizingMaskIntoConstraints = false
        firstButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            mainStack.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            mainStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 60),
            mainStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -60),
            mainStack.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100),
            
            monkImage.heightAnchor.constraint(equalTo: mainStack.widthAnchor, multiplier: 0.8125),
            
            textLabel.topAnchor.constraint(equalTo: monkImage.bottomAnchor, constant: 20),
            
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
