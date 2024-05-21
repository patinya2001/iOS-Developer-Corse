//
//  UIViewController+Ext.swift
//  GitHubFollowers
//
//  Created by ปฏิญญา จารุอริยานนท์ on 7/5/2567 BE.
//

import UIKit

extension UIViewController {
    func presentGFAlertOnMainThread(title: String, message: String, buttonTitle: String) {
        DispatchQueue.main.async {
            let alertVC = GFAlertViewController(alertTitle: title, message: message, buttonTitle: buttonTitle)
            alertVC.modalPresentationStyle = .overFullScreen
            self.present(alertVC, animated: false)
        }
    }
}
