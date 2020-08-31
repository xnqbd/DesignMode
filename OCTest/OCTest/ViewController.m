//
//  ViewController.m
//  OCTest
//
//  Created by admin2 on 2020/6/9.
//  Copyright © 2020 admin2. All rights reserved.
//

#import "ViewController.h"
#import <LocalAuthentication/LocalAuthentication.h>

#import <AVFoundation/AVFoundation.h>
#import "AppDelegate.h"
#import "TwoViewController.h"
//#import <mas>
#import "CKJAuthImitateZhiFuBao.h"



@interface ViewController () <UIApplicationDelegate>

@property (strong, nonatomic) IBOutlet UIImageView *imaV;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (IBAction)first:(id)sender {
    //    [CKJAuthImitateZhiFuBao firstAuthWithYourTruePwd:@"123" auth_Success:^{
    //
    //    } auth_unrecognized:^{
    //
    //    }];
}

- (IBAction)other:(UIButton *)sender {
    
    
    [self aaa];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{

        [self aaa];

        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{

            [self aaa];
        });
    });
    
    
}


- (void)aaa {

        
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"提示" message:@"么么么么么么么木木" preferredStyle:UIAlertControllerStyleAlert];
        [alertController addAction:([UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
    //        completionHandler();
        }])];
        [self presentViewController:alertController animated:YES completion:nil];
}

@end


