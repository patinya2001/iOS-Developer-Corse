//
//  ViewController.swift
//  Bankey
//
//  Created by ปฏิญญา จารุอริยานนท์ on 10/5/2567 BE.
//

import UIKit

//MARK: - LoginViewControllerDelegate
protocol LoginViewControllerDelegate: AnyObject {
    func didLogin()
}


//MARK: - Main
class LoginViewController: UIViewController {
    
    weak var delegate: LoginViewControllerDelegate?
    
    let titleView = TitleView()
    let loginView = LoginView()
    let signInButton = UIButton(type: .system)
    let errorMessageLabel = UILabel()
    
    var username: String? {
        return loginView.usernameTextField.text
    }
    
    var password: String? {
        return loginView.passwordTextField.text
    }
    
    // animation
    var leadingEdgeOnScreen: CGFloat = 16
    var leadingEdgeOffScreen: CGFloat = -1000
    
    var titleViewLeadingAnchor: NSLayoutConstraint?

    override func viewDidLoad() {
        super.viewDidLoad()
        loginView.delegate = self
        style()
        layout()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        animate()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        loginView.usernameTextField.text = ""
        loginView.passwordTextField.text = ""
        signInButton.configuration?.showsActivityIndicator = false
    }
}

//MARK: - Style and Layout
extension LoginViewController {
    private func style() {
        // titleView
        titleView.alpha = 0
        
        // signinButton
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        signInButton.configuration = .filled()
        signInButton.configuration?.imagePadding = 8
        signInButton.setTitle("Sign In", for: .normal)
        signInButton.addTarget(self, action: #selector(signInTapped), for: .touchUpInside)
        
        // errorMessageLabel
        errorMessageLabel.translatesAutoresizingMaskIntoConstraints = false
        errorMessageLabel.textAlignment = .center
        errorMessageLabel.textColor = .systemRed
        errorMessageLabel.numberOfLines = 0
        errorMessageLabel.isHidden = true
    }
    
    private func layout() {
        // loginView
        view.addSubview(loginView)
        NSLayoutConstraint.activate([
            loginView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            loginView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: loginView.trailingAnchor, multiplier: 1)
        ])
        
        // titleView
        view.addSubview(titleView)
        NSLayoutConstraint.activate([
            titleView.trailingAnchor.constraint(equalTo: loginView.trailingAnchor),
            loginView.topAnchor.constraint(equalToSystemSpacingBelow: titleView.bottomAnchor, multiplier: 5)
        ])
        
        titleViewLeadingAnchor = titleView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: leadingEdgeOffScreen)
        titleViewLeadingAnchor?.isActive = true
        
        // signInButton
        view.addSubview(signInButton)
        NSLayoutConstraint.activate([
            signInButton.topAnchor.constraint(equalToSystemSpacingBelow: loginView.bottomAnchor, multiplier: 2),
            signInButton.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
            signInButton.trailingAnchor.constraint(equalTo: loginView.trailingAnchor)
        ])
        
        //errorMessageLabel
        view.addSubview(errorMessageLabel)
        NSLayoutConstraint.activate([
            errorMessageLabel.topAnchor.constraint(equalToSystemSpacingBelow: signInButton.bottomAnchor, multiplier: 2),
            errorMessageLabel.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
            errorMessageLabel.trailingAnchor.constraint(equalTo: loginView.trailingAnchor)
        ])
    }
}

//MARK: - Action
extension LoginViewController {
    @objc func signInTapped() {
        login()
    }
}


//MARK: - LoginViewDelegate
extension LoginViewController: LoginViewDelegate {
    func login() {
        guard let username = username, let password = password else {
            assertionFailure("Username and password should never be nil")
            return
        }
        
        if username.isEmpty || password.isEmpty {
            configureView(withMessage: "Username and password cannot be blank")
            return
        }
        
        if username == "x" && password == "x" {
            signInButton.configuration?.showsActivityIndicator = true
            errorMessageLabel.isHidden = true
            delegate?.didLogin()
        } else {
            configureView(withMessage: "Incorrect username or password")
        }
    }
    
    func configureView(withMessage message: String) {
        errorMessageLabel.text = message
        errorMessageLabel.isHidden = false
    }
}


//MARK: - Animations
extension LoginViewController {
    private func animate() {
        let animator1 = UIViewPropertyAnimator(duration: 0.5, curve: .easeInOut) {
            self.titleViewLeadingAnchor?.constant = self.leadingEdgeOnScreen
            self.view.layoutIfNeeded()
        }
        animator1.startAnimation()
        
        let animator2 = UIViewPropertyAnimator(duration: 0.5, curve: .easeInOut) {
            self.titleView.alpha = 1
            self.view.layoutIfNeeded()
        }
        animator2.startAnimation(afterDelay: 0.25)
    }
}
