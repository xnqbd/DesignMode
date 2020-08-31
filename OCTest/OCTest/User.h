//
//  User.h
//  OCTest
//
//  Created by admin2 on 2020/8/18.
//  Copyright © 2020 admin2. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface User : NSObject


@property (nonatomic, copy) NSString *userName;
@property (nonatomic, assign) NSInteger userId;

- (instancetype)initWithUserName:(NSString *)userName userId:(NSInteger)userId;


@end

NS_ASSUME_NONNULL_END
