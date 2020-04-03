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
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    
//    CGRect rect = CGRectMake(0, <#CGFloat y#>, <#CGFloat width#>, <#CGFloat height#>)
    NSLog(@"%@   ", [CKJAPPHelper bundleId]);
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
