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
        
        
        let arr = [
            [
                CKJMyVCItem.init(image: "我的预约", title: "我的挂号", click: { (temp) in
                    print("点击挂号")
                }),
                CKJMyVCItem.init(image: "家庭联系人", title: "我的收藏", click: { (temp) in
                    print("点击收藏")
                })
//                [KJPrefix_cNormalAttTitle : "我的挂号", KJPrefix_cNormalImage : "我的预约"],
//                [KJPrefix_cNormalAttTitle : "我的收藏", KJPrefix_cNormalImage : "家庭联系人"],
//                [KJPrefix_cNormalAttTitle : "电子处方", KJPrefix_cNormalImage : "我的账单"],
//                [KJPrefix_cNormalAttTitle : "我的卡片", KJPrefix_cNormalImage : "我的健康卡"],
//                [KJPrefix_cNormalAttTitle : "电子健康卡", KJPrefix_cNormalImage : "我的健康卡"],
//                [KJPrefix_cNormalAttTitle : "健康账户", KJPrefix_cNormalImage : "健康账户"],
//                [KJPrefix_cNormalAttTitle : "金苗宝", KJPrefix_cNormalImage : "健康账户"],
//                [KJPrefix_cNormalAttTitle : "中药代煎", KJPrefix_cNormalImage : "健康账户"],
//                [KJPrefix_cNormalAttTitle : "我的消息", KJPrefix_cNormalImage : "健康账户"],
//                [KJPrefix_cNormalAttTitle : "修改手机号", KJPrefix_cNormalImage : "健康账户"],
            ],
            [
                
                CKJMyVCItem.init(image: "设置", title: "设置", click: { (temp) in
                    print("点击收藏")
                })
//                [KJPrefix_cNormalAttTitle : "设置", KJPrefix_cNormalImage : "设置"],
            ]
        ]
        
        
        for group in arr {
            let section1 = CKJCommonSectionModel.section { (_sec: CKJCommonSectionModel) in
                for target in group {
//                    WDCKJAttributed2(target.title as? String, UIColor.kjwd_subTitle(), NSNumber(value: 14))
                    
                    let temp = WDCKJAttributed2(target.title as? String, UIColor.darkGray, NSNumber(value: 14))
                    
                    let m = CKJGeneralCellModel.general(withImageName: target.image as! String, imageSize: CGSize(width: 22, height: 22), title: temp, arrow: true) {(m) in
                        target.click(m)
                    }
                     m.cellHeight = NSNumber(value: 40)
                    
                    _sec.add(m)
                }
            }
            simpleTableView.append(section1)
        }
//
//
//
//        let block = {(image: String, title: String, callback: (() -> ())?) -> CKJGeneralCellModel in
//
//            CKJGeneralCellModel.general(withCellHeight: NSNumber(44), cellModel_id: nil, detailSettingBlock: { (m) in
//                m.image2Model = CKJImage2Model.init(imageString: image, size: CGSize(width: 30, height: 30), left: 15)
//                m.title3Model = CKJTitle3Model.init(attributedText: WDCKJAttributed2(title, UIColor.kjwd_title(), nil), left: 10)
//                m.arrow9Model = CKJArrow9Model.arrow9System()
//            }) { (m) in
//                callback?()
//            }
//        }
//
//
//
//        let section1 = CKJCommonSectionModel.section { (_sec) in
//            let model1 = block("就诊人_icon", "就诊人", {
//
//            })
//            let model2 = block("费用清单_icon", "费用清单", {
//
//            })
//            let model3 = block("报告查询_icon", "报告查询", {
//
//            })
//            let model4 = block("报告查询_icon", "KJSupportObjc", {[weak self] in
//
//                let vc = KJSupportObjcListVC()
//                vc.hidesBottomBarWhenPushed = true
//                self?.navigationController?.pushViewController(vc, animated: true)
//            })
//            _sec.modelArray = [model1, model2, model3, model4]
//        }
//        let section2 = CKJCommonSectionModel.section {  (_sec) in
//        }
//
//        simpleTableView.dataArr = [section1]
    }
}
