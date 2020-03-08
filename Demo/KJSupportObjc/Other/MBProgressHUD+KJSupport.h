//
//  MBProgressHUD+KJSupport.h
//  Demo
//
//  Created by admin2 on 2020/3/7.
//  Copyright © 2020 admin2. All rights reserved.
//

#import <MBProgressHUD/MBProgressHUD.h>

NS_ASSUME_NONNULL_BEGIN

@interface MBProgressHUD (KJSupport)

+ (void)kjwd_showMessage:(NSString *)msg;

+ (void)kjwd_showMessage:(NSString *)msg toView:(UIView *)view;

@end

NS_ASSUME_NONNULL_END
