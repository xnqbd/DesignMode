//
//  Adapter.swift
//  Mac
//
//  Created by admin2 on 2020/7/8.
//  Copyright © 2020 admin2. All rights reserved.
//

import Cocoa

protocol DC5Adapter {
    /// 是否需支持
    func support(ac: AC) -> Bool;
    
    /// 输出5V电压
    func outputDC5V(ac: AC);
}


class ChinaPowerAdapter: NSObject, DC5Adapter {
    static let voltage = "220"
    
    func support(ac: AC) -> Bool {
        return ChinaPowerAdapter.voltage == ac.outputAC()
    }
    
    func outputDC5V(ac: AC) {
        
    }
}

class AmericaPowerAdapter: NSObject, DC5Adapter {
    static let voltage = "110"
    
    func support(ac: AC) -> Bool {
        return AmericaPowerAdapter.voltage == ac.outputAC()
    }
    
    func outputDC5V(ac: AC) {
        
    }
}
