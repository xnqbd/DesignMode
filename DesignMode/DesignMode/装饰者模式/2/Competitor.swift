//
//  Competitor.swift
//  Mac
//
//  Created by admin2 on 2020/6/29.
//  Copyright © 2020 admin2. All rights reserved.
//

import Cocoa

// 参与者
class Competitor: NSObject {
    func show() {  // 表演
    }
}

class Singer: Competitor {
    override func show() {
        print("唱歌")
    }
}


