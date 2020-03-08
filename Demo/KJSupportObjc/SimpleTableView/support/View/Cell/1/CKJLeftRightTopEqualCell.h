//
//  CKJLeftRightTopEqualCell.h
//  MobileHospital_Renji
//
//  Created by xnqbd on 2019/10/26.
//  Copyright © 2019 Lyc. All rights reserved.
//

#import "CKJBaseLeftRightCell.h"

NS_ASSUME_NONNULL_BEGIN

@class CKJLeftRightTopEqualCellModel;

typedef void(^CKJLeftRightTopEqualCellRowBlock)(__kindof CKJLeftRightTopEqualCellModel *_Nonnull m);



@interface CKJLeftRightTopEqual_LeftLabelSetting : CKJBaseLeftLabelSetting

/// leftLabel 和 SuperView 垂直方向之间的距离
@property (assign, nonatomic) CGFloat leftLabel_TopMarginToSuperView;


+ (instancetype)settingWithLeft:(CGFloat)left top:(CGFloat)top detail:(void(^_Nullable)(CKJLeftRightTopEqual_LeftLabelSetting *setting))detail;
/// 默认
+ (instancetype)settingWithLeft:(CGFloat)left  detail:(void(^_Nullable)(CKJLeftRightTopEqual_LeftLabelSetting *setting))detail;


@end


@interface CKJLeftRightTopEqual_RightLabelSetting : CKJBaseRightLabelSetting

/** rightLab 距离底部的距离，如果不设置此值，默认是7  */
@property (assign, nonatomic) CGFloat rightLabel_BottomMarginToSuperView;


+ (instancetype)settingWithRightMargin:(CGFloat)rightMargin bottomMarigin:(CGFloat)bottomMarigin;

@end



@interface CKJLeftRightTopEqualCellModel : CKJBaseLeftRightCellModel<CKJLeftRightTopEqual_LeftLabelSetting *, CKJLeftRightTopEqual_RightLabelSetting *>


//+ (instancetype)topEqualWithLeftAtt:(NSAttributedString *)leftAtt rightAtt:(NSAttributedString *)rightAtt leftSetting:(CKJLeftRightTopEqual_LeftLabelSetting *)leftSetting rightSetting:(CKJLeftRightTopEqual_RightLabelSetting *)rightSetting  showLine:(BOOL)showLine;


/// 默认
+ (instancetype)topEqualWithLeftAtt:(NSAttributedString *)leftAtt rightAtt:(NSAttributedString *)rightAtt leftRightMargin:(CGFloat)leftRightMargin  showLine:(BOOL)showLine detail:(void(^_Nullable)(CKJLeftRightTopEqualCellModel *m))detail;

- (void)updateSetting:(void(^_Nullable)(CKJLeftRightTopEqual_LeftLabelSetting *left, CKJLeftRightTopEqual_RightLabelSetting *right))setting;

@end


@interface CKJLeftRightTopEqualCell : CKJBaseLeftRightCell

@end

NS_ASSUME_NONNULL_END
