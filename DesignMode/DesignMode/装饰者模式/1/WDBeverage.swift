//
//  Beverage.swift
//  Mac
//
//  Created by admin2 on 2020/6/29.
//  Copyright © 2020 admin2. All rights reserved.
//

import Cocoa

class WDBeverage: NSObject {
    func des() -> String {
        ""
    }
    func cost() -> Double {
        0
    }
}

class WDJianBing: WDBeverage {
    override func des() -> String {
        "煎饼果子"
    }
    override func cost() -> Double {
        8
    }
}





