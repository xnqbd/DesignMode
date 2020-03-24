//
//  UnitCell.m
//  Demo
//
//  Created by admin2 on 2020/3/20.
//  Copyright © 2020 admin2. All rights reserved.
//

#import "UnitCell.h"
#import "NSObject+WDYHFCategory.h"

@implementation UnitCell



- (void)_setTitle:(NSString *)title btnTitle:(NSString *_Nullable)btnTitle
             unit:(NSString *_Nullable)unit
            click:(void(^)(UIButton * _Nonnull __weak _sender))click {
    self.title.text = title;
    if (btnTitle) {
        [self.btn setTitle:btnTitle forState:UIControlStateNormal];
    }
    self.unitLab.text = unit;
    [self.btn kjwd_addTouchUpInsideForCallBack:click];
}



//- (void)_setTitle2:(NSString *)title btnTitle:(NSString *_Nullable)btnTitle
//             unit:(NSString *_Nullable)unit
//             array:(NSArray *)array
//            click:(void(^)(UIButton * _Nonnull _sender, NSArray *arr))click {
//    self.title.text = title;
//    if (btnTitle) {
//        [self.btn setTitle:btnTitle forState:UIControlStateNormal];
//    }
//    self.unitLab.text = unit;
//    self.btn.ex_Obj1 = array;
//    
////    [self.btn kjwd_addTouchUpInsideForCallBack:^(UIButton * _Nonnull _sender) {
////        click
////    }];
//}



@end
