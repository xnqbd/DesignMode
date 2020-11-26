//
//  Waiter.swift
//  Mac
//
//  Created by admin2 on 2020/7/4.
//  Copyright © 2020 admin2. All rights reserved.
//

import Cocoa


/// 服务员
class Waiter: NSObject {
    var command: Command?
    
    /// 设置命令
    func setCommand(command: Command) {
        self.command = command
    }
    
    /// 开始执行命令吧
    func startExeCommand() {
        command?.exe()
    }
}
