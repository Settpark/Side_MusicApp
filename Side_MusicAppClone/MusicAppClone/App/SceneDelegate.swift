//
//  SceneDelegate.swift
//  MusicAppClone
//
//  Created by temp_name on 9/3/24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions) {
            guard let windowScene = (scene as? UIWindowScene) else {
                return
            }
            
            window = UIWindow(windowScene: windowScene)
            
            let viewController: MainTabViewController = MainTabViewController()
            window?.rootViewController = viewController
            window?.makeKeyAndVisible()
        }
    
    func sceneDidDisconnect(_ scene: UIScene) {
    }
    
    func sceneDidBecomeActive(_ scene: UIScene) {
    }
    
    func sceneWillResignActive(_ scene: UIScene) {
    }
    
    func sceneWillEnterForeground(_ scene: UIScene) {
    }
    
    func sceneDidEnterBackground(_ scene: UIScene) {
    }
}

