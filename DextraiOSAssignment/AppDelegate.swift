//
//  AppDelegate.swift
//  DextraiOSAssignment
//
//  Created by Jyotsna Singh on 04/04/19.
//  Copyright © 2019 alice singh. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        AppCoordinator.shared.start()
        
        return true
    }
}

