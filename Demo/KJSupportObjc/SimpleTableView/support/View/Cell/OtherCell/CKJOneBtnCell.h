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
 
 

 CKJOneBtnCellModel *login = [CKJOneBtnCellModel oneBtnWithCellHeight:@50 title:@"登录" detailSettingBlock:^(__kindof CKJOneBtnCellModel * _Nonnull m) {
     [m updateBtnData:^(CKJBtnItemData * _Nonnull btnData) {
         btnData.cornerRadius = 3;
         btnData.normalBgImage = [UIImage kjwd_imageWithColor:[UIColor redColor] size:CGSizeMake(300, 40)];
     }];
 } clickBtn:^(__kindof CKJOneBtnCellModel * _Nonnull cm, UIButton * _Nonnull btn) {
     NSLog(@"%@   ", @"点击登录");
 } updateConstraint:^(MASConstraintMaker * _Nonnull make, UIView * _Nonnull superview) {
     make.edges.equalTo(superview);
 }];
 
 
 */
@interface CKJOneBtnCellModel : CKJCommonCellModel

@property (copy, nonatomic) void(^updateConstraint)(MASConstraintMaker *make, UIView *superview);


@property (strong, nonatomic) CKJBtnItemData *btnData;

@property (copy, nonatomic) CKJOneBtnCellClickBtn clickBtn;

- (void)updateBtnData:(void(^)(CKJBtnItemData *btnData))block;

/// 在detailSettingBlock详细设置
+ (instancetype)oneBtnWithCellHeight:(nullable NSNumber *)cellHeight detailSettingBlock:(nullable CKJOneBtnCellRowBlock)detailSettingBlock clickBtn:(CKJOneBtnCellClickBtn)clickBtn updateConstraint:(void(^)(MASConstraintMaker *make, UIView *superview))updateConstraint;
/// 标题(默认白色，15)
+ (instancetype)oneBtnWithCellHeight:(nullable NSNumber *)cellHeight title:(id)title detailSettingBlock:(nullable CKJOneBtnCellRowBlock)detailSettingBlock clickBtn:(CKJOneBtnCellClickBtn)clickBtn updateConstraint:(void(^)(MASConstraintMaker *make, UIView *superview))updateConstraint;

@end

@interface CKJOneBtnCell : CKJCommonTableViewCell<CKJOneBtnCellModel *>

@end

NS_ASSUME_NONNULL_END
