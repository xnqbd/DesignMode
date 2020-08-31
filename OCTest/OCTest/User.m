//
//  User.m
//  OCTest
//
//  Created by admin2 on 2020/8/18.
//  Copyright © 2020 admin2. All rights reserved.
//

#import "User.h"

@implementation User


- (instancetype)initWithUserName:(NSString *)userName userId:(NSInteger)userId {
    self = [super init];
    if (!self) return nil;
    _userName = userName;
    _userId   = userId;
    return self;
}

@end
