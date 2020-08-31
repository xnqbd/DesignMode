//
//  AppDelegate.h
//  OCTest
//
//  Created by admin2 on 2020/6/9.
//  Copyright © 2020 admin2. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

/// 是否允许旋转
@property (assign, nonatomic) BOOL allow;

@end

