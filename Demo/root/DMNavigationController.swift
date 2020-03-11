//
//  DMNavigationController.swift
//  Demo
//
//  Created by admin2 on 2020/3/7.
//  Copyright © 2020 admin2. All rights reserved.
//

import UIKit

class DMNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
//        [UIImage imageNamed:@"headerImg"]
//        navigationBar.backgroundImage(for: UIBarMetrics.default)
        
        navigationBar.setBackgroundImage(UIImage.kjwd_imageNamed("headerImg"), for: UIBarMetrics.default)
//        navigationBar.titleTextAttributes = dic;
        navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white]
    }
}
