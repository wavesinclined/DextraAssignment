//
//  AppCoordinator.swift
//  DextraiOSAssignment
//
//  Created by Jyotsna Singh on 04/04/19.
//  Copyright © 2019 alice singh. All rights reserved.
//

import Foundation
import UIKit

class AppCoordinator {
    static var shared = AppCoordinator()
    var window: UIWindow = UIWindow(frame: UIScreen.main.bounds)
    
    private init() { }
    
    func start() {
        let homePage = HomeController()
        homePage.delegate = self
        let homeNav = UINavigationController(rootViewController: homePage)
        self.window.rootViewController = homeNav
        self.window.makeKeyAndVisible()
    }
}
