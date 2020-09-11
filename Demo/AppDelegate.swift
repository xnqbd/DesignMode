//
//  AppDelegate.swift
//  Demo
//
//  Created by admin2 on 2020/1/20.
//  Copyright © 2020 admin2. All rights reserved.
//

import UIKit
import FLEX
import RNCryptor


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
//        window?.backgroundColor = UIColor.red
        print("AppDelegate  \(window)")
        
        IQKeyboardManager.shared().isEnabled = true
//        [IQKeyboardManager sharedManager].enable = YES;
    
//        DMLoginManager.manager.loginState = .online
        DMLoginManager.manager.loginStateInit()
        FLEXManager.shared.showExplorer()
        
        
//        window?.rootViewController = WebVC()
        
        window?.makeKeyAndVisible()
        
        
        
        
//        let key = "1234567890123456"
//
//        let data = "asjhdbqiws家舍不得".data(using: .utf8)
//
//        let enData = RNCryptor.encrypt(data: data!, withPassword: key)
//
//
//        let enStr = String.init(data: enData, encoding: .utf8)
//
//        print(enStr)
//
//
//        RNCryptor.Encryptor.
        
        // Encryption
        let data = "asjhdbqiws家舍不得".data(using: .utf8)!
        let password = "Secret password"
        let enData = RNCryptor.encrypt(data: data, withPassword: password)

        let enStr = String.init(data: enData, encoding: .utf8)
        print(enStr)
        // Decryption
//        do {
//            let originalData = try RNCryptor.decrypt(data: ciphertext, withPassword: password)
//            // ...
//        } catch {
//            print(error)
//        }
        
        
        
        return true
    }
}



