//
//  Command.swift
//  Mac
//
//  Created by admin2 on 2020/7/4.
//  Copyright © 2020 admin2. All rights reserved.
//

import Cocoa

// 命令，订单
protocol Command {
    func exe();
}

/// 烤串命令
class KaoChuanCommand: NSObject, Command {
    var shifu: KaoChuanShifu
    
    init(receiver: KaoChuanShifu) {
        shifu = receiver
    }
    
    func exe() {
        shifu.handleKaoChuan()
    }
}

/// 煮面命令
class NoodleCommand: NSObject, Command {
    var shifu: NoodleShifu
    
    init(receiver: NoodleShifu) {
        shifu = receiver
    }
    
    func exe() {
        shifu.handleNoodle()
    }
}
