//
//  BaseTabBarController.swift
//  Appstore
//
//  Created by OYEGOKE TOMISIN on 01/04/2019.
//  Copyright © 2019 com.OyegokeTomisin. All rights reserved.
//

import UIKit

class BaseTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let today = createNavController(viewController: UIViewController(), title: "Today", imageName: "today_icon")
        let apps = createNavController(viewController: AppsController(), title: "Apps", imageName: "apps")
        let search = createNavController(viewController: AppsSearchCollectionViewController(), title: "Search", imageName: "search")
        viewControllers = [apps,today,search]
    }
    
    fileprivate func createNavController(viewController: UIViewController, title: String, imageName: String) -> UINavigationController{
        let navController = UINavigationController(rootViewController: viewController)
        viewController.view.backgroundColor = .white
        viewController.navigationItem.title = title
        navController.tabBarItem.title = title
        navController.navigationBar.prefersLargeTitles = true
        navController.tabBarItem.image = UIImage(named: imageName)
        return navController
    }
    
}
