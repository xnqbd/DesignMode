//
//  CKJGeneralCell.m
//  MobileHospital_Renji
//
//  Created by chenkaijie on 2019/7/6.
//  Copyright © 2019 Lyc. All rights reserved.
//

#import "CKJGeneralCell.h"

@implementation CKJImage2Model

+ (instancetype)image2ModelWithNormalImage:(nullable UIImage *)normalImage size:(nullable NSValue *)size left:(CGFloat)leftMargin {
    CKJImage2Model *model = [[self alloc] init];
    model.normalImage = normalImage;
    model.size = size ? size.CGSizeValue : normalImage.size;
    model.leftMargin = leftMargin;
    return model;
}
+ (instancetype)image2ModelWithImageString:(NSString *)imageString size:(CGSize)size left:(CGFloat)leftMargin {
    CKJImage2Model *model = [[self alloc] init];
    model.normalImage = [UIImage kjwd_imageNamed:imageString];
    model.size = size;
    model.leftMargin = leftMargin;
    return model;
}

+ (instancetype)image2ModelWithNormalImage:(nullable UIImage *)normalImage size:(nullable NSValue *)size left:(CGFloat)leftMargin detail:(void(^_Nullable)(CKJImage2Model *i))detail click:(nullable CKJBaseBtnClick)click {
    CKJImage2Model *m = [self image2ModelWithNormalImage:normalImage size:size left:leftMargin];
    m.userInteractionEnabled = YES;
    m.click = click;
    if (detail) {
        detail(m);
    }
    return m;
}

- (instancetype)init {
    if (self = [super init]) {
        self.userInteractionEnabled = NO;
    }
    return self;
}


@end


@implementation CKJTitle3Model

+ (instancetype)title3ModelWithAttributedText:(nullable NSAttributedString *)text left:(CGFloat)left {
    CKJTitle3Model *model = [[self alloc] init];
    model.attributedText = text;
    model.leftMargin = left;
    return model;
}

+ (nonnull instancetype)title3ModelWithAttributedText:(nullable NSAttributedString *)text left:(CGFloat)left width:(CGFloat)width {
    CKJTitle3Model *model = [[self alloc] init];
    model.attributedText = text;
    model.leftMargin = left;
    model.width = @(width);
    return model;
}

- (void)changeText:(nullable NSString *)text {
    self.attributedText = [CKJWorker changeOriginAtt:self.attributedText text:text];
}

@end


@implementation CKJSubTitle4Model
+ (instancetype)subTitle4ModelWithAttributedText:(nullable NSAttributedString *)text top:(CGFloat)top left:(CGFloat)left bottom:(CGFloat)bottom right:(CGFloat)right {
    CKJSubTitle4Model *model = [[self alloc] init];
    model.attributedText = text;
    model.topMargin = top;
    model.leftMargin = left;
    model.rightMargin = right;
    model.bottomMargin = bottom;
    return model;
}
+ (instancetype)subTitle4ModelWithAttributedText:(nullable NSAttributedString *)text top:(CGFloat)top left:(CGFloat)left bottom:(CGFloat)bottom right:(CGFloat)right click:(CKJSubTitle4Click _Nullable)click {
    CKJSubTitle4Model *m = [self subTitle4ModelWithAttributedText:text top:left left:right bottom:bottom right:right];
    m.click = click;
    m.enable = YES;
    return m;
}



- (void)changeText:(nullable NSString *)text {
    self.attributedText = [CKJWorker changeOriginAtt:self.attributedText text:text];
}
@end



@implementation CKJLikePriceLabel8Model
+ (nonnull instancetype)likePriceLabel8ModelWithAttText:(nullable NSAttributedString *)text left:(CGFloat)left right:(CGFloat)right {
    CKJLikePriceLabel8Model *model = [[self alloc] init];
    model.attributedText = text;
    model.leftMargin = left;
    model.rightMargin = right;
    return model;
}
- (void)changeText:(nullable NSString *)text {
    self.attributedText = [CKJWorker changeOriginAtt:self.attributedText text:text];
}
@end

@implementation CKJArrow9Model

+ (instancetype)arrow9ModelWithImage:(UIImage *)image right:(nullable NSNumber *)right {
    CKJArrow9Model *model = [[self alloc] init];
    if ([right isKindOfClass:[NSNumber class]]) {
        model.right = right.floatValue;
    }
    model.image = image;
    return model;
}
+ (nonnull instancetype)arrow9SystemModel {
    return [[self alloc] init];
}


- (instancetype)init {
    if (self = [super init]) {
        self.right = 10;
        NSBundle *resourcesBundle = [CKJWorker kjbundle];
        UIImage *arrow = [UIImage imageNamed:@"kj_arrow1" inBundle:resourcesBundle compatibleWithTraitCollection:nil];
        arrow = [arrow kjwd_scaleToSize:CGSizeMake(16, 16)];
        self.image = arrow;
    }
    return self;
}

@end


@implementation CKJGeneralCellModel

- (NSString *_Nullable)title3Text {
    return _title3Model.attributedText.string;
}

+ (instancetype)generalWithCellHeight:(nullable NSNumber *)cellHeight cellModel_id:(nullable NSString *)cellModel_id detailSettingBlock:(nullable CKJGeneralCellModelRowBlock)detailSettingBlock didSelectRowBlock:(nullable CKJGeneralCellModelRowBlock)didSelectRowBlock {
    return [self commonWithCellHeight:cellHeight cellModel_id:cellModel_id detailSettingBlock:detailSettingBlock didSelectRowBlock:didSelectRowBlock];
}

+ (instancetype)generalWithTitle:(id)title arrow:(BOOL)arrow didSelectRowBlock:(nullable CKJGeneralCellModelRowBlock)didSelectRowBlock {
    return[self generalWithCellHeight:nil cellModel_id:nil detailSettingBlock:^(CKJGeneralCellModel *__weak  _Nonnull m) {
        if ([title isKindOfClass:[NSString class]]) {
            m.title3Model = [CKJTitle3Model title3ModelWithAttributedText:WDAttTitle(title) left:12];
        } else if ([title isKindOfClass:[NSAttributedString class]]) {
            m.title3Model = [CKJTitle3Model title3ModelWithAttributedText:title left:12];
        }
        if (arrow) {
            m.arrow9Model = [CKJArrow9Model arrow9SystemModel];
        }
    } didSelectRowBlock:didSelectRowBlock];
}

+ (instancetype)generalWithImageName:(NSString *)imageName imageSize:(CGSize)imageSize title:(id)title arrow:(BOOL)arrow didSelectRowBlock:(nullable CKJGeneralCellModelRowBlock)didSelectRowBlock {
    return[self generalWithCellHeight:nil cellModel_id:nil detailSettingBlock:^(CKJGeneralCellModel *__weak  _Nonnull m) {
        m.image2Model = [CKJImage2Model image2ModelWithImageString:imageName size:imageSize left:15];
        if ([title isKindOfClass:[NSString class]]) {
            m.title3Model = [CKJTitle3Model title3ModelWithAttributedText:WDAttTitle(title) left:12];
        } else if ([title isKindOfClass:[NSAttributedString class]]) {
            m.title3Model = [CKJTitle3Model title3ModelWithAttributedText:title left:12];
        }
        if (arrow) {
            m.arrow9Model = [CKJArrow9Model arrow9SystemModel];
        }
    } didSelectRowBlock:didSelectRowBlock];
}

+ (instancetype)generalWithTitle:(id)title likePriceAttText:(NSAttributedString *)likePriceAttText arrow:(BOOL)arrow didSelectRowBlock:(CKJGeneralCellModelRowBlock)didSelectRowBlock {
    return[self generalWithCellHeight:nil cellModel_id:nil detailSettingBlock:^(CKJGeneralCellModel *__weak  _Nonnull m) {
        CGFloat margin = 12;
        if ([title isKindOfClass:[NSString class]]) {
            m.title3Model = [CKJTitle3Model title3ModelWithAttributedText:WDAttTitle(title) left:12];
        } else if ([title isKindOfClass:[NSAttributedString class]]) {
            m.title3Model = [CKJTitle3Model title3ModelWithAttributedText:title left:12];
        }
        m.likePrice8Model = [CKJLikePriceLabel8Model likePriceLabel8ModelWithAttText:likePriceAttText left:0 right:margin];
        if (arrow) {
            m.arrow9Model = [CKJArrow9Model arrow9SystemModel];
        }
    } didSelectRowBlock:didSelectRowBlock];
}


@end


@interface CKJGeneralCell ()

@property (strong, nonatomic) CKJLeftView *leftWrapView;
@property (strong, nonatomic) UIButton *imageBtn2;
@property (strong, nonatomic) UILabel *title3;



@property (strong, nonatomic) CKJCenterView *centerView;

@property (strong, nonatomic) CKJRightView *rightWrapView;
@property (strong, nonatomic) UILabel *alikePriceLabel8;
@property (strong, nonatomic) UIImageView *arrowImageView9;

@end

@implementation CKJGeneralCell


- (void)setupSubViews {
    
    [self createLeft];
    [self createCenter];
    [self createRight];
    
    /*
     布局
     
     左                     中间      右
     [imageBtn2, title3]    []      [likePrice8, arrowImageView9]
     
     */
    
    
    [self origin_imageBtn2_Constraint];
    [self origin_title3_Constraint];
    
    [_leftWrapView kjwd_mas_makeConstraints:^(MASConstraintMaker *make, UIView *superview) {
        make.left.top.bottom.equalTo(superview);
        make.right.equalTo(self.centerView.mas_left);
    }];
    
    // 中间
    [_centerView kjwd_mas_makeConstraints:^(MASConstraintMaker *make, UIView *superview) {
        make.top.bottom.equalTo(superview);
        make.right.equalTo(self.rightWrapView.mas_left);
    }];
    
    
    // 右边
    [_alikePriceLabel8 kjwd_mas_makeConstraints:^(MASConstraintMaker *make, UIView *superview) {
        MASViewAttribute *temp = self.arrowImageView9.mas_left;
        make.left.top.bottom.equalTo(superview);
        make.right.equalTo(temp);
    }];
    [self origin_arrowImageView9_Constraint];
    [_rightWrapView kjwd_mas_makeConstraints:^(MASConstraintMaker *make, UIView *superview) {
        make.top.bottom.right.equalTo(superview);
    }];
    // 改变subviews_SuperView
    self.subviews_SuperView = self.centerView;
}


- (void)createLeft {
    
    // 左
    CKJLeftView *leftWrapView = [CKJLeftView new];
    [self.onlyView addSubview:leftWrapView];
    
    UIButton *imageBtn2 = [UIButton buttonWithType:UIButtonTypeCustom];
    imageBtn2.userInteractionEnabled = NO;
    [leftWrapView addSubview:imageBtn2];
    
    
    UILabel *title3 = [CKJTitle3Label new];
    [title3 setContentHuggingPriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisHorizontal];
    [title3 setContentCompressionResistancePriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisHorizontal];
    [leftWrapView addSubview:title3];
    
    
    self.imageBtn2 = imageBtn2;
    self.title3 = title3;
    
    self.leftWrapView = leftWrapView;
    
    
    __weak typeof(self) weakSelf = self;
    [imageBtn2 kjwd_addTouchUpInsideForCallBack:^(UIButton * _Nonnull _sender) {
        CKJImage2Model *image2Model = weakSelf.cellModel.image2Model;
        if (image2Model.click) {
            image2Model.click(image2Model, _sender);
        }
    }];
}

- (void)createCenter {
    CKJCenterView *centerView = [[CKJCenterView alloc] init];
    [self.onlyView addSubview:centerView];
    self.centerView = centerView;
}


- (void)createRight {
    // 右
    CKJRightView *rightWrapView = [CKJRightView new];
    [self.onlyView addSubview:rightWrapView];
    self.rightWrapView = rightWrapView;
    
    
    UILabel *alikePriceLabel8 = [CKJLikePriceLabel8 new];
    [rightWrapView addSubview:alikePriceLabel8];
    self.alikePriceLabel8 = alikePriceLabel8;
    
    
    // 右边箭头图片
    CKJArrowImageView9 *arrowImageView9 = [CKJArrowImageView9 new];
    arrowImageView9.contentMode = UIViewContentModeScaleAspectFit;
    [rightWrapView addSubview:arrowImageView9];
    self.arrowImageView9 = arrowImageView9;
}


- (void)setupData:(CKJGeneralCellModel *)model section:(NSInteger)section row:(NSInteger)row selectIndexPath:(NSIndexPath *)indexPath tableView:(CKJSimpleTableView *)tableView {
    if ([model isKindOfClass:[CKJGeneralCellModel class]] == NO) return;

    
    [self origin_imageBtn2_Constraint];
    [self origin_title3_Constraint];

    
    [self update_alikePriceLabel8_Constraint];
    [self origin_arrowImageView9_Constraint];
    
    BOOL debug = NO;
    if (debug) {
        
        //        self.leftWrapView.backgroundColor = [UIColor redColor];
        self.imageBtn2.backgroundColor = [UIColor purpleColor];
        self.title3.backgroundColor = [UIColor brownColor];
        
        self.centerView.backgroundColor = [UIColor orangeColor];
        self.alikePriceLabel8.backgroundColor = [UIColor blueColor];
        self.arrowImageView9.backgroundColor = [UIColor grayColor];
    }
}

- (void)origin_imageBtn2_Constraint {
    CKJGeneralCellModel *model = self.cellModel;
    
    CKJImage2Model *image2Model = model.image2Model;

    CGFloat leftMargin = image2Model.leftMargin;
    
    CGFloat title3LeftMargin = self.cellModel.title3Model.leftMargin;
    
    [CKJWorker reloadWithBtnModel:image2Model btn:self.imageBtn2 emptyHandle:^(CKJImage2Model * _Nonnull btnM) {
           [self.imageBtn2 kjwd_mas_remakeConstraints:^(MASConstraintMaker *make, UIView *superview) {
               make.left.equalTo(superview).offset(leftMargin);
               make.centerY.equalTo(superview);
               make.width.height.equalTo(@0);
               make.right.equalTo(self.title3.mas_left).offset(-(title3LeftMargin));
           }];
       } noEmptyHandle:^(CKJImage2Model * _Nonnull btnM) {
           CGSize size = image2Model.size;
           [self.imageBtn2 kjwd_mas_remakeConstraints:^(MASConstraintMaker *make, UIView *superview) {
               make.centerY.equalTo(superview);
               make.left.equalTo(superview).offset(leftMargin);
               make.width.equalTo(@(size.width));
               make.height.equalTo(@(size.height));
               make.right.equalTo(self.title3.mas_left).offset(-(title3LeftMargin));
           }];
       }];
    
//    if (normalImage == nil) {
//        [_imageBtn2 kjwd_mas_remakeConstraints:^(MASConstraintMaker *make, UIView *superview) {
//            make.left.equalTo(superview).offset(leftMargin);
//            make.centerY.equalTo(superview);
//            make.width.height.equalTo(@0);
//            make.right.equalTo(self.title3.mas_left).offset(-(title3LeftMargin));
//        }];
//    } else {
//        [self.imageBtn2 setImage:normalImage forState:UIControlStateNormal];
//        CGSize size = image2Model.size;
//        [_imageBtn2 kjwd_mas_remakeConstraints:^(MASConstraintMaker *make, UIView *superview) {
//            make.centerY.equalTo(superview);
//            make.left.equalTo(superview).offset(leftMargin);
//            make.width.equalTo(@(size.width));
//            make.height.equalTo(@(size.height));
//            make.right.equalTo(self.title3.mas_left).offset(-(title3LeftMargin));
//        }];
//    }
//
//    CGFloat radius = image2Model.cornerRadius;
//
//    if (radius <= 0) {
//        if (_imageBtn2.layer.cornerRadius != 0) {
//            _imageBtn2.layer.cornerRadius = 0;
//            _imageBtn2.clipsToBounds = NO;
//        }
//    } else {
//        if (_imageBtn2.layer.cornerRadius != radius) {
//            _imageBtn2.layer.cornerRadius = radius;
//            _imageBtn2.clipsToBounds = YES;
//        }
//    }
}

- (void)origin_title3_Constraint {

    CKJGeneralCellModel *model = self.cellModel;
    
    NSAttributedString *titleAtt = model.title3Model.attributedText;
    NSNumber *width = model.title3Model.width;
    
    self.title3.attributedText = WDKJ_ConfirmAttString(titleAtt);
    
    if (WDKJ_IsNull_Num(width)) { // 自适应宽度
        [_title3 mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.top.bottom.right.equalTo(self.leftWrapView);
        }];
    } else {  //  固定宽度  width == @100
        [_title3 mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.top.bottom.right.equalTo(self.leftWrapView);
            make.width.equalTo(width);
        }];
    }
}

- (void)update_alikePriceLabel8_Constraint {
    
    CKJGeneralCellModel *model = self.cellModel;
    
//    左                     中间      右
//    [imageBtn2, title3]    []      [likePrice8, arrowImageView9]
    
    self.alikePriceLabel8.attributedText = WDKJ_ConfirmAttString(model.likePrice8Model.attributedText);
    
    CGFloat left = model.likePrice8Model.leftMargin;
    CGFloat right = model.likePrice8Model.rightMargin;
    
    [_alikePriceLabel8 kjwd_mas_updateConstraints:^(MASConstraintMaker *make, UIView *superview) {
        MASViewAttribute *temp = self.arrowImageView9.mas_left;
        
        make.left.equalTo(superview).offset(left);
        make.right.equalTo(temp).offset(-(right));
    }];
}

- (void)origin_arrowImageView9_Constraint {
    CKJArrow9Model *arrow9 = self.cellModel.arrow9Model;
    CGFloat right = arrow9.right;
    UIImage *image = arrow9.image;
    
    _arrowImageView9.image = image;
    _arrowImageView9.hidden = image ? NO : YES;
    

    [_arrowImageView9 kjwd_mas_remakeConstraints:^(MASConstraintMaker *make, UIView *superview) {
        make.centerY.equalTo(superview);
        make.right.equalTo(superview).offset(-(right));
        if (image) {
            make.width.equalTo(@(image.size.width));
            make.height.equalTo(@(image.size.height));
        } else {
            make.width.height.equalTo(@0);
        }
    }];
}


@end
