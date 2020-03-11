//
//  CKJOneBtnCell.h
//  MobileHospital_Renji
//
//  Created by admin2 on 2020/1/14.
//  Copyright © 2020 Lyc. All rights reserved.
//

#import "CKJCommonTableViewCell.h"

NS_ASSUME_NONNULL_BEGIN

@class CKJOneBtnCellModel;

typedef void(^CKJOneBtnCellClickBtn)(__kindof CKJOneBtnCellModel *cm, UIButton *btn);

typedef void(^CKJOneBtnCellRowBlock)(__kindof CKJOneBtnCellModel *_Nonnull m);

/*
 

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
 
 
 */
@interface CKJOneBtnCellModel : CKJCommonCellModel

@property (copy, nonatomic) void(^updateConstraint)(MASConstraintMaker *make, UIView *superview);


@property (strong, nonatomic) CKJBtnItemData *btnData;

@property (copy, nonatomic) CKJOneBtnCellClickBtn clickBtn;

- (void)updateBtnData:(void(^)(CKJBtnItemData *btnData))block;

/// 在detailSettingBlock详细设置
+ (instancetype)oneBtnWithCellHeight:(nullable NSNumber *)cellHeight detailSettingBlock:(nullable CKJOneBtnCellRowBlock)detailSettingBlock clickBtn:(CKJOneBtnCellClickBtn)clickBtn updateConstraint:(void(^)(MASConstraintMaker *make, UIView *superview))updateConstraint;
/// 标题
+ (instancetype)oneBtnWithCellHeight:(nullable NSNumber *)cellHeight attTitle:(NSAttributedString *)attTitle detailSettingBlock:(nullable CKJOneBtnCellRowBlock)detailSettingBlock clickBtn:(CKJOneBtnCellClickBtn)clickBtn updateConstraint:(void(^)(MASConstraintMaker *make, UIView *superview))updateConstraint;

@end

@interface CKJOneBtnCell : CKJCommonTableViewCell<CKJOneBtnCellModel *>

@end

NS_ASSUME_NONNULL_END
