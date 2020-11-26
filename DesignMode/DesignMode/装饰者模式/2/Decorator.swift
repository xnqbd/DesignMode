//
//  Decorator.swift
//  Mac
//
//  Created by admin2 on 2020/6/29.
//  Copyright © 2020 admin2. All rights reserved.
//

import Cocoa

class Decorator: Competitor {
    var com: Competitor
    init(wrapp com: Competitor) {
        self.com = com
        super.init()
    }
    override func show() {
        com.show()
    }
}

class PlayMusic: Decorator {
    override func show() {
        print("播放音乐")
        super.show()
    }
}

class Dancer: Decorator {
    override func show() {
        super.show()
        print("跳舞")
    }
}
