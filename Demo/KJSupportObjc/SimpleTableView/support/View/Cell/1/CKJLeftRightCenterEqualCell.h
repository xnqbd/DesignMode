//
//  CKJLeftRightCenterEqualCell.h
//  MobileHospital_Renji
//
//  Created by xnqbd on 2019/10/26.
//  Copyright © 2019 Lyc. All rights reserved.
//

#import "CKJBaseLeftRightCell.h"

NS_ASSUME_NONNULL_BEGIN


@class CKJLeftRightCenterEqualCellModel;

typedef void(^CKJLeftRightCenterEqualCellRowBlock)(__kindof CKJLeftRightCenterEqualCellModel *_Nonnull m);



@interface CKJLeftRightCenterEqual_LeftLabelSetting : CKJBaseLeftLabelSetting

+ (instancetype)settingWithLeftMargin:(CGFloat)leftMargin detail:(void(^_Nullable)(CKJLeftRightCenterEqual_LeftLabelSetting *setting))detail;

@end


@interface CKJLeftRightCenterEqual_RightLabelSetting : CKJBaseRightLabelSetting

+ (instancetype)settingWithRightMargin:(CGFloat)rightMargin;

@end



@interface CKJLeftRightCenterEqualCellModel : CKJBaseLeftRightCellModel


+ (instancetype)centerEqualWithLeftAtt:(NSAttributedString *)leftAtt rightAtt:(NSAttributedString *)rightAtt leftSetting:(CKJLeftRightCenterEqual_LeftLabelSetting *)leftSetting rightMargin:(CGFloat)rightMargin showLine:(BOOL)showLine;

+ (instancetype)centerEqualWithLeftAtt:(NSAttributedString *)leftAtt rightAtt:(NSAttributedString *)rightAtt leftRightMargin:(CGFloat)leftRightMargin showLine:(BOOL)showLine;

@end


@interface CKJLeftRightCenterEqualCell : CKJBaseLeftRightCell

@end

NS_ASSUME_NONNULL_END
