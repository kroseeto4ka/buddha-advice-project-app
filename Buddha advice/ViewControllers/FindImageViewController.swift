//
//  FindImageViewController.swift
//  Buddha advice
//
//  Created by Никита Сорочинский on 28.10.2024.
//
import UIKit

class FindImageViewController: UIViewController {
    var buddhaDataManager: IBuddha?
    
    let quoteLabel = UILabel()
    let statusLabel = UILabel()
    let textField = UITextField()
    let searchButton = CustomButton(buttonSelfColor: .systemRed,
                                    buttonTextColor: .white,
                                    buttonText: "Найти",
                                    elementName: "searchButton")
    let monkImage = CustomImage(imageName: Images.standartImage,
                            cornerRadius: 20,
                            isShadowRequired: true,
                            elementName: "monkImage")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupLayout()
        setupDelegate()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.setupAction()
    }
}

//MARK: - Setup View
extension FindImageViewController {
    private func setupView() {
        setupTextField()
        setupStatusLabel()
        setupSearchButton()
        setupMonkImage()
        setupQuoteLabel()
        
        view.backgroundColor = .white
    }
    
    private func setupStatusLabel() {
        statusLabel.text = "Введите название картинки"
        statusLabel.textColor = .black
        statusLabel.font = .systemFont(ofSize: 22, weight: .bold)
        statusLabel.textAlignment = .center
        statusLabel.numberOfLines = 2
        
        view.addSubview(statusLabel)
    }
    
    private func setupTextField() {
        textField.backgroundColor = .systemGray4
        textField.placeholder = "Название картинки..."
        textField.borderStyle = .roundedRect
        
        view.addSubview(textField)
    }
    
    private func setupSearchButton() {
        view.addSubview(searchButton)
    }
    
    private func setupMonkImage() {
        monkImage.isHidden = true
        
        view.addSubview(monkImage)
    }
    
    private func setupQuoteLabel() {
        quoteLabel.textColor = .black
        quoteLabel.font = .systemFont(ofSize: 17, weight: .semibold)
        quoteLabel.text = buddhaDataManager?.getCurrentBuddha().quote
        quoteLabel.textAlignment = .justified
        quoteLabel.numberOfLines = 6
        quoteLabel.lineBreakMode = .byWordWrapping
        quoteLabel.isHidden = true
        view.addSubview(quoteLabel)
    }
    
    private func setupDelegate() {
        self.searchButton.delegate = self
        self.textField.delegate = self
    }
}

//MARK: - Setup Layout
extension FindImageViewController {
    func setupLayout() {
        view.addMultipleTranslatesAutoresizingMaskIntoConstraints([
            statusLabel,
            textField,
            searchButton,
            monkImage,
            quoteLabel
        ])
        
        NSLayoutConstraint.activate([
            statusLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            statusLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            statusLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            statusLabel.bottomAnchor.constraint(equalTo: statusLabel.topAnchor, constant: 70),
            
            textField.topAnchor.constraint(equalTo: statusLabel.bottomAnchor, constant: 30),
            textField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textField.heightAnchor.constraint(equalToConstant: 50),
            textField.widthAnchor.constraint(equalToConstant: 200),
            
            searchButton.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 40),
            searchButton.heightAnchor.constraint(equalToConstant: 70),
            searchButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            searchButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            searchButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            
            monkImage.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.53),
            monkImage.topAnchor.constraint(equalTo: searchButton.bottomAnchor, constant: 40),
            monkImage.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.66),
            monkImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            quoteLabel.topAnchor.constraint(equalTo: monkImage.bottomAnchor, constant: 20),
            quoteLabel.heightAnchor.constraint(equalToConstant: 150),
            quoteLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            quoteLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            quoteLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            
        ])
    }
}

//MARK: - ICustomButtonDelegate
extension FindImageViewController: ICustomButtonDelegate {
    func pressedButton(_ button: UIButton) {
        if button == self.searchButton {
            self.setupAction()
        }
    }
    
    private func setupAction() {
        if let name = textField.text {
            if let certainBuddha = buddhaDataManager!.getCertainBuddha(name: name) {
                self.textField.resignFirstResponder()
                
                self.monkImage.updateImage(certainBuddha.imageName)
                self.monkImage.isHidden = false
                
                self.quoteLabel.text = certainBuddha.quote
                self.quoteLabel.isHidden = false
                
                self.statusLabel.text = "Такая картинка есть"
                
                self.textField.placeholder = "Следующая картинка..."
            } else {
                self.monkImage.isHidden = true
                self.quoteLabel.isHidden = true
                
                self.statusLabel.text = "Такой картинки нет"
            }
        }
    }
}

//MARK: - UITextFieldDelegate
extension FindImageViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.setupAction()
        return true
    }
}

//MARK: - Constants
extension FindImageViewController {
    enum Images {
        static let standartImage: String = "buddhaDesert"
    }
    
    enum Texts {
        static let errorText: String = "Error"
        static let adviceNumber: String = "Совет №"
    }
}
