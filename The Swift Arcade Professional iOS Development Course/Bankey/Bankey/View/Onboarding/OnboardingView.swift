//
//  OnboardingView.swift
//  Bankey
//
//  Created by ปฏิญญา จารุอริยานนท์ on 12/5/2567 BE.
//

import UIKit

class OnboardingView: UIView {
    
    let stackView = UIStackView()
    let imageView = UIImageView()
    let label = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        style(title: "Welcome", image: UIImage(named: "delorean")!)
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(title: String, image: UIImage) {
        super.init(frame: .zero)
        style(title: title, image: image)
        layout()
    }
}

//MARK: - Style and Layout
extension OnboardingView {
    private func style(title: String, image: UIImage) {
        translatesAutoresizingMaskIntoConstraints = false
        
        // stackView
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 20
        
        // imageView
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.image = image
        
        // label
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.adjustsFontForContentSizeCategory = true
        label.numberOfLines = 0
        label.text = title
        label.font = UIFont.preferredFont(forTextStyle: .title3)
    }
    
    private func layout() {
        // imageView
        stackView.addArrangedSubview(imageView)
        
        // label
        stackView.addArrangedSubview(label)
        
        // stackView
        addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
}
