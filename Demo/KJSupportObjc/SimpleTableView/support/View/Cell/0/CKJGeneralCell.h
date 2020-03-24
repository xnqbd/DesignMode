//
//  CKJGeneralCell.h
//  MobileHospital_Renji
//
//  Created by chenkaijie on 2019/7/6.
//  Copyright © 2019 Lyc. All rights reserved.
//


/*
 
 
 分段 Segment

 #import "HomeVC.h"
 #import <JXCategoryView/JXCategoryView.h>
 #import <JXCategoryView/JXCategoryListContainerView.h>
 #import "NSObject+WDYHFCategory.h"
 #import "VideoVC.h"
 #import "GraphicVC.h"
 #import "AdvisoryVC.h"


 @interface HomeVC () <JXCategoryViewDelegate, JXCategoryListContainerViewDelegate>

 @property (nonatomic, strong) JXCategoryListContainerView *listContainerView;
 @property (strong, nonatomic) JXCategoryTitleView *segment;

 @property (strong, nonatomic) VideoVC *videoVC;
 @property (strong, nonatomic) GraphicVC *graphicVC;
 @property (strong, nonatomic) AdvisoryVC *advisoryVC;

 @end

 @implementation HomeVC

 - (void)viewDidLoad {
     [super viewDidLoad];
     self.view.backgroundColor = [UIColor whiteColor];
     self.navigationItem.title = @"居民咨询";
     
     self.videoVC = [[VideoVC alloc] init];
     self.graphicVC = [[GraphicVC alloc] init];
     self.advisoryVC = [[AdvisoryVC alloc] init];
     
     [self installSegmentView];
     [self installContainerView];
 }

 - (void)installSegmentView {
     __weak typeof(self) weakSelf = self;
     JXCategoryTitleView *(^createBlock)(NSArray <NSString *>*) = ^JXCategoryTitleView *(NSArray <NSString *>*titles) {
         JXCategoryTitleView *segmentView = [[JXCategoryTitleView alloc] init];
         segmentView.titleSelectedColor = [UIColor redColor];
         segmentView.delegate = weakSelf;
         segmentView.backgroundColor = [UIColor whiteColor];
         segmentView.titles = titles;
         segmentView.titleColorGradientEnabled = YES;
         
         JXCategoryIndicatorLineView *lineView = [[JXCategoryIndicatorLineView alloc] init];
         //        lineView.indicatorLineViewColor = kBuleBtnColor;
         //        lineView.indicatorLineWidth = 60;
         
         segmentView.indicators = @[lineView];
         
         [weakSelf.view addSubview:segmentView];
         return segmentView;
     };
     JXCategoryTitleView *titleView = createBlock(@[@"视频问诊", @"图文问诊", @"咨询广场"]);
     titleView.cellWidthIncrement = 25;
     self.segment = titleView;
     
     [titleView kjwd_mas_makeConstraints:^(MASConstraintMaker *make, UIView *superview) {
         make.left.equalTo(superview.kjwdMas_safeAreaLeft);
         make.right.equalTo(superview.kjwdMas_safeAreaRight);
         make.top.equalTo(superview.kjwdMas_safeAreaTop);
         make.height.equalTo(@45);
     }];
 }


 - (void)installContainerView {
     JXCategoryListContainerView *containerView = [[JXCategoryListContainerView alloc] initWithType:JXCategoryListContainerType_ScrollView delegate:self];
     [self.view addSubview:containerView];
     self.segment.contentScrollView = containerView.scrollView;
     
     [containerView kjwd_mas_makeConstraints:^(MASConstraintMaker *make, UIView *superview) {
         make.top.equalTo(self.segment.mas_bottom);
         make.left.equalTo(superview.kjwdMas_safeAreaLeft);
         make.right.equalTo(superview.kjwdMas_safeAreaRight);
         make.bottom.equalTo(superview.kjwdMas_safeAreaBottom);
     }];
     self.listContainerView = containerView;
 }

 #pragma mark - JXCategoryViewDelegate
 - (void)categoryView:(JXCategoryBaseView *)categoryView didClickSelectedItemAtIndex:(NSInteger)index {
     NSLog(@"didClickSelectedItemAtIndex  %d   ", index);
     [self.listContainerView didClickSelectedItemAtIndex:index];
 }

 - (void)categoryView:(JXCategoryBaseView *)categoryView didSelectedItemAtIndex:(NSInteger)index {
     
     NSLog(@"didSelectedItemAtIndex  %d", index);
     
 //    if (index == 1) {
 //        self.type = RJProjectMedicineType_Medicine;
 //    } else {
 //        self.type = RJProjectMedicineType_Project;
 //    }
     
 //    NSArray *rows = [self.simpleTableView returnRowsInSection:0 handle:^BOOL(__kindof CKJCommonCellModel * _Nonnull m) {
 //        return [m isKindOfClass:[CKJTableViewCell1Model class]];
 //    }];
 //    [self.simpleTableView removeCellModelAtSection:0 rows:rows removeHiddenCellModel:NO];
 //    [self.simpleTableView reloadData];
     
 //    [self firstNetwork];
 }

 - (void)categoryView:(JXCategoryBaseView *)categoryView scrollingFromLeftIndex:(NSInteger)leftIndex toRightIndex:(NSInteger)rightIndex ratio:(CGFloat)ratio {
     [self.listContainerView scrollingFromLeftIndex:leftIndex toRightIndex:rightIndex ratio:ratio selectedIndex:categoryView.selectedIndex];
 }

 #pragma mark - JXCategoryListContainerViewDelegate
 - (NSInteger)numberOfListsInlistContainerView:(JXCategoryListContainerView *)listContainerView {
     return 3;
 }
 - (id<JXCategoryListContentViewDelegate>)listContainerView:(JXCategoryListContainerView *)listContainerView initListForIndex:(NSInteger)index {
     if (index == 1) {
         return self.graphicVC;
     } if (index == 2) {
         return self.advisoryVC;
     } else {
         return self.videoVC;
     }
 }




 @end

 
 
 */




#import "CKJCommonTableViewCell.h"

#import "KJSupportHeader.h"

NS_ASSUME_NONNULL_BEGIN

@class CKJGeneralCellModel, CKJGeneralCell, CKJCell;
typedef void(^CKJGeneralCellModelRowBlock)(CKJGeneralCellModel * __weak m);



@interface CKJImage2Model : CKJBaseBtnModel

@property (assign, nonatomic) CGFloat leftMargin;

+ (instancetype)image2ModelWithNormalImage:(nullable UIImage *)normalImage size:(nullable NSValue *)size left:(CGFloat)leftMargin;
+ (instancetype)image2ModelWithImageString:(NSString *)imageString size:(CGSize)size left:(CGFloat)leftMargin;

/// 开启点击事件 详细设置
+ (instancetype)image2ModelWithNormalImage:(nullable UIImage *)normalImage size:(nullable NSValue *)size left:(CGFloat)leftMargin detail:(void(^_Nullable)(CKJImage2Model *i))detail click:(nullable CKJBaseBtnClick)click;



@end


@interface CKJTitle3Model : CKJBaseModel

@property (copy, nonatomic, nullable) NSAttributedString *attributedText;
@property (assign, nonatomic) CGFloat leftMargin;

/**
 宽度，为nil则自适应宽度
 */
@property (strong, nonatomic, nullable) NSNumber *width;

/**
 默认自适应宽度
 */
+ (instancetype)title3ModelWithAttributedText:(nullable NSAttributedString *)text left:(CGFloat)left;


+ (instancetype)title3ModelWithAttributedText:(nullable NSAttributedString *)text left:(CGFloat)left width:(CGFloat)width;

/** 改变文字 */
- (void)changeText:(nullable NSString *)text;


@end

typedef void(^CKJSubTitle4Click)(__kindof CKJCell *c);

@interface CKJSubTitle4Model : CKJBaseModel

@property (copy, nonatomic, nullable) NSAttributedString *attributedText;
@property (assign, nonatomic) CGFloat topMargin;
@property (assign, nonatomic) CGFloat leftMargin;
@property (assign, nonatomic) CGFloat bottomMargin;
@property (assign, nonatomic) CGFloat rightMargin;

@property (assign, nonatomic) BOOL enable;

/// 只有在enable为YES才出发
@property (copy, nonatomic) CKJSubTitle4Click click;

+ (instancetype)subTitle4ModelWithAttributedText:(nullable NSAttributedString *)text top:(CGFloat)top left:(CGFloat)left bottom:(CGFloat)bottom right:(CGFloat)right;

+ (instancetype)subTitle4ModelWithAttributedText:(nullable NSAttributedString *)text top:(CGFloat)top left:(CGFloat)left bottom:(CGFloat)bottom right:(CGFloat)right click:(CKJSubTitle4Click _Nullable)click;


/** 改变文字 */
- (void)changeText:(nullable NSString *)text;

@end



@interface CKJLikePriceLabel8Model : CKJBaseModel

@property (copy, nonatomic, nullable) NSAttributedString *attributedText;


@property (assign, nonatomic) CGFloat leftMargin;
@property (assign, nonatomic) CGFloat rightMargin;

+ (instancetype)likePriceLabel8ModelWithAttText:(nullable NSAttributedString *)text left:(CGFloat)left right:(CGFloat)right;

/** 改变文字 */
- (void)changeText:(nullable NSString *)text;

@end



@interface CKJArrow9Model : CKJBaseModel

/**
 默认距右边5
 */
@property (assign, nonatomic) CGFloat right;
/**
 默认是 箭头样式，自带大小
 */
@property (strong, nonatomic, nullable) UIImage *image;

/**
 right默认为5，默认是箭头图片
 */
+ (instancetype)arrow9ModelWithImage:(nullable UIImage *)image right:(nullable NSNumber *)right;

+ (instancetype)arrow9SystemModel;

@end



/*
 
 - (void)viewDidLoad {
     [super viewDidLoad];
     
     [self.simpleTableView updateStyle:^(CKJSimpleTableViewStyle * _Nonnull style) {
         style.rowHeight = @44;
     }];

     CKJCommonSectionModel *section1 = [CKJCommonSectionModel sectionWithDetailSetting:^(__kindof CKJCommonSectionModel * _Nonnull _sec) {
         CKJGeneralCellModel *model1 = [CKJGeneralCellModel generalWithCellHeight:nil cellModel_id:nil detailSettingBlock:^(__kindof CKJGeneralCellModel *__weak  _Nonnull m) {
             m.title3Model = [CKJTitle3Model title3ModelWithAttributedText:WDAttTitle(@"关于") left:10];
             m.likePrice8Model = [CKJLikePriceLabel8Model likePriceLabel8ModelWithAttText:WDAttTitle(@"复旦儿科"), [UIColor kjwd_subTitle], nil) left:0 right:0];
             m.arrow9Model = [CKJArrow9Model arrow9SystemModel];
         } didSelectRowBlock:nil];
         _sec.modelArray = @[model1];
     }];
     self.simpleTableView.dataArr = @[section1];
 }

*/


@interface CKJGeneralCellModel : CKJCommonCellModel

@property (strong, nonatomic, nullable) CKJImage2Model *image2Model;
@property (strong, nonatomic, nullable) CKJTitle3Model *title3Model;

- (NSString *_Nullable)title3Text;

@property (strong, nonatomic, nullable) CKJLikePriceLabel8Model *likePrice8Model;
@property (strong, nonatomic, nullable) CKJArrow9Model *arrow9Model;

+ (instancetype)generalWithCellHeight:(nullable NSNumber *)cellHeight cellModel_id:(nullable NSString *)cellModel_id detailSettingBlock:(nullable CKJGeneralCellModelRowBlock)detailSettingBlock didSelectRowBlock:(nullable CKJGeneralCellModelRowBlock)didSelectRowBlock;

/// title 和 箭头
+ (instancetype)generalWithTitle:(id)title arrow:(BOOL)arrow didSelectRowBlock:(nullable CKJGeneralCellModelRowBlock)didSelectRowBlock;

/// image title 箭头
+ (instancetype)generalWithImageName:(NSString *)imageName imageSize:(CGSize)imageSize title:(id)title arrow:(BOOL)arrow didSelectRowBlock:(nullable CKJGeneralCellModelRowBlock)didSelectRowBlock;

/// title 和 右标题  箭头
+ (instancetype)generalWithTitle:(id)title likePriceAttText:(NSAttributedString *)likePriceAttText arrow:(BOOL)arrow didSelectRowBlock:(CKJGeneralCellModelRowBlock)didSelectRowBlock;


@end


@interface CKJGeneralCell : CKJCommonTableViewCell<CKJGeneralCellModel *>

@property (nonnull, strong, nonatomic, readonly) CKJLeftView *leftWrapView;
@property (nonnull, strong, nonatomic, readonly) UIButton *imageBtn2;
@property (nonnull, strong, nonatomic, readonly) UILabel *title3;

@property (nonnull, strong, nonatomic, readonly) CKJRightView *rightWrapView;
@property (nonnull, strong, nonatomic, readonly) UIImageView *arrowImageView9;


@end

NS_ASSUME_NONNULL_END
