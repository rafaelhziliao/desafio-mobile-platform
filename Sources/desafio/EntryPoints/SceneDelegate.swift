//
//  SceneDelegate.swift
//  desafio
//
//  Created by Fernando Luiz Goulart on 13/04/21.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        guard let windowScene = (scene as? UIWindowScene) else { return }
        let adsListViewController = AdsListViewControllerFactory.make()
        let window = UIWindow(windowScene: windowScene)
        window.rootViewController = adsListViewController
        self.window = window
        window.makeKeyAndVisible()
    }

}
