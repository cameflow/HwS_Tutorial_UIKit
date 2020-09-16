//
//  TabBarController.swift
//  WhitehousePettitions-UIKit
//
//  Created by Alejandro Terrazas on 15/09/20.
//  Copyright © 2020 Alejandro Terrazas. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        viewControllers = [createMainVC()]

        
    }
    
    func createMainVC() -> UINavigationController {
        let mainVC = ViewController()
        mainVC.tabBarItem = UITabBarItem(tabBarSystemItem: .mostRecent, tag: 0)
        
        return UINavigationController(rootViewController: mainVC)
    }



}
