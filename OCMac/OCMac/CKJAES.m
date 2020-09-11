//
//  CKJAES.m
//  OCMac
//
//  Created by admin2 on 2020/9/2.
//  Copyright © 2020 admin2. All rights reserved.
//

#import "CKJAES.h"
#import <CommonCrypto/CommonCrypto.h>
#import <CommonCrypto/CommonDigest.h>
#import "NSData+Encryption_CKJAES.h"


@implementation CKJAES



+ (nullable NSString *)aes_encryptString:(NSString *)string key:(NSString *)key {
    if ([self strIsEmpty:string] || [self strIsEmpty:key]) {
        return nil;
    }
//    NSData *originData = [str dataUsingEncoding:NSUTF8StringEncoding];
//    NSData *data = [self aes_encryptData:originData key:key];
//    if ([self dataIsEmpty:data]) {
//        return nil;
//    }
//    NSString *result = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
//    return result;
    
    

    const char *cStr = [string cStringUsingEncoding:NSUTF8StringEncoding];

    NSData *data = [NSData dataWithBytes:cStr length:[string length]];

    //对数据进行加密
    

    NSData *result = [self aes_encryptData:data key:key];

    //转换为2进制字符串

    if(result && result.length > 0)

    {

    Byte *datas = (Byte *)[result bytes];

    NSMutableString *outPut = [NSMutableString stringWithCapacity:result.length];

    for(int i = 0 ; i < result.length ; i++)

    {

    [outPut appendFormat:@"%02x",datas[i]];

    }

    return outPut;

    }

    return nil;

    
    
}
+ (nullable NSData *)aes_encryptData:(NSData *)data key:(NSString *)key {

    char keyPtr[kCCKeySizeAES128 + 1];

    bzero(keyPtr, sizeof(keyPtr));

    [key getCString:keyPtr maxLength:sizeof(key) encoding:NSUTF8StringEncoding];

    NSUInteger dataLength = [data length];

    size_t bufferSize = dataLength + kCCBlockSizeAES128;

    void *buffer = malloc(bufferSize);

    size_t numBytesEncrypted = 0;

    CCCryptorStatus cryptStatus = CCCrypt(kCCEncrypt,

    kCCAlgorithmAES128,

    kCCOptionPKCS7Padding | kCCOptionECBMode,

    keyPtr,

    kCCBlockSizeAES128,

    NULL,

    [data bytes],

    dataLength,

    buffer,

    bufferSize,

    &numBytesEncrypted);

    if (cryptStatus == kCCSuccess) {
        return [NSData dataWithBytesNoCopy:buffer length:numBytesEncrypted];
    }

    free(buffer);

    return nil;
}

+ (nullable NSString *)aes_decryptString:(NSString *)string key:(NSString *)key {
    if ([self strIsEmpty:string] || [self strIsEmpty:key]) {
        return nil;
    }
//    NSData *originData = [str dataUsingEncoding:NSUTF8StringEncoding];
//    NSData *data = [self aes_decryptData:originData key:key];
//    if ([self dataIsEmpty:data]) {
//        return nil;
//    }
//    NSString *result = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
//    return result;
    

    NSMutableData *data = [NSMutableData dataWithCapacity:string.length/2.0];

    unsigned char whole_bytes;

    char byte_chars[3] = {'\0','\0','\0'};

    int i;

    for(i = 0 ; i < [string length]/2 ; i++)

    {

    byte_chars[0] = [string characterAtIndex:i * 2];

    byte_chars[1] = [string characterAtIndex:i * 2 + 1];

    whole_bytes = strtol(byte_chars, NULL, 16);

    [data appendBytes:&whole_bytes length:1];

    }

    NSData *result = [self aes_decryptData:data key:key];

    if(result && result.length > 0)

    {

    return [[NSString alloc] initWithData:result encoding:NSUTF8StringEncoding];

    }

    return nil;
    
}

+ (nullable NSData *)aes_decryptData:(NSData *)data key:(NSString *)key {

    char keyPtr[kCCKeySizeAES128 + 1];

    bzero(keyPtr, sizeof(keyPtr));

    [key getCString:keyPtr maxLength:sizeof(keyPtr) encoding:NSUTF8StringEncoding];

    NSUInteger dataLength = [data length];

    size_t bufferSize = dataLength + kCCBlockSizeAES128;

    void *buffer = malloc(bufferSize);

    size_t numBytesDecrypted = 0;

    CCCryptorStatus cryptStatus = CCCrypt(kCCDecrypt, kCCAlgorithmAES128, kCCOptionPKCS7Padding | kCCOptionECBMode, keyPtr, kCCBlockSizeAES128, NULL, [data bytes], dataLength, buffer, bufferSize, &numBytesDecrypted);

    if(cryptStatus == kCCSuccess)

    {

    return [NSData dataWithBytesNoCopy:buffer length:numBytesDecrypted];

    }

    free(buffer);

    return nil;
}



+ (BOOL)strIsEmpty:(NSString *)str {
    if (str == nil || ![str isKindOfClass:[NSString class]]) {
        return YES;
    }
    return NO;
}

+ (BOOL)dataIsEmpty:(NSData *)data {
    if (data == nil || ![data isKindOfClass:[NSData class]]) {
        return YES;
    }
    return NO;
}








//AES加密解密#import <CommonCrypto/CommonCrypto.h>#import <CommonCrypto/CommonDigest.h>//AES128位加密 base64编码 注：kCCKeySizeAES128点进去可以更换256位加密
+(nullable NSString *)AES128Encrypt:(NSString *)plainText key:(NSString *)key
{
    if ([self strIsEmpty:plainText] || [self strIsEmpty:key]) {
          return nil;
      }
    
    
    char keyPtr[kCCKeySizeAES128+1];//
    memset(keyPtr, 0, sizeof(keyPtr));
    [key getCString:keyPtr maxLength:sizeof(keyPtr) encoding:NSUTF8StringEncoding];
    
    NSData* data = [plainText dataUsingEncoding:NSUTF8StringEncoding];
    NSUInteger dataLength = [data length];
    
    size_t bufferSize = dataLength + kCCBlockSizeAES128;
    void *buffer = malloc(bufferSize);
    size_t numBytesEncrypted = 0;
    CCCryptorStatus cryptStatus = CCCrypt(kCCEncrypt,
                                          kCCAlgorithmAES128,
                                          kCCOptionPKCS7Padding|kCCOptionECBMode,
                                          keyPtr,
                                          kCCBlockSizeAES128,
                                          NULL,
                                          [data bytes],
                                          dataLength,
                                          buffer,
                                          bufferSize,
                                          &numBytesEncrypted);
    if (cryptStatus == kCCSuccess) {
        NSData *resultData = [NSData dataWithBytesNoCopy:buffer length:numBytesEncrypted];
        
        NSString *stringBase64 = [resultData base64EncodedStringWithOptions:NSDataBase64EncodingEndLineWithLineFeed]; // base64格式的字符串
        return stringBase64;
        
    }
    free(buffer);
    return nil;
}

//解密
+(nullable NSString *)AES128Decrypt:(NSString *)encryptText key:(NSString *)key {
    if ([self strIsEmpty:encryptText] || [self strIsEmpty:key]) {
             return nil;
         }
    
    char keyPtr[kCCKeySizeAES128 + 1];
    memset(keyPtr, 0, sizeof(keyPtr));
    [key getCString:keyPtr maxLength:sizeof(keyPtr) encoding:NSUTF8StringEncoding];
    
    NSData *data = [[NSData alloc] initWithBase64EncodedString:encryptText options:NSDataBase64DecodingIgnoreUnknownCharacters];//base64解码
    
    NSUInteger dataLength = [data length];
    size_t bufferSize = dataLength + kCCBlockSizeAES128;
    void *buffer = malloc(bufferSize);
    
    size_t numBytesCrypted = 0;
    CCCryptorStatus cryptStatus = CCCrypt(kCCDecrypt,
                                          kCCAlgorithmAES128,
                                          kCCOptionPKCS7Padding|kCCOptionECBMode,
                                          keyPtr,
                                          kCCBlockSizeAES128,
                                          NULL,
                                          [data bytes],
                                          dataLength,
                                          buffer,
                                          bufferSize,
                                          &numBytesCrypted);
    if (cryptStatus == kCCSuccess) {
        NSData *resultData = [NSData dataWithBytesNoCopy:buffer length:numBytesCrypted];
        
        return [[NSString alloc] initWithData:resultData encoding:NSUTF8StringEncoding];
    }
    free(buffer);
    return nil;
}



//  EN()  代表   MD5( AES() )

//    @{
//        @"EN(手机号)" : @{
//                @"EN(pwd)" : @"EN(123456)",
//                @"EN(剩余解锁次数)" : @"AES(4)",
//                @"EN(最大解锁次数)" : @"AES(5)",
//                @"EN(switchStatus)" :  AES(@"opened"/@"closed")  // 只能通过手动切换Switch切换 UI界面上显示的开关状态
//        }
//    };



#pragma mark - AES加密
 //将string转成带密码的data
 +(NSString*)encryptAESData:(NSString*)string Withkey:(NSString *)key ivkey:(NSString *)ivkey
 {
     //将nsstring转化为nsdata
     NSData *data = [string dataUsingEncoding:NSUTF8StringEncoding];
     //使用密码对nsdata进行加密
     NSData *encryptedData = [data AES128EncryptWithKey:key ivKey:ivkey];
     //加密之后编码
     return [self dataTohexString:encryptedData];;
 }
 #pragma mark - AES解密
 //将带密码的data转成string
 +(NSString*)decryptAESData:(NSString*)string Withkey:(NSString *)key ivkey:(NSString *)ivkey
 {
     //对数据进行解密
     NSData* result = [[self hexStringToData:string] AES128DecryptWithKey:key ivkey:ivkey];
     if (result && result.length > 0) {
         //加密之后进行编码
         return [[NSString alloc] initWithData:result  encoding:NSUTF8StringEncoding];
     }
        return nil;
 }
#pragma mark - 16位编码 -加密
 + (NSString *)dataTohexString:(NSData*)data
 {
     Byte *bytes = (Byte *)[data bytes];
     NSString *hexStr=@"";
     for(int i=0;i<[data length];i++)
     {
         NSString *newHexStr = [NSString stringWithFormat:@"%x",bytes[i]&0xff];//16进制数
         if([newHexStr length]==1)
             hexStr = [NSString        stringWithFormat:@"%@0%@",hexStr,newHexStr];
         else
             hexStr = [NSString       stringWithFormat:@"%@%@",hexStr,newHexStr];
     }
     return hexStr;
 }
 #pragma mark - 16位编码 -解密
 + (NSData*)hexStringToData:(NSString*)hexString
 {
     int j=0;
     Byte bytes[hexString.length];  ///3ds key的Byte 数组， 128位
     for(int i=0;i<[hexString length];i++)
     {
         int int_ch;  /// 两位16进制数转化后的10进制数
         unichar hex_char1 = [hexString characterAtIndex:i]; ////两位16进制数中的第一位(高位*16)
         int int_ch1;
         if(hex_char1 >= '0' && hex_char1 <='9')
         int_ch1 = (hex_char1-48)*16;   //// 0 的Ascll - 48
         else if(hex_char1 >= 'A' && hex_char1 <='F')
             int_ch1 = (hex_char1-55)*16; //// A 的Ascll - 65
         else
             int_ch1 = (hex_char1-87)*16; //// a 的Ascll - 97
         i++;
         unichar hex_char2 = [hexString characterAtIndex:i]; ///两位16进制数中的第二位(低位)
         int int_ch2;
         if(hex_char2 >= '0' && hex_char2 <='9')
             int_ch2 = (hex_char2-48); //// 0 的Ascll - 48
         else if(hex_char1 >= 'A' && hex_char1 <='F')
             int_ch2 = hex_char2-55; //// A 的Ascll - 65
         else
             int_ch2 = hex_char2-87; //// a 的Ascll - 97
         int_ch = int_ch1+int_ch2;
         //NSLog(@"int_ch=%x",int_ch);
         bytes[j] = int_ch;  ///将转化后的数放入Byte数组里
         j++;
     }
     //    NSData *newData = [[NSData alloc] initWithBytes:bytes length:j];
     NSData *newData = [[NSData alloc] initWithBytes:bytes length:j];
     //NSLog(@"newData=%@",newData);
     return newData;
 }


@end

