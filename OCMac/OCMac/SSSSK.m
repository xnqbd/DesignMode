//
//  SSSSK.m
//  OCMac
//
//  Created by admin2 on 2020/8/13.
//  Copyright © 2020 admin2. All rights reserved.
//

#import "SSSSK.h"

@implementation SSSSK


/// 获取crt文件的 主要数据
+ (NSString *)kjwd_getMainData_ByCRTFileName:(NSString *)crtFileName {
    
    NSString *path = [[NSBundle mainBundle] pathForResource:crtFileName ofType:@"crt"];
    
    if (path == nil || [path isEqualToString:@""]) {
        return @"";
    }
    
    NSData *data = [NSData dataWithContentsOfFile:path];
    NSString *dataStr = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    if (dataStr) {
        dataStr = [dataStr stringByReplacingOccurrencesOfString:@"\r" withString:@""];
        dataStr = [dataStr stringByReplacingOccurrencesOfString:@"\n" withString:@""];
        dataStr = [dataStr stringByReplacingOccurrencesOfString:@"-----BEGIN CERTIFICATE-----" withString:@""];
        dataStr = [dataStr stringByReplacingOccurrencesOfString:@"-----END CERTIFICATE-----" withString:@""];
    }
    return dataStr;
}


@end
