//
//  CKJLeftRightCell.h
//  Masonry
//
//  Created by chenkaijie on 2019/1/7.
//

#import "CKJCommonTableViewCell.h"
#import "CKJTableViewCell1.h"
#import "CKJEmptyCell.h"

NS_ASSUME_NONNULL_BEGIN





@interface CKJBaseLeftLabelSetting : CKJBaseModel


/** leftLab 的宽度，自适应左边宽度（nil或者0）可以不设置，那么会自适应左边宽度 */
@property (strong, nonatomic, nullable) NSNumber *leftLab_width;

/** leftLab 的宽度相对于父视图的倍数 */
@property (assign, nonatomic, nullable) NSNumber *leftLab_width_MultipliedBySuperView;


/** leftLab 和 父视图左边 之间的距离 (默认是0) */
@property (assign, nonatomic) CGFloat leftLab_MarginTo_SuperViewLeft;

/** leftLab 和 rightLab之间的距离 (默认是0) */
@property (assign, nonatomic) CGFloat centerMargin;

@end


@interface CKJBaseRightLabelSetting : CKJBaseModel

/** rightLab 和 父视图右边 之间的距离 (默认是0) */
@property (assign, nonatomic) CGFloat rightLab_MarginTo_SuperViewRight;


@end


@class  CKJLeftRightTopEqualCellConfig, CKJLeftRightCenterEqualCellConfig, CKJBaseLeftRightCellModel;


typedef void(^CKJLeftRightTopEqualCellConfigBlock)(CKJLeftRightTopEqualCellConfig *m);
typedef void(^CKJLeftRightCenterEqualCellConfigBlock)(CKJLeftRightCenterEqualCellConfig *m);
typedef void(^CKJBaseLeftRightCellModelRowBlock)(__kindof CKJBaseLeftRightCellModel *m);




@interface CKJBaseLeftRightCellModel<L, R> : CKJCommonCellModel


@property(assign, nonatomic) NSTextAlignment leftLab_textAlignment;
@property(assign, nonatomic) NSTextAlignment rightLab_textAlignment;

/**
 如果发现异常或空字符串，会自动设置为 @" " 以撑开Label的高度
 */
@property (copy, nonatomic, nullable) NSAttributedString *leftAttStr;
/**
 如果发现异常或空字符串，会自动设置为 @" " 以撑开Label的高度
 */
@property (copy, nonatomic, nullable) NSAttributedString *rightAttStr;



@property (strong, nonatomic) L leftLabelSetting;
@property (strong, nonatomic) R rightLabelSetting;



@end


@interface CKJBaseLeftRightCell : CKJCommonTableViewCell <CKJBaseLeftRightCellModel *>

@property (strong, nonatomic) UILabel *leftLab;
@property (strong, nonatomic) UILabel *rightLab;

@end


NS_ASSUME_NONNULL_END
