//
//  WDDecorator.swift
//  Mac
//
//  Created by admin2 on 2020/6/29.
//  Copyright © 2020 admin2. All rights reserved.
//

import Cocoa

class WDDecorator: WDBeverage {
    let bev: WDBeverage
    init(wrapp bev: WDBeverage) {
        self.bev = bev
        super.init()
    }
}


class Egg : WDDecorator {
    override func des() -> String {
        bev.des() + " 鸡蛋"
    }
    override func cost() -> Double {
        bev.cost() + 1
    }
}


class XiangChang : WDDecorator {
    override func des() -> String {
        bev.des() + " 香肠"
    }
    override func cost() -> Double {
        bev.cost() + 2
    }
}
