//
//  DMHomeVC.swift
//  Demo
//
//  Created by admin2 on 2020/1/20.
//  Copyright © 2020 admin2. All rights reserved.
//

import UIKit

class DMHomeVC: CKJBaseTableVC {
    
    override func returnCell_Model_keyValues(_ s: CKJSimpleTableView) -> [String : [String : Any]] {
        let config1 = CKJBaseBtnsCellConfig.btnsConfig { (m) in
            m.delegate = m.squareWithNumberOfItems(inSingleLine: 4)
        }
        return [NSStringFromClass(CKJBtnsCell1Model.self) : [KJPrefix_cellKEY : NSStringFromClass(CKJBtnsCell1.self), KJPrefix_isRegisterNibKEY : false, KJPrefix_configDicKEY_ConfigModel : config1]]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.red
        
//        simpleTableView.updateStyle { (s) in
//            s.rowHeight = NSNumber(40)
//            s.haveTitleStyle.left = 20
//            s.haveTitleStyle.titleWidth = NSNumber(60);
//        }
        
        let section1 = CKJCommonSectionModel.section { (_sec: CKJCommonSectionModel) in
            
           let logo = CKJImageViewCellModel.imageView(withCellHeight: NSNumber(value: 132), detailSettingBlock: { (m) in
                m.localImage = UIImage.kjwd_imageNamed("backgroundimage")
            }) { (make, superView) in
                make.edges.equalTo()
            }
            _sec.add(logo)
            
            let items = CKJBtnItemData.returnItems(withDicsnew: DMRes.item2()) { (cd: CKJBtnItemData, index: UInt) in
                cd.layout_Button = { (btn: UIButton) in
                    btn.kjwd_layoutButton(with: .top, imageTitleSpace: 13)
                }
                cd.click_Button = { (btn: UIButton, itemData: CKJBtnItemData) in
                    
                }
            }
            let arr = CKJBtnsCell1Model.btnsCellModel(withItemsnew: items, cellHeight: NSNumber(90), leftMargin: NSNumber(0), rightMargin: NSNumber(0)) { (m: CKJBaseBtnsCellModel, cellModel_index: UInt) in
            }
            
            _sec.add(arr);
        }
        
        let section2 = CKJCommonSectionModel.section { (_sec) in
            
            let model1 = CKJGeneralCellModel.general(withCellHeight: NSNumber(44), cellModel_id: nil, detailSettingBlock: { (m) in
                m.title3Model = CKJTitle3Model.init(attributedText: WDAtt15_5("你好"), left: 20)
                m.likePrice8Model = CKJLikePriceLabel8Model.init(attText: WDAtt15_5("100.00"), left: 0, right: 10)
                m.arrow9Model = CKJArrow9Model.arrow9System();
            }) { (m) in
                print("点击了")
            }
            
            let model2 = CKJCellModel.ckjCell(withCellHeight: nil, cellModel_id: nil, detailSettingBlock: { (m) in
                m.title3Model = CKJTitle3Model.init(attributedText: WDAtt15_5("CKJCell"), left: 20)
                m.likePrice61Model = CKJLikePriceLabel61Model.likePriceModel(withAttText: WDAtt15_5("CKJCell"), left: 0, right: 10)
                m.arrow9Model = CKJArrow9Model.arrow9System();
            }, didSelectRowBlock: nil)
//            let model3 = self.simpleTableView._newtitle("用户名", tfText: "", placeholder: "请输入用户名", emptyRequirdText: nil, cellId: kOInput_Name, detail: { (m) in
//
//                m.updateTFModel { (tfm) in
////                    tfm.
//                }
//            }, didSelectRowBlock: nil)
            
            
//            _sec.modelArray = [model1, model2, model3]
        }
        simpleTableView.dataArr = [section1, section2]
    }
    
    override func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        view.endEditing(true)
    }
    
}
