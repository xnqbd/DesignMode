//
//  WDHTTPRequest.h
//  MobileManage
//
//  Created by admin2 on 2020/9/10.
//  Copyright © 2020 admin2. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WDHTTPRequestCore.h"


NS_ASSUME_NONNULL_BEGIN



@interface WDHTTPRequest : NSObject


+ (NSURLSessionTask *)checkUpdateSuccess:(nullable WDYHFKJSuccess)successBlock failure:(nullable WDYHFKJFailure)failureBlock hiddenHubBlock:(nullable WDYHFKJHiddenHub)hiddenHubBlock exceptionBlock:(nullable WDYHFKJException)exceptionBlock;



@end

NS_ASSUME_NONNULL_END
