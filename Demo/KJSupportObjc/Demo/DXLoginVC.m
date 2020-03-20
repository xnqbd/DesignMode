//
//  DXLoginVC.m
//  Demo
//
//  Created by admin2 on 2020/3/19.
//  Copyright © 2020 admin2. All rights reserved.
//

#import "DXLoginVC.h"

@interface DXLoginVC ()

@property (strong, nonatomic) IBOutlet UITextField *usernameTf;
@property (strong, nonatomic) IBOutlet UITextField *pwdTf;
@property (strong, nonatomic) IBOutlet UITextField *codeTf;
@property (strong, nonatomic) IBOutlet UIButton *loginBtn;

@property (strong, nonatomic) IBOutlet UIButton *codeBtn;



@end

@implementation DXLoginVC

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    

    #ifdef DEBUG
    self.usernameTf.text = @"test1234";
    self.pwdTf.text = @"test1234";
    #else
        
    #endif
    
    
    [self.codeBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
    
    [self changeRad:self.usernameTf];
    [self changeRad:self.pwdTf];
    [self changeRad:self.codeTf];
    
    [self changeRad:self.loginBtn];
}

- (void)changeRad:(UIView *)tf {
    tf.layer.cornerRadius = 5;
    tf.layer.masksToBounds = YES;
}

- (IBAction)changeImageCodeAction:(UIButton *)sender {
    
}

- (IBAction)loginAction:(id)sender {
    NSString *name = self.usernameTf.text;
    NSString *pwd = self.pwdTf.text;
    NSString *code = self.codeTf.text;

//    if (name == nil || [name isEqualToString:@""]) {
//        [MBProgressHUD showError:@"登录名不能为空"];
//        return;
//    }
//    if (pwd == nil || [pwd isEqualToString:@""]) {
//        [MBProgressHUD showError:@"密码不能为空"];
//        return;
//    }
//    if (code == nil || [code isEqualToString:@""]) {
//        [MBProgressHUD showError:@"验证码不能为空"];
//        return;
//    }
    
}

- (IBAction)forgetPwdAction:(id)sender {
    
}

- (IBAction)registerAction:(id)sender {
    
}



@end
