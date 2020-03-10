//
//  CKJTwoBtnCell.m
//  Demo
//
//  Created by admin2 on 2020/3/10.
//  Copyright © 2020 admin2. All rights reserved.
//

#import "CKJTwoBtnCell.h"


@implementation CKJTwoBtnCellModel



+ (instancetype)twoBtnWithCellHeight:(nullable NSNumber *)cellHeight leftAttTitle:(nullable NSAttributedString *)leftAttTitle leftHandle:(nullable CKJTwoBtnCellClickBtn)leftHandle rightAttTitle:(nullable NSAttributedString *)rightAttTitle rightHandle:(nullable CKJTwoBtnCellClickBtn)rightHandle detailSettingBlock:(nullable CKJTwoBtnCellBlock)detailSettingBlock {
    CKJBtnItemData *left = [[CKJBtnItemData alloc] init];
    left.normalAttTitle = leftAttTitle;
    
    CKJBtnItemData *right = [[CKJBtnItemData alloc] init];
    right.normalAttTitle = rightAttTitle;
    
    CKJTwoBtnCellModel *cm = [self commonWithCellHeight:cellHeight cellModel_id:nil detailSettingBlock:detailSettingBlock didSelectRowBlock:nil];
    cm.leftBtnData = left;
    cm.rightBtnData = right;
    return cm;
}


@end

@implementation CKJTwoBtnCell

- (void)setupSubViews {
    __weak typeof(self) weakSelf = self;
    
    self.leftBtn = ({
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn kjwd_addTouchUpInsideForCallBack:^(UIButton * _Nonnull _sender) {
            //        if (weakSelf.cellModel.clickBtn) {
            //            weakSelf.cellModel.clickBtn(weakSelf.cellModel, _sender);
            //        }
        }];
        [btn kjwd_masWithSuperView:self.subviews_SuperView makeConstraints:^(MASConstraintMaker * _Nonnull make, UIView * _Nonnull superview) {
            make.centerY.equalTo(superview);
            make.left.equalTo(superview).offset(0);
        }];
        btn;
    });
    
    self.rightBtn = ({
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn kjwd_addTouchUpInsideForCallBack:^(UIButton * _Nonnull _sender) {
            //        if (weakSelf.cellModel.clickBtn) {
            //            weakSelf.cellModel.clickBtn(weakSelf.cellModel, _sender);
            //        }
        }];
        [btn kjwd_masWithSuperView:self.subviews_SuperView makeConstraints:^(MASConstraintMaker * _Nonnull make, UIView * _Nonnull superview) {
            make.centerY.equalTo(self.leftBtn);
            make.right.equalTo(superview).offset(0);
        }];
        btn;
    });
}

- (void)setupData:(__kindof CKJTwoBtnCellModel *)model section:(NSInteger)section row:(NSInteger)row selectIndexPath:(NSIndexPath *)indexPath tableView:(CKJSimpleTableView *)tableView {
    [CKJWorker reloadBtn:self.leftBtn btnData:model.leftBtnData];
    [self.leftBtn kjwd_mas_updateConstraints:^(MASConstraintMaker * _Nonnull make, UIView * _Nonnull superview) {
        make.left.equalTo(superview).offset(model.leftMargin);
    }];
    
    [CKJWorker reloadBtn:self.rightBtn btnData:model.rightBtnData];
    [self.rightBtn kjwd_mas_updateConstraints:^(MASConstraintMaker * _Nonnull make, UIView * _Nonnull superview) {
        make.right.equalTo(superview).offset(-(model.rightMargin));
    }];
}


@end
