//
//  AC.swift
//  Mac
//
//  Created by admin2 on 2020/7/8.
//  Copyright © 2020 admin2. All rights reserved.
//

import Cocoa

/// 家庭电路
protocol AC {
    func outputAC() -> String;
}

class AC110: NSObject, AC {
    func outputAC() -> String {
        return "110"
    }
}

class AC220: NSObject, AC {
    func outputAC() -> String {
        return "220"
    }
}
