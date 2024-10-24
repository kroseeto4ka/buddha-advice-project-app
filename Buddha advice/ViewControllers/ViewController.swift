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
        
        setupNumberLabel()
        setupQuoteLabel()
        setupHorizontalStack()
        setupMainStack()
        setupView()
        elementsAmount(monkImage,
                             lastButton,
                             randomButton,
                             nextButton,
                             firstButton)
        elementsNames(monkImage,
                      lastButton,
                      randomButton,
                      nextButton,
                      firstButton)
        view.addSubview(mainStack)
        
        setupLayout()
    }
}

// MARK: - Setup View
extension ViewController {
    private func setupView() {
        view.backgroundColor = .white
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
    
    private func setupHorizontalStack() {
        horizontalStack.axis = .horizontal
        horizontalStack.distribution = .fillEqually
        horizontalStack.spacing = 10
        horizontalStack.alignment = .fill
        
        horizontalStack.addArrangedSubview(lastButton)
        horizontalStack.addArrangedSubview(randomButton)
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
    
    private func setupDelegate() {
        firstButton.delegate = self
        lastButton.delegate = self
        randomButton.delegate = self
        nextButton.delegate = self
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
            mainStack.topAnchor.constraint(equalTo: view.topAnchor, constant: 70),
            mainStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            mainStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            mainStack.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50),
            
            numberLabel.heightAnchor.constraint(equalToConstant: 50),
            
            monkImage.heightAnchor.constraint(equalTo: mainStack.widthAnchor, multiplier: 0.8125),
            monkImage.topAnchor.constraint(equalTo: numberLabel.bottomAnchor, constant: 30),
            
            quoteLabel.topAnchor.constraint(greaterThanOrEqualTo: monkImage.bottomAnchor, constant: 30),
            
            horizontalStack.heightAnchor.constraint(equalToConstant: 80),
            
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
    }
}

//MARK: - Casting debug
extension ViewController {
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
