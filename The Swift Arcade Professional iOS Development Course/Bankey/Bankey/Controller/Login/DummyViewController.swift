//
//  DummyViewController.swift
//  Bankey
//
//  Created by ปฏิญญา จารุอริยานนท์ on 13/5/2567 BE.
//

import UIKit

//MARK: - DummyViewControllerDelegate
protocol DummyViewControllerDelegate: AnyObject {
    func didLogout()
}


//MARK: -  Main
class DummyViewController: UIViewController {
    
    weak var delegate: DummyViewControllerDelegate?
    
    let stackView = UIStackView()
    let label = UILabel()
    let logoutButton = UIButton(type: .system)

    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
    }
}


//MARK: - Style and Layout
extension DummyViewController {
    private func style() {
        // stackView
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 20
        
        // label
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Welcome"
        label.font = UIFont.preferredFont(forTextStyle: .title1)
        
        // logoutButton
        logoutButton.translatesAutoresizingMaskIntoConstraints = false
        logoutButton.configuration = .filled()
        logoutButton.setTitle("Logout", for: .normal)
        logoutButton.addTarget(self, action: #selector(logoutTapped), for: .touchUpInside)
    }
    
    private func layout() {
        // label
        stackView.addArrangedSubview(label)
        
        // logoutButton
        stackView.addArrangedSubview(logoutButton)
        
        // stackView
        view.addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}


//MARK: - Action
extension DummyViewController {
    @objc func logoutTapped(sender: UIButton) {
        delegate?.didLogout()
    }
}
