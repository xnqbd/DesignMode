//
//  DMLoginVC.swift
//  Demo
//
//  Created by admin2 on 2020/3/8.
//  Copyright © 2020 admin2. All rights reserved.
//

import UIKit

class DMLoginVC: CKJBaseTableVC {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        simpleTableView.updateStyle { (s) in
            s.rowHeight = NSNumber(40)
        }
        
        let section1 = CKJCommonSectionModel.section { (_sec: CKJCommonSectionModel) in
            let logo = CKJImageViewCellModel.imageView(withCellHeight: NSNumber(value: 132), detailSettingBlock: { (m) in
                m.localImage = UIImage.kjwd_imageNamed("logo")
                m.showLine = false;
            }) { (make, superView) in
                make.center.equalTo()(superView)
                make.size.equalTo()(CGSize(width: 120, height: 120))
            }
            let phone = self.simpleTableView._newtitle("", tfText: "177", placeholder: "请输入手机号", emptyRequirdText: "手机号", cellId: kOInput_Phone, detail: { (m) in
                m.addRequired(CKJInputExpressionRequiredModel.system_phoneRegError())
            })
            
            let login = CKJOneBtnCellModel.oneBtn(withCellHeight: NSNumber(value: 100), attTitle:WDCKJAttributed2("登录", UIColor.red, NSNumber(value: 14)), detailSettingBlock: { (m) in
                m.updateBtnData { (d) in
                    d.cornerRadius = 4;
                    d.normalBgImage = UIImage.kjwd_image(with: UIColor.blue, size: CGSize(width: 300, height: 40))
//                    d.normalBgImage = UIImage.kjwd_imageNamed("logo")
                }
            }, clickBtn: {(m, btn) in
                print("登录")
            }) { (make, superView) in
                make.edges.equalTo()(UIEdgeInsets.init(top: 10, left: 0, bottom: 30, right: 0))
            }
            
            
//            CKJInputCellModel *phone = [self.simpleTableView _newtitle:"" tfText:"" placeholder:"请输入手机号" emptyRequirdText:@"手机号" cellId:kOInput_Phone detail:^(__kindof CKJInputCellModel * _Nonnull m) {
//                [m addRequired:[CKJInputExpressionRequiredModel system_phoneRegError]];
//            } didSelectRowBlock:nil];
            
            
            
            _sec.modelArray = [logo, phone, login]
        }
        
        simpleTableView.dataArr = [section1]
    }
    
    override func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        view.endEditing(true)
    }
    
    override func layoutTableViewFrame(_ tableV: CKJSimpleTableView) {
        tableV.kjwd_mas_makeConstraints { (make, superView) in
            make.edges.equalTo()(UIEdgeInsets.init(top: 0, left: 20, bottom: 0, right: 20))
        }
    }
}
