//
//  PTheme.h
//  Demo
//
//  Created by admin2 on 2020/3/24.
//  Copyright © 2020 admin2. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface PTheme : NSObject

+ (instancetype)theme;

//@property (strong, nonatomic) UIColor *title;
//@property (strong, nonatomic) UIColor *red;


+ (UIColor *)title;
+ (UIColor *)red;

@end

NS_ASSUME_NONNULL_END
