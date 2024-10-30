//
//  PanImageViewController.swift
//  Buddha advice
//
//  Created by Никита Сорочинский on 30.10.2024.
//

import UIKit

class PanImageViewController: UIViewController {
    
    var monkImage = CustomImage(imageName: Images.standartImage,
                                cornerRadius: 20,
                                isShadowRequired: false,
                                elementName: "monkImage")
    
    private var centerXConstraint: NSLayoutConstraint!
    private var topConstraint: NSLayoutConstraint!
    
    private let panGestureRecognizer = UIPanGestureRecognizer()
    private var panGestureAnchorPoint: CGPoint?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupLayout()
        setupGestureRecognizers()
    }
    
    @objc
    func handlePanGesture(_ gestureRecognizer: UIPanGestureRecognizer) {
        guard panGestureRecognizer === gestureRecognizer else {
            return
        }
        
        switch gestureRecognizer.state {
        case .possible:
            break
        case .began:
            panGestureAnchorPoint = gestureRecognizer.location(in: view)
        case .changed:
            guard let panGestureAnchorPoint = panGestureAnchorPoint else { return }
            
            let gesturePoint = gestureRecognizer.location(in: view)
            
            centerXConstraint.constant += gesturePoint.x - panGestureAnchorPoint.x
            topConstraint.constant += gesturePoint.y - panGestureAnchorPoint.y
            self.panGestureAnchorPoint = gesturePoint
            
        case .ended:
            self.panGestureAnchorPoint = nil
        case .cancelled:
            self.panGestureAnchorPoint = nil
        case .failed:
            break
        @unknown default:
            break
        }
    }
}

//MARK: - Setup View
extension PanImageViewController {
    private func setupView() {
        view.backgroundColor = .white
        setupMonkImage()
        
        view.addSubview(monkImage)
    }
    
    private func setupGestureRecognizers() {
        panGestureRecognizer.addTarget(self, action: #selector(handlePanGesture(_:)))
        panGestureRecognizer.maximumNumberOfTouches = 1
        
        monkImage.addGestureRecognizer(panGestureRecognizer)
    }
    
    private func setupMonkImage() {
        monkImage.clipsToBounds = true
    }
}

//MARK: - Setup Layout
extension PanImageViewController {
    private func setupLayout() {
        monkImage.translatesAutoresizingMaskIntoConstraints = false
        
        let widthConstraint = monkImage.widthAnchor.constraint(
            equalToConstant: Sizes.imageWidth
        )
        
        let heightConstraint = monkImage.heightAnchor.constraint(
            equalToConstant: Sizes.imageHeight
        )
        
        centerXConstraint = monkImage.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        topConstraint = monkImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 200)
        
        NSLayoutConstraint.activate([
            widthConstraint,
            heightConstraint,
            centerXConstraint,
            topConstraint
        ])
    }
}

//MARK: - Constants
extension PanImageViewController {
    enum Images {
        static let standartImage: String = "buddhaDesert"
    }
    
    enum Sizes {
        static let imageWidth = CGFloat(200)
        static let imageHeight = CGFloat(250)
    }
}
