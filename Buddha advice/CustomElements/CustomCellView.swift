//
//  CustomCellView.swift
//  Buddha advice
//
//  Created by Никита Сорочинский on 08.11.2024.
//
import UIKit

class CustomCellView: UITableViewCell {
    private let customCellInternalView = CustomCellInternalView()
    
    var action: ((UITableViewCell) -> ())?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(buddha: BuddhaModel) {
        customCellInternalView.configure(buddha: buddha)
        customCellInternalView.action = actionButtonTapped
    }
    
    private func actionButtonTapped() {
        action?(self)
    }
}
    
//MARK: - Setup View
private extension CustomCellView {
    private func setupView() {
        contentView.addSubview(customCellInternalView)
        setupLayout()
    }
}

//MARK: - Setup Layout
private extension CustomCellView {
    private func setupLayout() {
        customCellInternalView.translatesAutoresizingMaskIntoConstraints = false
            
            NSLayoutConstraint.activate([
                customCellInternalView.topAnchor.constraint(equalTo: contentView.topAnchor),
                customCellInternalView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
                customCellInternalView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
                customCellInternalView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15)
            ])
        }
}
