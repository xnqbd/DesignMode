//
//  NSData+Encryption_CKJAES.h
//  OCMac
//
//  Created by admin2 on 2020/9/9.
//  Copyright © 2020 admin2. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSData (Encryption_CKJAES)

- (NSData *)AES128EncryptWithKey:(NSString *) key ivKey:(NSString *)ivkey;//加密
- (NSData *)AES128DecryptWithKey:(NSString *) key ivkey:(NSString * )ivkey;//解密

@end

NS_ASSUME_NONNULL_END
