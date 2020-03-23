//
//  MonitorInputVC2.m
//  Demo
//
//  Created by admin2 on 2020/3/20.
//  Copyright © 2020 admin2. All rights reserved.
//

#import "MonitorInputVC2.h"
#import "DMBottomLineView.h"
#import "UnitCell.h"

@interface MonitorInputVC2 ()
@property (weak, nonatomic) IBOutlet DMBottomLineView *bv;
@property (weak, nonatomic) IBOutlet UIButton *chooseBtn;

@end

@implementation MonitorInputVC2

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"touchesBegan %@   ", NSStringFromCGRect(self.bv.frame));
}

@end
