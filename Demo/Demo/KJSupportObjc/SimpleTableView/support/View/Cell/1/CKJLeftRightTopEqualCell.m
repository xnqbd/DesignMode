//
//  CKJLeftRightTopEqualCell.m
//  MobileHospital_Renji
//
//  Created by xnqbd on 2019/10/26.
//  Copyright © 2019 Lyc. All rights reserved.
//

#import "CKJLeftRightTopEqualCell.h"


@implementation CKJLeftRightTopEqualCellConfig



+ (nonnull instancetype)configWithLeftLabelTopMargin:(CGFloat)LeftLabelTopMargin detailSettingBlock:(nullable CKJLeftRightTopEqualCellConfigBlock)detailSettingBlock {
    CKJLeftRightTopEqualCellConfig *config = [[CKJLeftRightTopEqualCellConfig alloc] init];
    config.leftLabel_TopMarginToSuperView = LeftLabelTopMargin;
    if (detailSettingBlock) {
        detailSettingBlock(config);
    }
    return config;
}

@end



@implementation CKJLeftRightTopEqualCellModel

+ (instancetype _Nonnull)modelWithCellHeight:(nullable NSNumber *)cellHeight cellModel_id:(nullable NSString *)cellModel_id detailSettingBlock:(nullable CKJLeftRightTopEqualCellRowBlock)detailSettingBlock didSelectRowBlock:(nullable CKJLeftRightTopEqualCellRowBlock)didSelectRowBlock {
    return [self commonWithCellHeight:cellHeight cellModel_id:cellModel_id detailSettingBlock:detailSettingBlock didSelectRowBlock:didSelectRowBlock];
}

@end

@implementation CKJLeftRightTopEqualCell

@end
