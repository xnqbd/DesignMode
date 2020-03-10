//
//  DMLoginManager.swift
//  Demo
//
//  Created by admin2 on 2020/3/8.
//  Copyright © 2020 admin2. All rights reserved.
//

import UIKit


enum LoginState {
    case online, offline
}

class DMLoginManager: CKJBaseModel {
    static let manager = DMLoginManager()
    
    var loginState = {
       return LoginState.offline
    }()
    
    
    func login(username: String, pwd: String) {
        
        HZYHFHTTPRequest.kj_after(timeInterval: 2, callBackType: .Success, response: nil, success: { (suc) in
            self.loginSuccess()
        }, failure: { (fail) in
            self.loginFail()
        }, exception: nil) {
            
        }
    }
    
    func loginSuccess() {
        loginState = .online
        UIWindow.kjwd_appdelegate().rootViewController = RootTabBarVC()
    }
    func loginFail() {
        loginState = .offline
    }
}
