//
//  WDHTTPRequest.m
//  MobileManage
//
//  Created by admin2 on 2020/9/10.
//  Copyright © 2020 admin2. All rights reserved.
//

#import "WDHTTPRequest.h"

#import "WDHTTPRequestCore.h"


@implementation WDHTTPRequest



+ (NSURLSessionTask *)checkUpdateSuccess:(nullable WDYHFKJSuccess)successBlock failure:(nullable WDYHFKJFailure)failureBlock hiddenHubBlock:(nullable WDYHFKJHiddenHub)hiddenHubBlock exceptionBlock:(nullable WDYHFKJException)exceptionBlock {
    NSDictionary *dic = @{
        @"platform" : @"ios",
        @"version" : @"1.0"
    };
    
//    {
//      "code" : "BI-000",
//      "errorInfo" : null,
//      "data" : {
//        "appUrl" : "https:\/\/ydzg-1303117281.cos.ap-shanghai.myqcloud.com\/version\/ios\/manifest.plist",
//        "content" : "xxxx",
//        "id" : "2b7d01c5631b49e7918e1127f1d6fbfa",
//        "platform" : "ios",
//        "isUpdate" : "0",
//        "isMustUpdate" : "1",
//        "createUserName" : "lijianhuas",
//        "version" : "v1.0.01",
//        "createDate" : "2020-09-10 17:42:24",
//        "fid" : null
//      },
//      "msg" : "OK",
//      "successful" : true
//    }
    
    
    return [WDHTTPRequestCore get_requestWithURL:@"" parameters:dic headers:nil Success:successBlock failure:failureBlock hiddenHubBlock:hiddenHubBlock exceptionBlock:exceptionBlock];
}



@end
