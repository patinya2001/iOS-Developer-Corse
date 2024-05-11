//
//  OnboardingViewController.swift
//  Bankey
//
//  Created by ปฏิญญา จารุอริยานนท์ on 12/5/2567 BE.
//

import UIKit

class OnboardingViewController: UIViewController {

    let onboardingView = OnboardingView(title: "Bankey is faster, easier to use, and has a brand new look and feel that will make you feel like you are back in 1989.", image: UIImage(named: "delorean")!)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
    }
}


//MARK: - Style and Layout
extension OnboardingViewController {
    private func style() {
        
    }
    
    private func layout() {
        // onboardingView
        view.addSubview(onboardingView)
        NSLayoutConstraint.activate([
            onboardingView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            onboardingView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            onboardingView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: onboardingView.trailingAnchor, multiplier: 1)
        ])
    }
}
