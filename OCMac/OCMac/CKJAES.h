//
//  CKJAES.h
//  OCMac
//
//  Created by admin2 on 2020/9/2.
//  Copyright © 2020 admin2. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN


/*
AES加密是一种对称加密方式，他有基本的五种加密模式组成分别是：
1.电码本模式（Electronic Codebook Book (ECB)）；
2.密码分组链接模式（Cipher Block Chaining (CBC)）；  这种最常用
3.计算器模式（Counter (CTR)）；
4.密码反馈模式（Cipher FeedBack (CFB)）；
5.输出反馈模式（Output FeedBack (OFB)）

 */
 
 
@interface CKJAES : NSObject

+ (nullable NSString *)AES128Encrypt:(NSString *)plainText key:(NSString *)key;
+ (nullable NSString *)AES128Decrypt:(NSString *)encryptText key:(NSString *)key;


//将string转成带密码的data
+ (NSString*)encryptAESData:(NSString*)string Withkey:(NSString * )key ivkey:(NSString * )ivkey;
//将带密码的data转成string
+ (NSString*)decryptAESData:(NSString*)data Withkey:(NSString *)key ivkey:(NSString * )ivkey;


@end

NS_ASSUME_NONNULL_END
