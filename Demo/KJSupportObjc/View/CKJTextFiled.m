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
    return CGRectInset( bounds , 10 , 0 );
}

//控制编辑文本时所在的位置，左右缩 10
- (CGRect)editingRectForBounds:(CGRect)bounds {
    return CGRectInset( bounds , 10 , 0 );
}
 
@end
