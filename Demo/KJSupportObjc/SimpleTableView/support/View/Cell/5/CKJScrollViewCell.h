//
//  CKJBaseFunctionCell.h
//  MobileHospital_Renji
//
//  Created by chenkaijie on 2019/5/14.
//  Copyright © 2019 Lyc. All rights reserved.
//

#import "CKJCommonTableViewCell.h"

NS_ASSUME_NONNULL_BEGIN


@class CKJScrollViewCell, CKJScrollViewCellItemData, CKJScrollViewCellItemView, CKJScrollViewCellModel;

typedef void(^CKJScrollViewCellRowBlock)(CKJScrollViewCellModel *m);



@protocol CKJScrollViewCellDelegate <NSObject>

@required;

/** 这个方法 创建CKJScrollViewCell上的子视图并设置数据，而且现在暂时只能是本地数据， 每个CKJSimpleTableView最好只有一个CKJScrollViewCell，假如CKJSimpleTableView里row = 0，是CKJScrollViewCell的5个itemView，如果想要row = 1里面是6个itemView，那么应该再定义一个CKJScrollViewCell的子类，要保证一个CKJSimpleTableView里面只有极少数的CKJScrollViewCell，如果CKJSimpleTableView里有多个CKJScrollViewCell，可能重用会出导致数据错乱问题 */
- (NSArray <__kindof CKJScrollViewCellItemView *>*)createItemViewForCKJScrollViewCell:(__kindof CKJScrollViewCell *_Nonnull __weak)cell;

@end




@interface CKJScrollViewCellItemView : CKJCommonItemView

@property (strong, nonatomic) id itemData;

@end


@interface CKJScrollViewCellIndicatorConfig : NSObject

@property (assign, nonatomic) CGFloat longViewWidth;
@property (assign, nonatomic) CGFloat longViewHeight;
@property (assign, nonatomic) CGFloat shortViewWidth;

@property (strong, nonatomic) UIColor *longViewColor;
@property (strong, nonatomic) UIColor *shortViewColor;

/// 默认0
@property (assign, nonatomic) CGFloat bottom;

@property (assign, nonatomic) CGFloat radius;

@end



@interface CKJScrollViewCellConfig : CKJCommonCellConfig

@property (weak, nonatomic) id <CKJScrollViewCellDelegate>delegate;

/** item之间的距离 */
@property (assign, nonatomic) CGFloat itemSpace;
/** item宽度 */
@property (assign, nonatomic) CGFloat itemWidth;

@property (assign, nonatomic) UIEdgeInsets items_Edge_ScrollView;


/// bottom其实是距离指示器的距离， left、top、right是距离SuperView的距离
@property (assign, nonatomic) UIEdgeInsets scrollView_Edge_SuperView;

/** 指示器，默认隐藏 */
@property (assign, nonatomic) BOOL showScrollViewIndicator;

@property (strong, nonatomic) CKJScrollViewCellIndicatorConfig *indicatorConfig;


- (void)updateIndicatorConfig:(void(^)(CKJScrollViewCellIndicatorConfig *i))indicatorConfig;

@end

@interface CKJScrollViewCellModel : CKJCommonCellModel

+ (instancetype)scrollViewWithCellHeight:(nullable NSNumber *)cellHeight detailSettingBlock:(nullable CKJScrollViewCellRowBlock)detailSettingBlock;


@end

@interface CKJScrollViewCell : CKJCommonTableViewCell

@end

NS_ASSUME_NONNULL_END
