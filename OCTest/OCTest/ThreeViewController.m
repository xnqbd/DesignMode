//
//  ThreeViewController.m
//  OCTest
//
//  Created by admin2 on 2020/8/18.
//  Copyright © 2020 admin2. All rights reserved.
//

#import "ThreeViewController.h"
#import "User.h"

@interface ThreeViewController ()

@property (nonatomic, strong) UILabel *lb_userName;
@property (nonatomic, strong) User *user;

@end

@implementation ThreeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //创建User实例并初始化
    if (_user.userName.length > 0) {
        _lb_userName.text = _user.userName;
    } else {
        _lb_userName.text = [NSString stringWithFormat:@"简书%ld", _user.userId];
    }
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


