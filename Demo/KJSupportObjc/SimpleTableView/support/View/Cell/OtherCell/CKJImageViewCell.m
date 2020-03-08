//
//  CKJImageViewCell.m
//  MobileHospital_Renji
//
//  Created by admin2 on 2020/1/11.
//  Copyright © 2020 Lyc. All rights reserved.
//

#import "CKJImageViewCell.h"
#import <SDWebImage/UIImageView+WebCache.h>


@implementation CKJImageViewCellModel

+ (nonnull instancetype)imageViewWithCellHeight:(nullable NSNumber *)cellHeight cellModel_id:(nullable NSString *)cellModel_id detailSettingBlock:(nullable CKJImageViewCellRowBlock)detailSettingBlock didSelectRowBlock:(nullable CKJImageViewCellRowBlock)didSelectRowBlock {
    return [self commonWithCellHeight:cellHeight cellModel_id:cellModel_id detailSettingBlock:detailSettingBlock didSelectRowBlock:didSelectRowBlock];
}

- (instancetype)init {
    if (self = [super init]) {
        self.contentMode = UIViewContentModeScaleAspectFill;
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}


@end


@interface CKJImageViewCell ()

@property (strong, nonatomic) UIImageView *imageV;

@end

@implementation CKJImageViewCell

- (void)setupSubViews {
    UIImageView *imageV = [[UIImageView alloc] init];
    [imageV kjwd_masWithSuperView:self.subviews_SuperView makeConstraints:^(MASConstraintMaker * _Nonnull make, UIView * _Nonnull superview) {
        make.edges.equalTo(superview).insets(UIEdgeInsetsZero);
    }];
    self.imageV = imageV;
}

- (void)setupData:(__kindof CKJImageViewCellModel *)model section:(NSInteger)section row:(NSInteger)row selectIndexPath:(NSIndexPath *)indexPath tableView:(CKJSimpleTableView *)tableView {
    UIImage *localImage = model.localImage;
    NSString *imageURL = model.r_Image_URL;
    
    _imageV.contentMode = model.contentMode;
    
    if (!WDKJ_IsNullObj(localImage, [UIImage class])) {
        _imageV.image = localImage;
    } else if (!WDKJ_IsEmpty_Str(imageURL)) {
        [_imageV sd_setImageWithURL:[NSURL kjwd_URLWithString:imageURL] placeholderImage:model.r_placeholderImage];
    } else {
        _imageV.image = model.r_placeholderImage;
    }
    _imageV.clipsToBounds = YES;
 
    [_imageV kjwd_mas_updateConstraints:^(MASConstraintMaker * _Nonnull make, UIView * _Nonnull superview) {
        make.edges.equalTo(superview).insets(model.imageEdge);
    }];
}


@end
