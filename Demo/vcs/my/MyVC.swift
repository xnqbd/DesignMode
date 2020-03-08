//
//  MyVC.swift
//  Demo
//
//  Created by admin2 on 2020/2/19.
//  Copyright © 2020 admin2. All rights reserved.
//

import UIKit

class MyVC: CKJBaseTableVC {

    override func viewDidLoad() {
        super.viewDidLoad()

        let block = {(image: String, title: String, callback: (() -> ())?) -> CKJGeneralCellModel in
            
            CKJGeneralCellModel.general(withCellHeight: NSNumber(44), cellModel_id: nil, detailSettingBlock: { (m) in
                m.image2Model = CKJImage2Model.init(imageString: image, size: CGSize(width: 30, height: 30), left: 15)
                m.title3Model = CKJTitle3Model.init(attributedText: WDCKJAttributed2(title, UIColor.kjwd_titleColor333333(), nil), left: 10)
                m.arrow9Model = CKJArrow9Model.arrow9System()
            }) { (m) in
                callback?()
            }
        }
        
        
        
        let section1 = CKJCommonSectionModel.section { (_sec) in
            let model1 = block("就诊人_icon", "就诊人", {
                
            })
            let model2 = block("费用清单_icon", "费用清单", {
                
            })
            let model3 = block("报告查询_icon", "报告查询", {
                
            })
            let model4 = block("报告查询_icon", "KJSupportObjc", {[weak self] in

                let vc = KJSupportObjcListVC()
                vc.hidesBottomBarWhenPushed = true
                self?.navigationController?.pushViewController(vc, animated: true)
            })
            _sec.modelArray = [model1, model2, model3, model4]
        }
        let section2 = CKJCommonSectionModel.section {  (_sec) in
        }
        
        simpleTableView.dataArr = [section1]
    }
}
