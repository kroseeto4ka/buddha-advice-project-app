//
//  LicenseAgreementViewController.swift
//  Buddha advice
//
//  Created by Никита Сорочинский on 30.10.2024.
//

import UIKit

class LicenseAgreementViewController: UIViewController {
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    private let titleLabel = UILabel()
    private let textLabel = UILabel()
    
    var license: ILicenceManager?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setupLayout()
    }
}

//MARK: - Setup View
extension LicenseAgreementViewController {
    func setupView() {
        view.backgroundColor = .white
        view.addSubview(scrollView)
        
        setupScrollView()
        setupContentView()
        setupTitleLabel()
        setupTextLabel()
    }
    
    func setupScrollView() {
        scrollView.backgroundColor = .systemRed
        
        scrollView.addSubview(contentView)
    }
    
    func setupContentView() {
        contentView.backgroundColor = .white
        
        contentView.addSubview(titleLabel)
        contentView.addSubview(textLabel)
    }
    
    func setupTitleLabel() {
        titleLabel.text = license?.getTitle()
        titleLabel.font = .systemFont(ofSize: 16, weight: .heavy)
        titleLabel.textColor = .black
        titleLabel.numberOfLines = 0
        titleLabel.textAlignment = .center
    }
    
    func setupTextLabel() {
        textLabel.text = license?.getText()
        textLabel.font = .systemFont(ofSize: 16, weight: .light)
        textLabel.textColor = .black
        textLabel.numberOfLines = 0
        textLabel.textAlignment = .justified
    }
}

//MARK: - Setup Layout
extension LicenseAgreementViewController {
    func setupLayout() {
        view.addMultipleTranslatesAutoresizingMaskIntoConstraints([
            scrollView,
            contentView,
            titleLabel,
            textLabel
        ])
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            contentView.heightAnchor.constraint(equalToConstant: 1700),
            
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 50),
            titleLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.8),
            titleLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            
            textLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 70),
            textLabel.widthAnchor.constraint(equalTo: titleLabel.widthAnchor),
            textLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)
        ])
    }
}
