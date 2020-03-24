//
//  DemoTestVC.m
//  Demo
//
//  Created by admin2 on 2020/3/16.
//  Copyright © 2020 admin2. All rights reserved.
//

#import "DemoTestVC.h"
#import "CKJDatePickerView.h"
#import "NSObject+WDYHFCategory.h"

@interface DemoTestVC ()

@property (strong, nonatomic) IBOutlet UITextField *tf;

@property (weak, nonatomic) id delegate;

@end

@implementation DemoTestVC

- (void)viewDidLoad {
    [super viewDidLoad];
//    CKJDatePickerView *p = [[CKJDatePickerView alloc] initWithDateStyle:CKJDateStyle1 scrollToDate:[NSDate date] endScroll_didSelect_callBack:^(NSDate * _Nonnull currentDate) {
//
//    }];
//    p.hideBackgroundYearLabel = YES;
//    p.dateLabelColor = [UIColor kjwd_subTitle];
//
//    [self.view addSubview:p];
//    [p kjwd_mas_makeConstraints:^(MASConstraintMaker * _Nonnull make, UIView * _Nonnull superview) {
//        make.center.equalTo(superview);
//        make.size.mas_equalTo(CGSizeMake(330, 160));
//    }];
//
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    
//    CGRect rect = CGRectMake(0, <#CGFloat y#>, <#CGFloat width#>, <#CGFloat height#>)
    
}

- (void)dealloc {
    NSLog(@"DemoTestVC dealloc ");
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
