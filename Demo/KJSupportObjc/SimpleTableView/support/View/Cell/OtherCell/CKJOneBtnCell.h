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

typedef void(^CKJOneBtnCellRowBlock)(__kindof CKJOneBtnCellModel *_Nonnull m);


@interface CKJOneBtnCellModel : CKJCommonCellModel

@property (assign, nonatomic) UIEdgeInsets btnEdge;

@property (strong, nonatomic) CKJBtnItemData *btnData;

@property (copy, nonatomic) void(^clickBtn)(__kindof CKJOneBtnCellModel *cm, UIButton *btn);

- (void)updateBtnData:(void(^)(CKJBtnItemData *btnData))block;

+ (instancetype)oneBtnWithCellHeight:(nullable NSNumber *)cellHeight cellModel_id:(nullable NSString *)cellModel_id detailSettingBlock:(nullable CKJOneBtnCellRowBlock)detailSettingBlock didSelectRowBlock:(nullable CKJOneBtnCellRowBlock)didSelectRowBlock;
+ (instancetype)oneBtnWithTitle:(NSString *)title didSelectRowBlock:(nullable CKJOneBtnCellRowBlock)didSelectRowBlock;
+ (instancetype)oneBtnWithAttTitle:(NSAttributedString *)attTitle didSelectRowBlock:(nullable CKJOneBtnCellRowBlock)didSelectRowBlock;

@end

@interface CKJOneBtnCell : CKJCommonTableViewCell<CKJOneBtnCellModel *>

@end

NS_ASSUME_NONNULL_END
