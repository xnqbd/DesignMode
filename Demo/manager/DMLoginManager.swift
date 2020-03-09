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
    
    
    
}
