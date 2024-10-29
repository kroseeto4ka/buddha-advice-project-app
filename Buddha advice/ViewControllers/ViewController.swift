//
//  ViewController.swift
//  Buddha advice
//
//  Created by Никита Сорочинский on 03.10.2024.
//

import UIKit

class ViewController: UIViewController {
    private let numberLabel = UILabel()
    private let imageNameLabel = UILabel()
    private let quoteLabel = UILabel()
    
    private let horizontalStack = UIStackView()
    private let mainStack = UIStackView()
    
    private let monkImage = CustomImage(imageName: Images.standartImage,
                                        cornerRadius: 20,
                                        isShadowRequired: true,
                                        elementName: "monkImage")
    
    private let lastButton = CustomButton(buttonSelfColor: .black,
                                  buttonTextColor: .white,
                                  buttonText: "Last",
                                  isShadowRequired: false,
                                  elementName: "lastButton")
    
    private let randomButton = CustomButton(buttonSelfColor: .black,
                                            buttonTextColor: .white,
                                            buttonText: "Random",
                                            isShadowRequired: false,
                                            elementName: "randomButton")
    
    private let nextButton = CustomButton(buttonSelfColor: .black,
                                  buttonTextColor: .white,
                                  buttonText: "Next",
                                  isShadowRequired: false,
                                  elementName: "nextButton")
    
    private let firstButton = CustomButton(buttonSelfColor: .systemRed,
                                           buttonTextColor: .white,
                                           buttonText: "First",
                                           isShadowRequired: false,
                                           elementName: "firstButton")
    
    var buddhaDataManager: IBuddha?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDelegate()
        setupView()
    }
}

// MARK: - Setup View
extension ViewController {
    private func setupView() {
        setupNumberLabel()
        setupQuoteLabel()
        setupHorizontalStack()
        setupMainStack()
        
        view.backgroundColor = .white
        
        view.elementsAmount(monkImage,
                             lastButton,
                             randomButton,
                             nextButton,
                             firstButton)
        view.elementsNames(monkImage,
                      lastButton,
                      randomButton,
                      nextButton,
                      firstButton)
        view.addSubview(mainStack)
        setupLayout()
    }
    
    private func setupNumberLabel() {
        numberLabel.textColor = .black
        numberLabel.font = .systemFont(ofSize: 30, weight: .bold)
        numberLabel.text = Texts.adviceNumber + "\(buddhaDataManager?.getCurrentBuddha().number ?? -1)"
        numberLabel.textAlignment = .center
    }
    
    private func setupQuoteLabel() {
        quoteLabel.textColor = .black
        quoteLabel.font = .systemFont(ofSize: 17, weight: .semibold)
        quoteLabel.text = buddhaDataManager?.getCurrentBuddha().quote
        quoteLabel.textAlignment = .justified
        quoteLabel.numberOfLines = 6
        quoteLabel.lineBreakMode = .byWordWrapping
    }
    
    private func setupImageNameLabel() {
        imageNameLabel.textColor = .systemGray3
        imageNameLabel.font = .systemFont(ofSize: 7, weight: .light)
        imageNameLabel.text = buddhaDataManager?.getCurrentBuddha().quote
        imageNameLabel.textAlignment = .justified
        imageNameLabel.isHidden = true
    }
    
    private func setupHorizontalStack() {
        horizontalStack.axis = .horizontal
        horizontalStack.distribution = .fillEqually
        horizontalStack.spacing = 10
        horizontalStack.alignment = .fill
        
        horizontalStack.addMultipleArrangedSubviews([
            lastButton,
            randomButton,
            nextButton
        ])
    }
    
    private func setupMainStack() {
        mainStack.axis = .vertical
        mainStack.distribution = .equalSpacing
        mainStack.spacing = 10
        mainStack.alignment = .fill
        
        mainStack.addMultipleArrangedSubviews([
            numberLabel,
            monkImage,
            imageNameLabel,
            quoteLabel,
            horizontalStack,
            firstButton
        ])
    }
    
    private func setupDelegate() {
        firstButton.delegate = self
        lastButton.delegate = self
        randomButton.delegate = self
        nextButton.delegate = self
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let imageName = self.buddhaDataManager?.getCurrentBuddha().imageName ?? "Error"
        if imageNameLabel.isHidden {
            imageNameLabel.text = imageName
            imageNameLabel.isHidden = false
        } else {
            imageNameLabel.isHidden = true
        }
        super.touchesBegan(touches, with: event)
    }
}

// MARK: - Setup Layout
extension ViewController {
    private func setupLayout() {
        
        view.addMultipletranslatesAutoresizingMaskIntoConstraints([
            mainStack,
            monkImage,
            quoteLabel,
            imageNameLabel,
            horizontalStack,
            firstButton
        ])
        
        NSLayoutConstraint.activate([
            mainStack.topAnchor.constraint(equalTo: view.topAnchor, constant: 70),
            mainStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            mainStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            mainStack.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50),
            
            numberLabel.heightAnchor.constraint(equalToConstant: 50),
            
            monkImage.heightAnchor.constraint(equalTo: mainStack.widthAnchor, multiplier: 0.8125),
            monkImage.topAnchor.constraint(equalTo: numberLabel.bottomAnchor, constant: 30),
            
            imageNameLabel.topAnchor.constraint(greaterThanOrEqualTo: monkImage.bottomAnchor, constant: 20),
            
            quoteLabel.topAnchor.constraint(greaterThanOrEqualTo: imageNameLabel.bottomAnchor, constant: 15),
            
            horizontalStack.heightAnchor.constraint(equalToConstant: 60),
            
            firstButton.heightAnchor.constraint(equalTo: horizontalStack.heightAnchor)
        ])
        
    }
}

// MARK: - Constants
extension ViewController {
    enum Images {
        static let standartImage: String = "buddhaDesert"
    }
    
    enum Texts {
        static let errorText: String = "Error"
        static let adviceNumber: String = "Совет №"
    }
}

// MARK: - ICustomButtonDelegate
extension ViewController: ICustomButtonDelegate {
    func pressedButton(_ button: UIButton) {
        switch button {
        case firstButton:
            self.setupAction(self.buddhaDataManager?.getFirstBuddha())
        case lastButton:
            self.setupAction(self.buddhaDataManager?.getPreviousBuddha())
        case nextButton:
            self.setupAction(self.buddhaDataManager?.getNextBuddha())
        case randomButton:
            self.setupAction(self.buddhaDataManager?.getRandomBuddha())
        default:
            break
        }
    }
    
    private func setupAction(_ buddhaData: BuddhaModel?) {
        self.monkImage.updateImage(buddhaData?.imageName ?? Texts.errorText)
        self.quoteLabel.text = buddhaData?.quote
        self.numberLabel.text = Texts.adviceNumber + "\(buddhaData?.number ?? -1)"
        self.imageNameLabel.isHidden = true
    }
}

