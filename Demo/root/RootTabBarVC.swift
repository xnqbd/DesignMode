//
//  RootTabBarVC.swift
//  Demo
//
//  Created by admin2 on 2020/1/20.
//  Copyright © 2020 admin2. All rights reserved.
//

import UIKit

class RootTabBarVC: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBar.tintColor = UIColor.kjwd_r(23, g: 146, b: 231, alpha: 1)
        
        let home = DMNavigationController.init(rootViewController: DMHomeVC())
        let my = DMNavigationController.init(rootViewController: MyVC())
//        let my2 = NaVC.init(rootViewController: DMLogin2VC())
        
        addChildViewController(vc: home, title: "首页", iconNormal: "首页_icon", iconSelected: "首页蓝_icon")
//        addChildViewController(vc: my2, title: "我的", iconNormal: "我的_icon", iconSelected: "我的蓝_icon")
        addChildViewController(vc: my, title: "我的", iconNormal: "我的_icon", iconSelected: "我的蓝_icon")
    }
    
    func addChildViewController(vc: UIViewController, title: String, iconNormal: String, iconSelected: String) {
        let normal = UIImage.kjwd_imageNamed(iconNormal).withRenderingMode(.alwaysOriginal)
        let select = UIImage.kjwd_imageNamed(iconSelected).withRenderingMode(.alwaysOriginal)
        vc.tabBarItem.image = normal;
        vc.tabBarItem.selectedImage = select
        vc.title = title
        addChild(vc)
    }
}
