import UIKit
import SwiftUI

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // 1. Ensure we have a valid UIWindowScene
        guard let windowScene = (scene as? UIWindowScene) else { return }

        // 2. Create the SwiftUI view hierarchy
        let rootView = ContentView() // Your SwiftUI main entry point
        let hostingController = UIHostingController(rootView: rootView)

        // 3. Create a new UIWindow and set its root view controller
        let window = UIWindow(windowScene: windowScene)
        window.rootViewController = hostingController

        // 4. Make the window key and visible
        self.window = window
        window.makeKeyAndVisible()
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // This occurs when the scene is released by the system.
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Pause ongoing tasks, disable timers, etc.
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Save data, release resources, and store enough state information.
    }
}
