//
//  CustomCellView.swift
//  Buddha advice
//
//  Created by Никита Сорочинский on 08.11.2024.
//
import UIKit

class CustomCellView: UITableViewCell {
    private let monkImage = UIImageView()
    private let buddhaName = UILabel()
    private let buddhaQuote = UILabel()
    
    private let checkboxButton = UIButton()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(buddha: BuddhaModel) {
        buddhaName.text = buddha.imageName
        buddhaQuote.text = buddha.quote
        monkImage.image = UIImage(named: buddha.imageName)
        
        let checkbox: String
        
        if buddha.isMark {
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
extension CustomCellView {
    private func setupView() {
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
            contentView.addSubview(view)
        }
    }
    
    private func setupTitleLabel() {
        buddhaName.font = .boldSystemFont(ofSize: 20)
        buddhaName.textColor = .red
    }
    
    private func setupQuoteLabel() {
        buddhaQuote.font = .systemFont(ofSize: 10)
        buddhaQuote.numberOfLines = 0
    }
    
    private func setupImageView() {
        monkImage.widthAnchor.constraint(equalToConstant: 100).isActive = true
        monkImage.heightAnchor.constraint(equalToConstant: 100).isActive = true
        monkImage.contentMode = .scaleAspectFill
    }
    
    private func setupCheckboxButton(_ color: UIColor) {
        checkboxButton.tintColor = color
    }
}

//MARK: - Setup Layout
extension CustomCellView {
    private func setupLayout() {
        [
            monkImage,
            buddhaName,
            buddhaQuote,
            checkboxButton
        ].forEach { view in
            view.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            monkImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            monkImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            monkImage.widthAnchor.constraint(equalToConstant: 100),
            monkImage.heightAnchor.constraint(equalToConstant: 75),
            
            buddhaName.leadingAnchor.constraint(equalTo: monkImage.trailingAnchor, constant: 16),
            buddhaName.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            buddhaName.heightAnchor.constraint(equalToConstant: 22),
            
            buddhaQuote.leadingAnchor.constraint(equalTo: buddhaName.leadingAnchor),
            buddhaQuote.topAnchor.constraint(equalTo: buddhaName.bottomAnchor, constant: 4),
            buddhaQuote.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            buddhaQuote.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            
            // Констрейнты для checkboxButton
            checkboxButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            checkboxButton.centerYAnchor.constraint(equalTo: buddhaName.centerYAnchor),
            checkboxButton.widthAnchor.constraint(equalToConstant: 24),
            checkboxButton.heightAnchor.constraint(equalToConstant: 24)
        ])
    }
}
