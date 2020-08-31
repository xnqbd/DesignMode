//
//  DMHomeVC.swift
//  Demo
//
//  Created by admin2 on 2020/1/20.
//  Copyright © 2020 admin2. All rights reserved.
//

import UIKit
import Alamofire

class DMHomeVC: CKJBaseTableVC {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "入院办理";
        
        simpleTableView.updateStyle { (s) in
            s.rowHeight = NSNumber(value: 44)
            s.lineEdge = UIEdgeInsets.zero as NSValue
        }
        
        let set = CKJGeneralSetting()
        set.image2_margin_title = 12;
        set.arrow9_margin_super = 12;
        
        
        let section1 = CKJCommonSectionModel.section { (_sec) in
            let model1 = CKJGeneralCellModel.general(withTitle: "1", arrow: true) { [weak self] (m) in
                
                
                let ss = CKJRSA.encryptString("好了19👌%kU-_", publicKey: "MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCnhixMy20eAUmedcOOwfD28JNVIzZgb/DUW8RdvS9jKzJYikYI8qD2fxsLV6Jv73jL5CWp0oHq4UY8/1Xltj0z3dYgIsgp5qc6crmXUIZ0mvlNmlqSSi5IK40lynGwYSDYHPxknWyKWX1v4/hEdw44xTWdoZMQ3XbP/OYZMXt3BwIDAQAB")
                
                

                
                
                let de = CKJRSA.decryptString(ss ?? "" , privateKey: "MIICdgIBADANBgkqhkiG9w0BAQEFAASCAmAwggJcAgEAAoGBAKeGLEzLbR4BSZ51w47B8Pbwk1UjNmBv8NRbxF29L2MrMliKRgjyoPZ/GwtXom/veMvkJanSgerhRjz/VeW2PTPd1iAiyCnmpzpyuZdQhnSa+U2aWpJKLkgrjSXKcbBhINgc/GSdbIpZfW/j+ER3DjjFNZ2hkxDdds/85hkxe3cHAgMBAAECgYB4mGQHnGGeufqPMeNnP0IB4kmNfl3EqpDJro37lRcp4ozJpDCqfE9XY0TKs3lh7xgcXs6mI74Wobj4bC8fwELpi0B23QPy9nZrYiRm0u/UGY2CUN9kA47tPmrg7wC60dWeO7S0wHPGFRrDFSOyLHD89FPQbVdgXQLqBeep6J3ZsQJBANTnX1m434uCA8g9vDBHZ90I5u90tHLVaen4kLClIWB6FIpvQMMSsnHsj2Zq5nSa+YLVd1aAl0bG+k+unPAoj7MCQQDJbzxB3ZNACgSZqeBRKnfASQuMOvTSWZG6UGC875dryPtIN6Q10CeUNsoGuUqEiHICZVU+7eSJvmSkqqoEyjFdAkEAz/0Y0XYiLQ/e0gg9iIy5kt3XfabtgiGrTr9d2rP3X2DkIDl/cxMY8OLBVLSqXs/nYUFZTFBjeOl6L83N03BMsQJATfr1Dd6UcbcvHrnH8EQLhfIBOXFdc81fAAy71oi+SujMdqGrvXVuzQ8E2OOEeJhF4q2N+cWosrZ1SdYT6bTItQJACMLttZ/tH4IeOKB5+Nob38TlSeZOlQpDJlNjT4iefFw3fVTRE4XA3jdbRnngfG8GzGz4m9OqZCGm6WWQvXLv+Q==")
                
                print("\(ss)  \(de)")
            
            }
            
            let model2 = CKJGeneralCellModel.general(withTitle: "WebVC", arrow: true) { [weak self] (m) in
//
//                NSString(scon)
//                let data = [NSString ];
                
//                self?.navigationController?.pushViewController(DMOCVC(), animated: true)
            }
            
            let model3 = CKJGeneralCellModel.general(withTitle: "捕获视频", arrow: true) { [weak self] (m) in
                //
                
                self?.navigationController?.pushViewController(AVViewController(), animated: true)
            }
            
            _sec.modelArray = [model1, model2, model3]
        }
        
        
        simpleTableView.dataArr = [section1]
    }
    
}
