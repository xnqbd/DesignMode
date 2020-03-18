//
//  RJHomeScrollItem.h
//  MobileHospital_Renji
//
//  Created by chenkaijie on 2019/6/13.
//  Copyright © 2019 Lyc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CKJScrollViewCell.h"


NS_ASSUME_NONNULL_BEGIN


@interface RJDemoScrollItemView : CKJScrollViewCellItemView

@property (weak, nonatomic) IBOutlet UIView *wrapperView;

@property (weak, nonatomic) IBOutlet UIImageView *imageV;
@property (weak, nonatomic) IBOutlet UILabel *lab;


@end

NS_ASSUME_NONNULL_END
