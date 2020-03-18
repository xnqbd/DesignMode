//
//  DMHomeVC.swift
//  Demo
//
//  Created by admin2 on 2020/1/20.
//  Copyright © 2020 admin2. All rights reserved.
//

import UIKit

class DMHomeVC: CKJBaseTableVC, CKJScrollViewCellDelegate {
    
    // MARK: - CKJSimpleTableView 数据源 和 代理
    override func returnCell_Model_keyValues(_ s: CKJSimpleTableView) -> [String : [String : Any]] {
        
        let btnsCellConfig1 = CKJBaseBtnsCellConfig.btnsConfig { (m) in
            m.delegate = m.squareWithNumberOfItems(inSingleLine: 4)
        }
        let scrollConfig = CKJScrollViewCellConfig(itemWidth: 90, itemSpace: 10) { (m) in
            m.items_Edge_ScrollView = UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20)
            m.delegate = self;
            m.updateIndicatorConfig { (i) in
                i.bottom = 10
                i.longViewHeight = 3;
                i.radius = 1.5
            }
        }
        return [
            NSStringFromClass(CKJScrollViewCellModel.self) : [KJPrefix_cellKEY : NSStringFromClass(CKJScrollViewCell.self), KJPrefix_isRegisterNibKEY : false, KJPrefix_configDicKEY_ConfigModel : scrollConfig],
            NSStringFromClass(CKJBtnsCell1Model.self) : [KJPrefix_cellKEY : NSStringFromClass(CKJBtnsCell1.self), KJPrefix_isRegisterNibKEY : false, KJPrefix_configDicKEY_ConfigModel : btnsCellConfig1]
        ]
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
            
            
            let scroll = CKJScrollViewCellModel.scrollView(withCellHeight: NSNumber(value: 100), detailSettingBlock: nil)
            _sec.modelArray = [scroll]
//            let model1 = CKJGeneralCellModel.general(withCellHeight: NSNumber(44), cellModel_id: nil, detailSettingBlock: { (m) in
//                m.title3Model = CKJTitle3Model.init(attributedText: WDAtt15_5("你好"), left: 20)
//                m.likePrice8Model = CKJLikePriceLabel8Model.init(attText: WDAtt15_5("100.00"), left: 0, right: 10)
//                m.arrow9Model = CKJArrow9Model.arrow9System();
//            }) { (m) in
//                print("点击了")
//            }
//
//            let model2 = CKJCellModel.ckjCell(withCellHeight: nil, cellModel_id: nil, detailSettingBlock: { (m) in
//                m.title3Model = CKJTitle3Model.init(attributedText: WDAtt15_5("CKJCell"), left: 20)
//                m.likePrice61Model = CKJLikePriceLabel61Model.likePriceModel(withAttText: WDAtt15_5("CKJCell"), left: 0, right: 10)
//                m.arrow9Model = CKJArrow9Model.arrow9System();
//            }, didSelectRowBlock: nil)
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
    
    
    func createItemView(for cell: CKJScrollViewCell) -> [UIView] {
        var arr: [UIView] = []
        for _ in 0..<10 {
            let btn1 = UIButton(type: .custom)
            //btn1.backgroundColor = UIColor.kjwd_arc4()
            let image = UIImage.kjwd_imageNamed("电子健康卡").kjwd_scale(to: CGSize(width: 40, height: 40))
            btn1.setAttributedTitle(WDAtt15_5("电子健康卡"), for: .normal)
            btn1.setImage(image, for: .normal)
            btn1.kjwd_layoutButton(with: .top, imageTitleSpace: 10)
            arr.append(btn1)
        }
        return arr
    }
}
