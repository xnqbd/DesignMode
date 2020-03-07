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


//@interface CKJImageViewCellConfig : CKJCommonCellConfig
//
//
//
//@end

@interface CKJImageViewCellModel : CKJCommonCellModel

@property (assign, nonatomic) UIEdgeInsets imageEdge;
@property (assign, nonatomic) UIViewContentMode contentMode;



@property (strong, nonatomic) UIImage *localImage;


@property (copy, nonatomic, nullable) NSString *r_Image_URL;
@property (strong, nonatomic, nullable) UIImage *r_placeholderImage;


+ (nonnull instancetype)imageViewWithCellHeight:(nullable NSNumber *)cellHeight cellModel_id:(nullable NSString *)cellModel_id detailSettingBlock:(nullable CKJImageViewCellRowBlock)detailSettingBlock didSelectRowBlock:(nullable CKJImageViewCellRowBlock)didSelectRowBlock;

@end


@interface CKJImageViewCell : CKJCommonTableViewCell

@end

NS_ASSUME_NONNULL_END
