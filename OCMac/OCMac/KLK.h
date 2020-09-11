//
//  KLK.h
//  OCMac
//
//  Created by admin2 on 2020/9/2.
//  Copyright © 2020 admin2. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface KLK : NSObject

+ (NSData *)encryptDataWithData:(NSData *)data Key:(NSString *)key;
+ (NSData *)decryptDataWithData:(NSData *)data andKey:(NSString *)key;
+ (NSString *)encryptStringWithString:(NSString *)string andKey:(NSString *)key;
+ (NSString *)decryptStringWithString:(NSString *)string andKey:(NSString *)key;

@end

NS_ASSUME_NONNULL_END
