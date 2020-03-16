//
//  CKJGeneralCell.h
//  MobileHospital_Renji
//
//  Created by chenkaijie on 2019/7/6.
//  Copyright © 2019 Lyc. All rights reserved.
//

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

/// title 和 右标题
+ (instancetype)generalWithTitle:(id)title likePriceAttText:(NSAttributedString *)likePriceAttText didSelectRowBlock:(CKJGeneralCellModelRowBlock)didSelectRowBlock;


@end


@interface CKJGeneralCell : CKJCommonTableViewCell<CKJGeneralCellModel *>

@property (nonnull, strong, nonatomic, readonly) CKJLeftView *leftWrapView;
@property (nonnull, strong, nonatomic, readonly) UIButton *imageBtn2;
@property (nonnull, strong, nonatomic, readonly) UILabel *title3;

@property (nonnull, strong, nonatomic, readonly) CKJRightView *rightWrapView;
@property (nonnull, strong, nonatomic, readonly) UIImageView *arrowImageView9;


@end

NS_ASSUME_NONNULL_END
