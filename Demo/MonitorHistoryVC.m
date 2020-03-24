//
//  MonitorHistoryVC.m
//  Demo
//
//  Created by admin2 on 2020/3/24.
//  Copyright © 2020 admin2. All rights reserved.
//

#import "MonitorHistoryVC.h"
#import "CKJSimpleTableView.h"

@interface MonitorHistoryVC ()



@property (weak, nonatomic) IBOutlet UILabel *oneLab;

@property (weak, nonatomic) IBOutlet UILabel *unitLab;
@property (weak, nonatomic) IBOutlet UILabel *numLab;
@property (weak, nonatomic) IBOutlet UILabel *fourLab;
@property (weak, nonatomic) IBOutlet CKJSimpleTableView *simpleTableView;

@property (weak, nonatomic) IBOutlet UIButton *recordBtn;

@end

@implementation MonitorHistoryVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = _type;
    
    self.simpleTableView.backgroundColor = [UIColor clearColor];
    
    if ([_type isEqualToString:@"血糖"]) {
        self.view.backgroundColor = [UIColor kjwd_r:245 g:228 b:130 alpha:1];
    } else if ([_type isEqualToString:@"睡眠"]) {
        self.view.backgroundColor = [UIColor kjwd_r:85 g:113 b:225 alpha:1];
    } else if ([_type isEqualToString:@"体重"]) {
        self.view.backgroundColor = [UIColor kjwd_r:90 g:169 b:248 alpha:1];
    } else if ([_type isEqualToString:@"血压"]) {
        self.view.backgroundColor = [UIColor kjwd_r:90 g:86 b:188 alpha:1];
    } else if ([_type isEqualToString:@"运动"]) {
        self.view.backgroundColor = [UIColor kjwd_r:253 g:170 b:81 alpha:1];
    }
    
    [_recordBtn setTitle:[NSString stringWithFormat:@"记录%@", _type] forState:UIControlStateNormal];
}


- (IBAction)recordingAction:(UIButton *)sender {
}

@end
