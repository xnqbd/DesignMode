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
        
        simpleTableView.updateStyle { (s) in
            s.rowHeight = NSNumber(value: 40)
        }
        
        let arr = [
            [
                CKJMyVCItem.init(image: "我的预约", title: "我的挂号", click: { (temp) in
                    print("点击挂号")
                }),
                CKJMyVCItem.init(image: "家庭联系人", title: "我的收藏", click: { (temp) in
                    print("点击收藏")
                }),
                CKJMyVCItem.init(image: "我的账单", title: "电子处方", click: { (temp) in
                    print("点击收藏")
                }),
                CKJMyVCItem.init(image: "我的健康卡", title: "我的卡片", click: { (temp) in
                    print("点击收藏")
                }),
                CKJMyVCItem.init(image: "我的健康卡", title: "电子健康卡", click: { (temp) in
                    print("点击收藏")
                }),
                CKJMyVCItem.init(image: "健康账户", title: "健康账户", click: { (temp) in
                    print("点击收藏")
                }),
                CKJMyVCItem.init(image: "健康账户", title: "金苗宝", click: { (temp) in
                    print("点击收藏")
                }),
                CKJMyVCItem.init(image: "健康账户", title: "中药代煎", click: { (temp) in
                    print("点击收藏")
                }),
                CKJMyVCItem.init(image: "健康账户", title: "我的消息", click: { (temp) in
                    print("点击收藏")
                }),
                CKJMyVCItem.init(image: "健康账户", title: "修改手机号", click: { (temp) in
                    print("点击收藏")
                })
            ],
            [
                CKJMyVCItem.init(image: "设置", title: "设置", click: { [weak self](temp) in
                    let vc = DMSettingVC()
                    vc.hidesBottomBarWhenPushed = true
                    self?.navigationController?.pushViewController(vc, animated: true)
                })
            ]
        ]
        
        
        for group in arr {
            let section1 = CKJCommonSectionModel.section { (_sec: CKJCommonSectionModel) in
                for target in group {
                    let temp = WDCKJAttributed2(target.title as? String, UIColor.darkGray, NSNumber(value: 14))
                    let m = CKJGeneralCellModel.general(withImageName: target.image as! String, imageSize: CGSize(width: 22, height: 22), title: temp, arrow: true) {(m) in
                        target.click(m)
                    }
                    _sec.add(m)
                }
            }
            simpleTableView.append(section1)
        }

        WDCKJ_ifDEBUG({
            let secti = CKJCommonSectionModel.section { (_sec) in
                _sec.add(CKJGeneralCellModel.general(withTitle: "KJSupportObjc", arrow: true) {[weak self] m in
                    let vc = KJSupportObjcListVC()
                    vc.hidesBottomBarWhenPushed = true
                    self?.navigationController?.pushViewController(vc, animated: true)
                })
                _sec.add(CKJGeneralCellModel.general(withTitle: "设置rootVC = ViewController()", arrow: true) { m in
                    let vc = ViewController()
                    vc.view.backgroundColor = UIColor.purple
                    vc.hidesBottomBarWhenPushed = true
                    UIWindow.kjwd_appdelegate().rootViewController = vc
                })
                
            }
            self.simpleTableView.append(secti)
        }, nil)
    }
}
