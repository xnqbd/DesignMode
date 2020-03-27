//
//  NaVC.m
//  Demo
//
//  Created by admin2 on 2020/3/24.
//  Copyright © 2020 admin2. All rights reserved.
//

#import "NaVC.h"
#import "NSObject+WDYHFCategory.h"

@interface NaVC ()<UINavigationControllerDelegate, UIGestureRecognizerDelegate>

@end

@implementation NaVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.delegate = self;
    self.interactivePopGestureRecognizer.delegate = self;

    
    [self kjwd_setClearNavigationBar];
    [self kjwd_setTitleColorFontDic:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];
}



- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated{
    self.interactivePopGestureRecognizer.enabled = [self.viewControllers count] > 1 ;
}


@end
