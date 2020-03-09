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
            let phone = self.simpleTableView._newtitle(nil, tfText: "177", placeholder: "手机号码", emptyRequirdText: "手机号", cellId: kOInput_Phone, detail: { (m) in
                m.addRequired(CKJInputExpressionRequiredModel.system_phoneRegError())
            })
            
            let pwd = self.simpleTableView._newtitle(nil, tfText: "1", placeholder: "密码", emptyRequirdText: "密码", cellId: kOInput_Pwd, detail: nil)
            
            let empty1 = CKJEmptyCellModel(height: 10, showLine: false)
            
            let login = CKJOneBtnCellModel.oneBtn(withCellHeight: NSNumber(value: 46), attTitle:WDCKJAttributed2("登录", UIColor.white, NSNumber(value: 14)), detailSettingBlock: { (m) in
                m.updateBtnData { (d) in
                    d.cornerRadius = 4;
                    d.normalBgImage = UIImage.kjwd_image(with: DMTheme.btnColor, size: CGSize(width: 300, height: 40))
                }
            }, clickBtn: {[weak self](m, btn) in
                self?.commitAction()
            }) { (make, superView) in
                make.edges.equalTo()
            }
            
            let empty2 = CKJEmptyCellModel(height: 30, showLine: false)
            
            
//            CKJInputCellModel *phone = [self.simpleTableView _newtitle:@"" tfText:"" placeholder:"请输入手机号" emptyRequirdText:@"手机号" cellId:kOInput_Phone detail:^(__kindof CKJInputCellModel * _Nonnull m) {
//                [m addRequired:[CKJInputExpressionRequiredModel system_phoneRegError]];
//            } didSelectRowBlock:nil];
            
            
            
            _sec.modelArray = [logo, phone, pwd, empty1, login, empty2]
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
    
    func commitAction() {
        if (simpleTableView.verityInputFail()) {
            return
        }
        
        
        
        let data = RJInputData(simpleTableView: simpleTableView)
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2) {
            UIWindow.kjwd_appdelegate().rootViewController = RootTabBarVC()
        }
    }
}
