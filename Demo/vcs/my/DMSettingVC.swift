//
//  DMSettingVC.swift
//  Demo
//
//  Created by admin2 on 2020/3/11.
//  Copyright © 2020 admin2. All rights reserved.
//

import UIKit

class DMSettingVC: CKJBaseTableVC {

    override func viewDidLoad() {
        super.viewDidLoad()
        simpleTableView.updateStyle { (s) in
            s.rowHeight = NSNumber(40)
        }
        
    
        let section1 = CKJCommonSectionModel.section { (_sec) in
            let model1 = CKJGeneralCellModel.general(withTitle: "修改密码", arrow: true) { (m) in
                
            }
            let model2 = CKJGeneralCellModel.general(withTitle: "忘记密码", arrow: true) { (m) in
                
            }
            let model3 = CKJGeneralCellModel.general(withTitle: "意见反馈", arrow: true) { (m) in
                
            }
            let model4 = CKJGeneralCellModel.general(withTitle: "用户协议", arrow: true) { (m) in
                
            }
            let model5 = CKJGeneralCellModel.general(withTitle: "隐私政策", arrow: true) { (m) in
                
            }
            let model6 = CKJGeneralCellModel.general(withTitle: "手势密码", arrow: true) { (m) in
                
            }
            let model7 = CKJGeneralCellModel.general(withTitle: "联系我们", arrow: true) { (m) in
                
            }
            let model8 = CKJGeneralCellModel.general(withTitle: "注销账号", arrow: true) { (m) in
                
            }
            _sec.modelArray = [model1, model2, model3, model4, model5, model6, model7, model8]
        }
        let section2 = CKJCommonSectionModel.section { (_sec) in
            let model1 = CKJOneBtnCellModel.oneBtn(withCellHeight: nil, attTitle: WDAttTitle("退出登录"), detailSettingBlock: nil, clickBtn: {[weak self](m, btn) in
//                self?.commitAction()
                
                UIAlertController.kjwd_alertTitle("提示提示", message: "确定退出登录吗？", alertAction_Left: "取消", leftBlock: nil, right: "确定", rightBlock: {
                    DMLoginManager.manager.cancelLogin()
                }, presentingVC: self)
                
            }) { (make, superView) in
                make.edges.equalTo()
            }
            _sec.modelArray = [model1]
        }
        simpleTableView.dataArr = [section1, section2]
    }
    
    deinit {
        print("销毁DMSettingVC")
    }
}
