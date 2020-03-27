//
//  CKJLeftRightTopEqualCell.m
//  MobileHospital_Renji
//
//  Created by xnqbd on 2019/10/26.
//  Copyright © 2019 Lyc. All rights reserved.
//

#import "CKJLeftRightTopEqualCell.h"

@implementation CKJLeftRightTopEqual_LeftLabelSetting


+ (instancetype)settingWithLeft:(CGFloat)left top:(CGFloat)top detail:(void(^_Nullable)(CKJLeftRightTopEqual_LeftLabelSetting *setting))detail {
    CKJLeftRightTopEqual_LeftLabelSetting *temp = [[CKJLeftRightTopEqual_LeftLabelSetting alloc] init];
    temp.leftLab_MarginTo_SuperViewLeft = left;
    temp.leftLabel_TopMarginToSuperView = top;
    if (detail) {
        detail(temp);
    }
    return temp;
}

/// 默认
+ (instancetype)settingWithLeft:(CGFloat)left  detail:(void(^_Nullable)(CKJLeftRightTopEqual_LeftLabelSetting *setting))detail {
    return [self settingWithLeft:left top:6 detail:detail];
}

@end

@implementation CKJLeftRightTopEqual_RightLabelSetting


+ (instancetype)settingWithRightMargin:(CGFloat)rightMargin bottomMarigin:(CGFloat)bottomMarigin {
    CKJLeftRightTopEqual_RightLabelSetting *setting = [[self alloc] init];
    setting.rightLab_MarginTo_SuperViewRight = rightMargin;
    setting.rightLabel_BottomMarginToSuperView = bottomMarigin;
    return setting;
}
+ (instancetype)settingWithRightMargin:(CGFloat)rightMargin {
    return [self settingWithRightMargin:rightMargin bottomMarigin:7];
}

- (instancetype)init {
    if (self = [super init]) {
        self.rightLabel_BottomMarginToSuperView = 7;
    }
    return self;
}

@end


@implementation CKJLeftRightTopEqualCellModel

+ (instancetype)topEqualWithLeftAtt:(NSAttributedString *)leftAtt rightAtt:(NSAttributedString *)rightAtt leftSetting:(CKJLeftRightTopEqual_LeftLabelSetting *)leftSetting rightSetting:(CKJLeftRightTopEqual_RightLabelSetting *)rightSetting  showLine:(BOOL)showLine {
    CKJLeftRightTopEqualCellModel *model = [[CKJLeftRightTopEqualCellModel alloc] init];
    model.leftAttStr = leftAtt;
    model.rightAttStr = rightAtt;
    model.leftLabelSetting = leftSetting;
    model.rightLabelSetting = rightSetting;
    [model _showLine:showLine];
    return model;
}

+ (instancetype)topEqualWithLeftAtt:(NSAttributedString *)leftAtt rightAtt:(NSAttributedString *)rightAtt leftRightMargin:(CGFloat)leftRightMargin  showLine:(BOOL)showLine detail:(void(^_Nullable)(CKJLeftRightTopEqualCellModel *m))detail {
    CGFloat topBottom = 7;
    CKJLeftRightTopEqual_LeftLabelSetting *left = [CKJLeftRightTopEqual_LeftLabelSetting settingWithLeft:leftRightMargin top:topBottom detail:nil];
    CKJLeftRightTopEqual_RightLabelSetting *right = [CKJLeftRightTopEqual_RightLabelSetting settingWithRightMargin:leftRightMargin bottomMarigin:topBottom];
    CKJLeftRightTopEqualCellModel *cm = [self topEqualWithLeftAtt:leftAtt rightAtt:rightAtt leftSetting:left rightSetting:right showLine:showLine];
    if (detail) {
        detail(cm);
    }
    return cm;
}

- (void)updateSetting:(void(^_Nullable)(CKJLeftRightTopEqual_LeftLabelSetting *left, CKJLeftRightTopEqual_RightLabelSetting *right))setting {
    if (setting) {
        setting(self.leftLabelSetting, self.rightLabelSetting);
    }
}


@end

@implementation CKJLeftRightTopEqualCell

- (void)setupData:(CKJLeftRightTopEqualCellModel *)model section:(NSInteger)section row:(NSInteger)row selectIndexPath:(NSIndexPath *)indexPath tableView:(CKJSimpleTableView *)tableView {
    [super setupData:model section:section row:row selectIndexPath:indexPath tableView:tableView];
    CKJLeftRightTopEqual_LeftLabelSetting *leftSetting = (CKJLeftRightTopEqual_LeftLabelSetting *)model.leftLabelSetting;
    CKJLeftRightTopEqual_RightLabelSetting *rightSetting = (CKJLeftRightTopEqual_RightLabelSetting *)model.rightLabelSetting;
    

    /** leftLab 的宽度，自适应左边宽度（nil或者0）可以不设置，那么会自适应左边宽度 */
    NSNumber *leftLab_width = leftSetting.leftLab_width;

    /** leftLab 的宽度相对于父视图的倍数 */
    NSNumber *leftLab_width_MultipliedBySuperView = leftSetting.leftLab_width_MultipliedBySuperView;


    /** leftLab 和 父视图左边 之间的距离 (默认是0) */
    CGFloat leftLab_MarginTo_SuperViewLeft = leftSetting.leftLab_MarginTo_SuperViewLeft;
    
    /** leftLab 和 rightLab之间的距离 (默认是0) */
    CGFloat centerMargin = leftSetting.centerMargin;
    
    
    CGFloat leftLabel_TopMarginToSuperView = leftSetting.leftLabel_TopMarginToSuperView;
    
    [self.leftLab kjwd_mas_remakeConstraints:^(MASConstraintMaker * _Nonnull make, UIView * _Nonnull superview) {
        make.left.equalTo(superview).offset(leftLab_MarginTo_SuperViewLeft);
        make.top.equalTo(superview).offset(leftLabel_TopMarginToSuperView);

        
        if (leftLab_width_MultipliedBySuperView.floatValue > 0) {
            make.width.equalTo(superview).multipliedBy(leftLab_width_MultipliedBySuperView.floatValue);
        } else {
            if (leftLab_width.floatValue > 0) {
                make.width.equalTo(@(leftLab_width.floatValue));
            }
        }
    }];
    
    
    
    /** rightLab 和 父视图右边 之间的距离 (默认是0) */
    CGFloat rightLab_MarginTo_SuperViewRight = rightSetting.rightLab_MarginTo_SuperViewRight;

    /** rightLab 距离底部的距离，如果不设置此值，默认是5  */
    CGFloat rightLabel_BottomMarginToSuperView = rightSetting.rightLabel_BottomMarginToSuperView;

    [self.rightLab kjwd_mas_remakeConstraints:^(MASConstraintMaker *make, UIView *superview) {
        make.top.equalTo(self.leftLab);
        make.left.equalTo(self.leftLab.mas_right).offset(centerMargin);
        make.right.equalTo(superview).offset(-(rightLab_MarginTo_SuperViewRight));
        make.bottom.equalTo(superview).offset(-(rightLabel_BottomMarginToSuperView));
    }];
}

@end
