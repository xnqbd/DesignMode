//
//  MonitorInstrumentCell.m
//  Demo
//
//  Created by admin2 on 2020/3/27.
//  Copyright © 2020 admin2. All rights reserved.
//

#import "MonitorInstrumentCell.h"
#import "NSObject+WDYHFCategory.h"
#import "UIView+CKJDesingable.h"

@implementation MonitorInstrumentCellModel

@end


@implementation MonitorInstrumentCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.thebgV.backgroundColor = [UIColor whiteColor];
    [self.thebgV kjwd_cornerRadius:8 shadowColor:nil shadowOffset:CGSizeZero shadowOpacity:nil shadowRadius:@5];
}

@end
