//
//  CKJImageViewCell.h
//  MobileHospital_Renji
//
//  Created by admin2 on 2020/1/11.
//  Copyright © 2020 Lyc. All rights reserved.
//

#import "CKJCommonTableViewCell.h"

NS_ASSUME_NONNULL_BEGIN


@class CKJImageViewCellModel;

typedef void(^CKJImageViewCellRowBlock)(__kindof CKJImageViewCellModel *_Nonnull m);


@interface CKJImageViewCellModel : CKJCommonCellModel


@property (assign, nonatomic) UIViewContentMode contentMode;
@property (copy, nonatomic) void(^updateConstraint)(MASConstraintMaker *make, UIView *superview);


@property (strong, nonatomic) UIImage *localImage;


@property (copy, nonatomic, nullable) NSString *r_Image_URL;
@property (strong, nonatomic, nullable) UIImage *r_placeholderImage;


+ (instancetype)imageViewWithCellHeight:(nullable NSNumber *)cellHeight detailSettingBlock:(nullable CKJImageViewCellRowBlock)detailSettingBlock updateConstraint:(void(^)(MASConstraintMaker *make, UIView *superview))updateConstraint;

@end


@interface CKJImageViewCell : CKJCommonTableViewCell

@end

NS_ASSUME_NONNULL_END
