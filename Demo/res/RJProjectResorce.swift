//
//  RJProjectResorce.swift
//  Demo
//
//  Created by admin2 on 2020/1/20.
//  Copyright © 2020 admin2. All rights reserved.
//

import UIKit

class RJProjectResorce: NSObject {
    class func item1() -> [[Dictionary<String, NSObject>]] {
        
        let b_image = {(imageName: String) -> UIImage in
            UIImage.kjwd_imageNamed(imageName).kjwd_scale(to: CGSize(width: 50, height: 50))
        }
        
//        let a = [KJPrefix_cNormalAttTitle : WDAtt13("预约挂号"), KJPrefix_cNormalImage : b_image("预约挂号_icon")]
        
        let res = [
            [
                [KJPrefix_cNormalAttTitle : WDAtt13("预约挂号"), KJPrefix_cNormalImage : b_image("预约挂号_icon")],
                [KJPrefix_cNormalAttTitle : WDAtt13("排队候诊"), KJPrefix_cNormalImage : b_image("排队候诊_icon")],
                [KJPrefix_cNormalAttTitle : WDAtt13("门诊缴费"), KJPrefix_cNormalImage : b_image("门诊缴费_icon")],
                [KJPrefix_cNormalAttTitle : WDAtt13("医院导航"), KJPrefix_cNormalImage : b_image("医院导航_icon")]
            ],
            [
                [KJPrefix_cNormalAttTitle : WDAtt13("科室专家"), KJPrefix_cNormalImage : b_image("科室专家_icon")],
                [KJPrefix_cNormalAttTitle : WDAtt13("今日出诊"), KJPrefix_cNormalImage : b_image("今日出诊_icon")],
                [KJPrefix_cNormalAttTitle : WDAtt13("用药提醒"), KJPrefix_cNormalImage : b_image("用药提醒_icon")],
                [KJPrefix_cNormalAttTitle : WDAtt13("就诊指南"), KJPrefix_cNormalImage : b_image("就诊指南_icon")]
            ]
        ]
        
        return res
    }
    
}
