//
//  AppDelegate.swift
//  Demo
//
//  Created by admin2 on 2020/1/20.
//  Copyright © 2020 admin2. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = UIColor.white
        print("AppDelegate  \(window)")
        
        
//        let online = true
        let online = false
        
        if online {
            window?.rootViewController = RootTabBarVC()
        } else {
            window?.rootViewController = DMLoginVC()
        }
        
        window?.makeKeyAndVisible()
        
        
        return true
    }


}

