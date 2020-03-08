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

+ (instancetype)oneBtnWithCellHeight:(nullable NSNumber *)cellHeight detailSettingBlock:(nullable CKJOneBtnCellRowBlock)detailSettingBlock clickBtn:(CKJOneBtnCellClickBtn)clickBtn updateConstraint:(void(^)(MASConstraintMaker *make, UIView *superview))updateConstraint {
    CKJOneBtnCellModel *m = [self commonWithCellHeight:cellHeight cellModel_id:nil detailSettingBlock:detailSettingBlock didSelectRowBlock:nil];
    m.updateConstraint = updateConstraint;
    m.clickBtn = clickBtn;
    return m;
}
+ (instancetype)oneBtnWithCellHeight:(nullable NSNumber *)cellHeight attTitle:(NSAttributedString *)attTitle detailSettingBlock:(nullable CKJOneBtnCellRowBlock)detailSettingBlock clickBtn:(CKJOneBtnCellClickBtn)clickBtn updateConstraint:(void(^)(MASConstraintMaker *make, UIView *superview))updateConstraint {
    CKJOneBtnCellModel *m = [self oneBtnWithCellHeight:cellHeight detailSettingBlock:detailSettingBlock clickBtn:clickBtn updateConstraint:updateConstraint];
    [m updateBtnData:^(CKJBtnItemData * _Nonnull btnData) {
        btnData.normalAttTitle = attTitle;
    }];
    return m;
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
    [CKJWorker reloadBtn:_oneBtn btnData:model.btnData];
    [self.oneBtn kjwd_mas_remakeConstraints:model.updateConstraint];
}



@end
