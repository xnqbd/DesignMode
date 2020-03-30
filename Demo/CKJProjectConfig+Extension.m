//
//  CKJProjectConfig+Extension.m
//  Demo
//
//  Created by admin2 on 2020/3/27.
//  Copyright © 2020 admin2. All rights reserved.
//

#import "CKJProjectConfig+Extension.h"
#import <objc/message.h>
#import "CKJGeneralCell.h"

@implementation CKJProjectConfig (Extension)


// 最好在 load 方法里 交换方法
+ (void)load {
    [super load];
    
    Class class = [self class];
    
//    NSLog(@"%@  load  ", class);
    
    Method method_a1 = class_getClassMethod(class, @selector(arrow9SystemModel));
    Method method_a2 = class_getClassMethod(class, @selector(kj_arrow9SystemModel));
    
    
//    Method method_b1 = class_getClassMethod(class, @selector(super_margin_title));
//    Method method_b2 = class_getClassMethod(class, @selector(kj_super_margin_title));
    
    //在这里要进行判断的
    
    method_exchangeImplementations(method_a1, method_a2);
}

+ (CKJArrow9Model *)kj_arrow9SystemModel {
    CKJArrow9Model *m = [[CKJArrow9Model alloc] init];
    m.image = [UIImage kjwd_imageNamed:@"m_monitor_icon3"];
    return m;
}


@end
