//
//  PTheme.m
//  Demo
//
//  Created by admin2 on 2020/3/24.
//  Copyright © 2020 admin2. All rights reserved.
//

#import "PTheme.h"
#import "NSObject+WDYHFCategory.h"

@implementation PTheme

+ (instancetype)theme {
    static PTheme *theme = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        theme = [[self alloc] init];
    });
    return theme;
}


+ (UIColor *)title {
    return [UIColor kjwd_title];
}
+ (UIColor *)red {
    return [UIColor systemRedColor];
}


@end
