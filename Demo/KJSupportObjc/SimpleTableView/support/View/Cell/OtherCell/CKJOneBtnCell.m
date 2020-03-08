//
//  CKJOneBtnCell.m
//  MobileHospital_Renji
//
//  Created by admin2 on 2020/1/14.
//  Copyright © 2020 Lyc. All rights reserved.
//

#import "CKJOneBtnCell.h"

@implementation CKJOneBtnCellModel

- (void)updateBtnData:(void(^)(CKJBtnItemData *btnData))block {
    if (block) {
        block(_btnData);
    }
}

+ (instancetype)oneBtnWithCellHeight:(nullable NSNumber *)cellHeight cellModel_id:(nullable NSString *)cellModel_id detailSettingBlock:(nullable CKJOneBtnCellRowBlock)detailSettingBlock didSelectRowBlock:(nullable CKJOneBtnCellRowBlock)didSelectRowBlock {
    return [self commonWithCellHeight:cellHeight cellModel_id:cellModel_id detailSettingBlock:detailSettingBlock didSelectRowBlock:didSelectRowBlock];
}

+ (instancetype)oneBtnWithTitle:(NSString *)title didSelectRowBlock:(nullable CKJOneBtnCellRowBlock)didSelectRowBlock {
    return [self oneBtnWithAttTitle:WDAttTitle(title) didSelectRowBlock:didSelectRowBlock];
}
+ (instancetype)oneBtnWithAttTitle:(NSAttributedString *)attTitle didSelectRowBlock:(nullable CKJOneBtnCellRowBlock)didSelectRowBlock {
    return [self oneBtnWithCellHeight:nil cellModel_id:nil detailSettingBlock:^(__kindof CKJOneBtnCellModel * _Nonnull m) {
        [m updateBtnData:^(CKJBtnItemData * _Nonnull btnData) {
            btnData.normalAttTitle = attTitle;
            btnData.enabled = NO;
        }];
    } didSelectRowBlock:didSelectRowBlock];
}

- (instancetype)init {
    if (self = [super init]) {
        self.btnData = [[CKJBtnItemData alloc] init];
    }
    return self;
}

@end

@interface CKJOneBtnCell ()

@property (strong, nonatomic) UIButton *oneBtn;

@end

@implementation CKJOneBtnCell


- (void)setupSubViews {
     __weak typeof(self) weakSelf = self;
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn kjwd_addTouchUpInsideForCallBack:^(UIButton * _Nonnull _sender) {
        if (weakSelf.cellModel.clickBtn) {
            weakSelf.cellModel.clickBtn(weakSelf.cellModel, _sender);
        }
    }];
    [btn kjwd_masWithSuperView:self.subviews_SuperView makeConstraints:^(MASConstraintMaker * _Nonnull make, UIView * _Nonnull superview) {
        make.edges.equalTo(superview).insets(UIEdgeInsetsZero);
    }];
    self.oneBtn = btn;
}

- (void)setupData:(__kindof CKJOneBtnCellModel *)model section:(NSInteger)section row:(NSInteger)row selectIndexPath:(NSIndexPath *)indexPath tableView:(CKJSimpleTableView *)tableView {
    UIEdgeInsets edge = model.btnEdge;
    [CKJWorker reloadBtn:_oneBtn btnData:model.btnData];
    [self.oneBtn kjwd_mas_updateConstraints:^(MASConstraintMaker * _Nonnull make, UIView * _Nonnull superview) {
        make.edges.equalTo(superview).insets(edge);
    }];
}



@end
