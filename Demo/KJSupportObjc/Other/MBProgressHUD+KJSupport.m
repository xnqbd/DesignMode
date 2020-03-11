//
//  MBProgressHUD+KJSupport.m
//  Demo
//
//  Created by admin2 on 2020/3/7.
//  Copyright © 2020 admin2. All rights reserved.
//

#import "MBProgressHUD+KJSupport.h"
#include "NSObject+WDYHFCategory.h"

@implementation MBProgressHUD (KJSupport)

+ (void)kjwd_showMessage:(NSString *)msg {
    [self kjwd_showMessage:msg toView:[UIWindow kjwd_appdelegateWindow]];
}
+ (void)kjwd_showMessage:(NSString *)msg toView:(nullable UIView *)view {
    if (WDKJ_IsNullObj(view, [UIView class])) {
        view = [UIWindow kjwd_appdelegateWindow];
    }
    msg = WDKJ_ConfirmString(msg);
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.detailsLabel.text = msg;
    hud.detailsLabel.font = [UIFont systemFontOfSize:14];
    hud.mode = MBProgressHUDModeText;
    // 隐藏时候从父控件中移除
    hud.removeFromSuperViewOnHide = YES;
    
    NSTimeInterval delay = 2;
    if (msg.length > 10) {
        delay = 4;
    }
    [hud hideAnimated:YES afterDelay:delay];
}

@end
