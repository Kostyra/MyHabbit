

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    let imageHabit = UIImage(systemName: "list.dash.header.rectangle")
    let imageInfo = UIImage(systemName: "info.circle")
    

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
       
        guard let scene = (scene as? UIWindowScene) else { return }

        let window = UIWindow(windowScene: scene)

        let habitsViewController = HabitsViewController()
        let habitsNC = UINavigationController(rootViewController: habitsViewController)

        habitsViewController.view.backgroundColor = UIColor(named: "tabBar")


        let infoViewController = InfoViewController()
        let infoNC = UINavigationController(rootViewController: infoViewController)
        infoViewController.title = "Информация"
        infoViewController.view.backgroundColor = UIColor(named: "tabBar")

        habitsViewController.tabBarItem = UITabBarItem(title: "Привычки", image: imageHabit, tag: 0)
        infoViewController.tabBarItem = UITabBarItem(title: "Информация", image: imageInfo, tag: 1)
        UITabBar.appearance().tintColor = UIColor(named: "сolorPink")
        UITabBar.appearance().unselectedItemTintColor = UIColor.darkGray

        let tabBarController = UITabBarController()
        tabBarController.tabBar.backgroundColor = UIColor(named: "tabBar")
        tabBarController.viewControllers = [habitsNC,infoNC]



        window.rootViewController = tabBarController
        window.makeKeyAndVisible()
        self.window = window
        
    }



}

