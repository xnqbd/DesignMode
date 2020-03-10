//
//  CKJTwoBtnCell.h
//  Demo
//
//  Created by admin2 on 2020/3/10.
//  Copyright © 2020 admin2. All rights reserved.
//

#import "CKJCommonTableViewCell.h"

NS_ASSUME_NONNULL_BEGIN

@class CKJTwoBtnCellModel;

typedef void(^CKJTwoBtnCellClickBtn)(__kindof CKJTwoBtnCellModel *cm, UIButton *btn);

typedef void(^CKJTwoBtnCellBlock)(__kindof CKJTwoBtnCellModel *_Nonnull m);




@interface CKJTwoBtnCellModel : CKJCommonCellModel

@property (assign, nonatomic) CGFloat leftMargin;
@property (assign, nonatomic) CGFloat rightMargin;

@property (strong, nonatomic, nullable) CKJBtnItemData *leftBtnData;
@property (strong, nonatomic, nullable) CKJBtnItemData *rightBtnData;



//- (void)updateBtnData:(void(^)(CKJBtnItemData *left, CKJBtnItemData *right))block;




///// 在detailSettingBlock详细设置
//+ (instancetype)oneBtnWithCellHeight:(nullable NSNumber *)cellHeight detailSettingBlock:(nullable CKJOneBtnCellRowBlock)detailSettingBlock clickBtn:(CKJOneBtnCellClickBtn)clickBtn updateConstraint:(void(^)(MASConstraintMaker *make, UIView *superview))updateConstraint;
///// 标题
+ (instancetype)twoBtnWithCellHeight:(nullable NSNumber *)cellHeight leftAttTitle:(nullable NSAttributedString *)leftAttTitle leftHandle:(nullable CKJTwoBtnCellClickBtn)leftHandle rightAttTitle:(nullable NSAttributedString *)rightAttTitle rightHandle:(nullable CKJTwoBtnCellClickBtn)rightHandle detailSettingBlock:(nullable CKJTwoBtnCellBlock)detailSettingBlock;

@end

@interface CKJTwoBtnCell : CKJCommonTableViewCell <CKJTwoBtnCellModel *>

@property (strong, nonatomic) UIButton *leftBtn;
@property (strong, nonatomic) UIButton *rightBtn;

@end

NS_ASSUME_NONNULL_END
