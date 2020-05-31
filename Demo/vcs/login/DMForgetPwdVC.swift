//
//  DMForgetPwdVC.swift
//  Demo
//
//  Created by admin2 on 2020/3/11.
//  Copyright © 2020 admin2. All rights reserved.
//

import UIKit

class DMForgetPwdVC: CKJBaseTableVC {
    
    override func simpleTableViewStyle() -> UITableView.Style {
        return .plain
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "找回密码"
        view.backgroundColor = UIColor.white
        simpleTableView.backgroundColor = view.backgroundColor
        simpleTableView.updateStyle { (s) in
            s.rowHeight = NSNumber(40)
            s.haveTitleStyle.left = 0
        }
        
        let section1 = CKJCommonSectionModel.section { (_sec: CKJCommonSectionModel) in
           
            let phone = self.simpleTableView._newtitle(nil, tfText: "17724801294", placeholder: "请输入手机号", emptyRequirdText: "手机号", cellId: kOInput_Phone, detail: { (m) in
                m.lineEdge = NSValue(uiEdgeInsets: UIEdgeInsets.zero)
                m.addRequired(CKJInputExpressionRequiredModel.system_phoneRegError())
            })
            
            let code = self.simpleTableView._newtitle(nil, tfText: "", placeholder: "请输入验证码", emptyRequirdText: "验证码", cellId: kOInput_VerityCode, detail: { (m) in
                m.lineEdge = NSValue(uiEdgeInsets: UIEdgeInsets.zero)
                m.getCodeModel = CKJGetCodeModel(clickCodeBtnBlock: {[weak self] (triggerCodeBlock) in
                    
                    let _phone = self?.simpleTableView.inputCellModel(ofID: kOInput_Phone)?.getTfText();
                    HZYHFHTTPRequest.kj_after(timeInterval: 0, callBackType: .Success, response: nil, success: { (succ) in
                        triggerCodeBlock(60); // 触发定时器
                        CKJHUD.kjwd_showMessage("验证码发送成功", to: self?.view)
                        
                        self?.simpleTableView.inputCellModel(ofID: kOInput_VerityCode)?.tfModel.readOnly_currentTF?.becomeFirstResponder()
                        
                    }, failure: { (fail) in
                        
                    }, exception: nil) {
                        
                    }
                    
                }, detailSettingBlock: nil)
            })
            
            let pwd = self.simpleTableView._newtitle(nil, tfText: "111", placeholder: "密码", emptyRequirdText: "密码", cellId: kOInput_Pwd) {(m) in
                m.lineEdge = NSValue(uiEdgeInsets: UIEdgeInsets.zero)
            }
            let confirmPwd = self.simpleTableView._newtitle(nil, tfText: "111", placeholder: "再次输入密码", emptyRequirdText: "确认密码", cellId: kOInput_ConfirmPwd) {(m) in
                m.lineEdge = NSValue(uiEdgeInsets: UIEdgeInsets.zero)
            }

//            
//            let login = CKJOneBtnCellModel.oneBtn(withCellHeight: NSNumber(value: 46), title:"找回密码", detailSettingBlock: { (m) in
//                m.updateBtnData { (d) in
//                    d.cornerRadius = 4;
//                    d.normalBgImage = UIImage.kjwd_image(with: DMTheme.btnColor, size: CGSize(width: 300, height: 40))
//                }
//            }, clickBtn: {[weak self](m, btn) in
//                
//            }) { (make, superView) in
//                make.edges.equalTo()
//            }
            
            let empty1 = CKJEmptyCellModel(height: 30, showLine: false)
            
            
            _sec.modelArray = [phone, code, pwd, confirmPwd, empty1]
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
        
    }
}
