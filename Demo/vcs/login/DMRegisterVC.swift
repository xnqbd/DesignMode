//
//  DMRegisterVC.swift
//  Demo
//
//  Created by admin2 on 2020/3/11.
//  Copyright © 2020 admin2. All rights reserved.
//

import UIKit

class DMRegisterVC: CKJBaseTableVC {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "注册"
        view.backgroundColor = UIColor.white
        simpleTableView.backgroundColor = view.backgroundColor
        simpleTableView.updateStyle { (s) in
            s.rowHeight = NSNumber(40)
            s.haveTitleStyle.left = 0
        }
        let section1 = CKJCommonSectionModel.section { (_sec: CKJCommonSectionModel) in
            let logo = CKJImageViewCellModel.imageView(withCellHeight: NSNumber(value: 132), detailSettingBlock: { (m) in
                m.localImage = UIImage.kjwd_imageNamed("logo")
                m._showLine(false)
            }) { (make, superView) in
                make.center.equalTo()(superView)
                make.size.equalTo()(CGSize(width: 120, height: 120))
            }
            let name = self.simpleTableView._newtitle(nil, tfText: "", placeholder: "请输入真实姓名", emptyRequirdText: "真实姓名", cellId: kOInput_Name, detail: { (m) in
                m.lineEdge = NSValue(uiEdgeInsets: UIEdgeInsets.zero)
            })
            let idCardNumber = self.simpleTableView._newtitle(nil, tfText: "", placeholder: "请输入身份证号", emptyRequirdText: "身份证号", cellId: kOInput_idCardNumber, detail: { (m) in
                m.lineEdge = NSValue(uiEdgeInsets: UIEdgeInsets.zero)
            })
            
            let phone = self.simpleTableView._newtitle(nil, tfText: "", placeholder: "手机号码", emptyRequirdText: "手机号", cellId: kOInput_Phone, detail: { (m) in
                m.lineEdge = NSValue(uiEdgeInsets: UIEdgeInsets.zero)
                m.addRequired(CKJInputExpressionRequiredModel.system_phoneRegError())
            })
            
            let code = self.simpleTableView._newtitle(nil, tfText: "", placeholder: "请输入验证码", emptyRequirdText: "验证码", cellId: kOInput_VerityCode, detail: { (m) in
                m.lineEdge = NSValue(uiEdgeInsets: UIEdgeInsets.zero)
                m.getCodeModel = CKJGetCodeModel(clickCodeBtnBlock: {[weak self] (triggerCodeBlock) in
                    
                    let _phone = self?.simpleTableView.inputCellModel(ofID: kOInput_Phone)?.getTfText();
                    HZYHFHTTPRequest.kj_after(timeInterval: 0, callBackType: .Success, response: nil, success: { (succ) in
                        triggerCodeBlock(60); // 触发定时器
                        MBProgressHUD.kjwd_showMessage("验证码发送成功", to: self?.view)
                        self?.simpleTableView.inputCellModel(ofID: kOInput_VerityCode)?.tfModel.readOnly_currentTF?.becomeFirstResponder()
                    }, failure: { (fail) in
                    }, exception: nil) {
                    }
                }, detailSettingBlock: nil)
            })
            
            let pwd = self.simpleTableView._newtitle(nil, tfText: "", placeholder: "密码", emptyRequirdText: "密码", cellId: kOInput_Pwd) {(m) in
                m.lineEdge = NSValue(uiEdgeInsets: UIEdgeInsets.zero)
            }
            
            let confirmPwd = self.simpleTableView._newtitle(nil, tfText: "", placeholder: "再次输入密码", emptyRequirdText: "确认密码", cellId: kOInput_ConfirmPwd) {(m) in
                m.lineEdge = NSValue(uiEdgeInsets: UIEdgeInsets.zero)
            }
            let empty1 = CKJEmptyCellModel(height: 20, showLine: false)
            let regiter = CKJOneBtnCellModel.oneBtn(withCellHeight: NSNumber(value: 46), title:"注册", detailSettingBlock: { (m) in
                m.updateBtnData { (d) in
                    d.cornerRadius = 4;
                    d.normalBgImage = UIImage.kjwd_image(with: DMTheme.btnColor, size: CGSize(width: 300, height: 40))
                }
            }, clickBtn: {[weak self](m, btn) in
                
            }) { (make, superView) in
                make.edges.equalTo()
            }
            
            _sec.modelArray = [logo, name, idCardNumber, phone, code, pwd, confirmPwd, empty1, regiter]
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
        
//        DMLoginManager.manager.login(username: data.phone!, pwd: data.pwd!)
    }
}
