//
//  DMBottomLineView.m
//  Demo
//
//  Created by admin2 on 2020/3/20.
//  Copyright © 2020 admin2. All rights reserved.
//

#import "DMBottomLineView.h"

@implementation DMBottomLineView

- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextAddRect(ctx, CGRectMake(0, rect.size.height - 0.7, rect.size.width, 0.7));
    if (self.bottomColor) {
        [self.bottomColor setFill];
    } else {
        UIColor *color = [UIColor colorWithRed:230 / 255.0 green:230 / 255.0 blue:230 / 255.0 alpha:1];
        [color setFill];
    }
    CGContextFillPath(ctx);
}



@end
