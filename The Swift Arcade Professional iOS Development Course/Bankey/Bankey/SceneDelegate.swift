//
//  SceneDelegate.swift
//  Bankey
//
//  Created by ปฏิญญา จารุอริยานนท์ on 10/5/2567 BE.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    let loginViewController = LoginViewController()
    let onboardingContainerViewController = OnboardingContainerViewController()
    let mainViewController = MainViewController()

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        loginViewController.delegate = self
        onboardingContainerViewController.delegate = self
        
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        window?.backgroundColor = .systemBackground
        
        registerForNotifications()
        displayLogin()
    }
    
    private func displayLogin() {
        setRootViewController(vc: loginViewController)
    }
    
    private func displayNextScreen() {
        if LocalState.hasOnboarded {
            prepMainView()
            setRootViewController(vc: mainViewController)
        } else {
            setRootViewController(vc: onboardingContainerViewController)
        }
    }
    
    private func prepMainView() {
        mainViewController.setStatusBar()
        UINavigationBar.appearance().isTranslucent = false
        UINavigationBar.appearance().backgroundColor = .systemTeal
    }
    
    func registerForNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(didLogout), name: .login, object: nil)
    }
    
    @objc func didLogout() {
        setRootViewController(vc: loginViewController, duration: 0.1)
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }
}


//MARK: - LoginViewControllerDelegate
extension SceneDelegate: LoginViewControllerDelegate {
    func didLogin() {
        displayNextScreen()
    }
}


//MARK: - OnboardingContainerViewControllerDelegate
extension SceneDelegate: OnboardingContainerViewControllerDelegate {
    func didFinishOnboarding() {
        prepMainView()
        LocalState.hasOnboarded = true
        setRootViewController(vc: mainViewController, duration: 0.1)
    }
}


//MARK: - Transition
extension SceneDelegate {
    func setRootViewController(vc: UIViewController, animated: Bool = true, duration: Float = 0.3) {
        guard animated, let window = self.window else {
            self.window?.rootViewController = vc
            self.window?.makeKeyAndVisible()
            return
        }
        
        window.rootViewController = vc
        window.makeKeyAndVisible()
        UIView.transition(with: window,
                          duration: TimeInterval(duration),
                          options: .transitionCrossDissolve,
                          animations: nil,
                          completion: nil)
    }
}
