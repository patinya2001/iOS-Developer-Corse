//
//  FollowerListViewController.swift
//  GitHubFollowers
//
//  Created by ปฏิญญา จารุอริยานนท์ on 6/5/2567 BE.
//

import UIKit

class FollowerListViewController: UIViewController {
    
    var username: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationController?.isNavigationBarHidden = false
        navigationController?.navigationBar.prefersLargeTitles = true
    }
}
