//
//  UIViewController+Ext.swift
//  Bankey
//
//  Created by ปฏิญญา จารุอริยานนท์ on 14/5/2567 BE.
//

import UIKit

extension UIViewController {
    func setStatusBar() {
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.configureWithTransparentBackground()
        UINavigationBar.appearance().standardAppearance = navBarAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = navBarAppearance
        navBarAppearance.backgroundColor = .systemTeal
    }
    
    
    func setTabBarImage(imageName: String, title: String, tag: Int) {
        let configuration = UIImage.SymbolConfiguration(scale: .large)
        let image = UIImage(systemName: imageName, withConfiguration: configuration)
        tabBarItem = UITabBarItem(title: title, image: image, tag: tag)
    }
}
