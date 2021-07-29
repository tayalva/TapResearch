//
//  SceneDelegate.swift
//  TapResearch
//
//  Created by Taylor Smith on 7/29/21.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
      
        guard let windowScene = (scene as? UIWindowScene) else { return }

        let window = UIWindow(windowScene: windowScene)
        window.rootViewController = MainVC()
        self.window = window
        window.makeKeyAndVisible()
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
        if let timeStamp = UserDefaults.standard.object(forKey: "timeStampEnteredBackground") as? Date {
            
            if let difference = Calendar.current.dateComponents([.second], from: timeStamp, to: Date()).second {
                
                if difference >= 30 {
                    UserDefaults.standard.set(nil, forKey: "payload")
                }
            }
        }
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        UserDefaults.standard.set(Date(), forKey: "timeStampEnteredBackground")
    }
}
