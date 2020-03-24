//
//  CKJTextFiled.m
//  HealthCity
//
//  Created by admin2 on 2020/3/19.
//  Copyright © 2020 will. All rights reserved.
//

#import "CKJTextFiled.h"

@implementation CKJTextFiled

- (CGRect)textRectForBounds:(CGRect)bounds {
    NSLog(@"textRectForBounds %@   ", NSStringFromCGRect(bounds));
    NSLog(@"新的 %@   ", NSStringFromCGRect(CGRectInset( bounds , 30 , 0 )));
    
    return CGRectInset( bounds , 30 , 0 );
}

//控制编辑文本时所在的位置，左右缩 10
- (CGRect)editingRectForBounds:(CGRect)bounds {
    return CGRectInset( bounds , 10 , 0 );
}
 
@end
