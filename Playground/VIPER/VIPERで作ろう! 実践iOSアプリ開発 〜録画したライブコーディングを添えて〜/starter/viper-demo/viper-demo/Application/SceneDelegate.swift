//
//  SceneDelegate.swift
//  viper-demo
//
//  Created by HIROKI IKEUCHI on 2024/12/03.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else {
            return
        }
        
        window = UIWindow(windowScene: windowScene)
        window?.makeKeyAndVisible()
                
        guard let articleListViewController = UIStoryboard(name: "ArticleList", bundle: nil).instantiateInitialViewController()
                as? ArticleListViewController else {
            fatalError()
        }
        
//        guard let articleListViewController = UIStoryboard(name: "ArticleDetail", bundle: nil).instantiateInitialViewController()
//                as? ArticleDetailViewController else {
//            fatalError()
//        }
//        articleListViewController.articleEntity = ArticleEntity(id: 1, userId: 2, title: "demo-title", body: "demo-body")
        
        let navigation = UINavigationController(rootViewController: articleListViewController)
        window?.rootViewController = navigation
    }


}

