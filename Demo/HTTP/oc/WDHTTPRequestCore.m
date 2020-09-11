//
//  WDHTTPRequestCore.m
//  MobileManage
//
//  Created by admin2 on 2020/9/10.
//  Copyright © 2020 admin2. All rights reserved.
//

#import "WDHTTPRequestCore.h"

//#import <AFNetworking/>
#import <AFNetworking/AFNetworking.h>

#import <AFNetworking/AFNetworkActivityIndicatorManager.h>
//#import <AFNetworking/AFNetworkActivityIndicatorManager.h>
//#import <AFNetworking/AFNetworkReachabilityManager.h>
//#import <AFNetworking/AFHTTPSessionManager.h>

#import <objc/message.h>


@implementation WDYHFPPSuccModel

+ (instancetype)succModelWithData:(id)data hid:(nullable WDYHFKJHiddenHub)hiddenHubBlock {
    WDYHFPPSuccModel *model = [[self alloc] init];
    model.hiddenHubBlock = hiddenHubBlock;
    model.data = data;
    
    if ([data isKindOfClass:[NSDictionary class]]) {
        model.dicData = data;
    } else if ([data isKindOfClass:[NSArray class]]) {
        model.arrayData = data;
    }
    return model;
}


@end


@interface WDYHFPPFailModel ()


@property (strong, nonatomic, readwrite) NSError *error;
@property (copy, nonatomic, readwrite) WDYHFKJHiddenHub hiddenHubBlock;
@property (assign, nonatomic, readwrite) BOOL isException;
@property (strong, nonatomic, readwrite) id response;
@property (assign, nonatomic, readwrite) BOOL isTimeout;


@end


@implementation WDYHFPPFailModel

+ (instancetype)failModelWithError:(NSError *)error hid:(nullable WDYHFKJHiddenHub)hiddenHubBlock isException:(BOOL)isException response:(id)response {
    WDYHFPPFailModel *model = [[self alloc] init];
    model.error = error;
    model.hiddenHubBlock = hiddenHubBlock;
    model.isException = isException;
    model.response = response;
    return model;
}

- (BOOL)isTimeout {
    if (self.error != nil) {
        if (self.error.code == NSURLErrorTimedOut) {
            return YES;
        }
    }
    return NO;
}


@end

@implementation WDYHFPPExceptionModel

+ (instancetype)exceptionModelWithFailModel:(WDYHFPPFailModel *)failModel fail:(nullable WDYHFKJFailure)failureBlock {
    WDYHFPPExceptionModel *model = [[self alloc] init];
    model.failModel = failModel;
    model.failureBlock = failureBlock;
    return model;
}

@end



@implementation WDHTTPRequestCore


+ (NSURLSessionTask *)kj_after:(NSTimeInterval)timeInterval executeBlock:(CKJCallBackType)callBackType response:(id)responseData Success:(nullable WDYHFKJSuccess)successBlock failure:(nullable WDYHFKJFailure)failureBlock hiddenHubBlock:(nullable WDYHFKJHiddenHub)hiddenHubBlock exceptionBlock:(nullable WDYHFKJException)exceptionBlock  {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(timeInterval * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        switch (callBackType) {
            case CKJCallBackType_Success:{
                WDYHFPPSuccModel *succModel = [WDYHFPPSuccModel succModelWithData:responseData hid:hiddenHubBlock];
                successBlock ? successBlock(succModel) : nil;
            }
                break;
            case CKJCallBackType_Failure: {
                WDYHFPPFailModel *failModel = [WDYHFPPFailModel failModelWithError:nil hid:hiddenHubBlock isException:NO response:responseData];
                failureBlock ? failureBlock(failModel) : nil;
            }
                break;
            case CKJCallBackType_Exception: {
                WDYHFPPFailModel *failModel = [WDYHFPPFailModel failModelWithError:nil hid:hiddenHubBlock isException:YES response:responseData];
                if (exceptionBlock) {
                    exceptionBlock(failModel, failureBlock);
                } else {
                    failureBlock ? failureBlock(failModel) : nil;
                }
            }
                break;
            default:
                break;
        }
    });
    return nil;
}


+ (NSURLSessionTask *)get_requestWithURL:(NSString *)URL parameters:(NSDictionary *)parameter headers:(nullable NSDictionary <NSString *, NSString *> *)headers Success:(nullable WDYHFKJSuccess)successBlock failure:(nullable WDYHFKJFailure)failureBlock hiddenHubBlock:(nullable WDYHFKJHiddenHub)hiddenHubBlock exceptionBlock:(nullable WDYHFKJException)exceptionBlock {
//    NSString *urlStr = [NSString stringWithFormat:@"%@%@", [Global global].base_url, URL];
    NSString *urlStr = @"";
    NSLog(@"发送请求接口 %@ ", urlStr);
    
    NSString *_par = [parameter kjwd_returnJsonString];
    
    return [[self getSessionManager] GET:urlStr parameters:parameter headers:headers progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSString *resjson = [responseObject kjwd_returnJsonString];
        NSLog(@"GET 成功 请求接口 %@ 参数 %@ 返回数据 %@", URL, _par, resjson);
        
        WDYHFPPSuccModel *succModel = [WDYHFPPSuccModel succModelWithData:responseObject hid:hiddenHubBlock];
        
        void (^myBlock)(void) = ^{
            WDYHFPPFailModel *failModel = [WDYHFPPFailModel failModelWithError:nil hid:hiddenHubBlock isException:YES response:succModel.data];
            if (exceptionBlock) {
                exceptionBlock(failModel, failureBlock);
            } else {
                failureBlock ? failureBlock(failModel) : nil;
            }
        };
        
        if ([succModel.data isKindOfClass:[NSDictionary class]] == NO) {
            myBlock();
            return;
        }
        
        NSDictionary *dicData = succModel.dicData;
        
        NSString *result_code = dicData[@"result_code"];
        
        if([WDKJ_ConfirmString(result_code) isEqualToString:@"SUCCESS"] == NO) {
            myBlock();
            NSString *err_code_des = dicData[@"err_code_des"];
            if (WDKJ_IsEmpty_Str(err_code_des)) {
                return;
            }
//            [CKJHUD kjwd_showMessageAutoHide:err_code_des];
            return;
        }
        if (successBlock) {
            WDYHFPPSuccModel *model = [WDYHFPPSuccModel succModelWithData:dicData hid:hiddenHubBlock];
            successBlock(model);
        } else {
            hiddenHubBlock ? hiddenHubBlock() : nil;
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"GET 请求失败 请求接口 %@  参数 %@  错误信息 %@", urlStr, _par, error);
        
        WDYHFPPFailModel *failModel = [WDYHFPPFailModel failModelWithError:error hid:hiddenHubBlock isException:NO response:nil];
        if (failureBlock) {
            failureBlock(failModel);
        } else {
            hiddenHubBlock ? hiddenHubBlock() : nil;
        }
    }];
}

+ (NSURLSessionTask *)post_requestWithURL:(NSString *)URL parameters:(NSDictionary *)parameter headers:(nullable NSDictionary <NSString *, NSString *> *)headers Success:(nullable WDYHFKJSuccess)successBlock failure:(nullable WDYHFKJFailure)failureBlock hiddenHubBlock:(nullable WDYHFKJHiddenHub)hiddenHubBlock exceptionBlock:(nullable WDYHFKJException)exceptionBlock {
//    NSString *urlStr = [NSString stringWithFormat:@"%@%@", [Global global].base_url, URL];
    NSString *urlStr = @"";
    return [[self getSessionManager] GET:urlStr parameters:parameter headers:headers progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        WDYHFPPSuccModel *succModel = [WDYHFPPSuccModel succModelWithData:responseObject hid:hiddenHubBlock];
        
        void (^myBlock)(void) = ^{
            WDYHFPPFailModel *failModel = [WDYHFPPFailModel failModelWithError:nil hid:hiddenHubBlock isException:YES response:succModel.data];
            if (exceptionBlock) {
                exceptionBlock(failModel, failureBlock);
            } else {
                failureBlock ? failureBlock(failModel) : nil;
            }
        };
        
        if ([succModel.data isKindOfClass:[NSDictionary class]] == NO) {
            myBlock();
            return;
        }
        
        NSDictionary *dicData = succModel.dicData;
        
        NSString *result_code = dicData[@"result_code"];
        
        if([WDKJ_ConfirmString(result_code) isEqualToString:@"SUCCESS"] == NO) {
            myBlock();
            NSString *err_code_des = dicData[@"err_code_des"];
            if (WDKJ_IsEmpty_Str(err_code_des)) {
                return;
            }
//            [CKJHUD kjwd_showMessageAutoHide:err_code_des];
            return;
        }
        if (successBlock) {
            WDYHFPPSuccModel *model = [WDYHFPPSuccModel succModelWithData:dicData hid:hiddenHubBlock];
            successBlock(model);
        } else {
            hiddenHubBlock ? hiddenHubBlock() : nil;
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        WDYHFPPFailModel *failModel = [WDYHFPPFailModel failModelWithError:error hid:hiddenHubBlock isException:NO response:nil];
        if (failureBlock) {
            failureBlock(failModel);
        } else {
            hiddenHubBlock ? hiddenHubBlock() : nil;
        }
    }];
}

+ (AFSecurityPolicy *)securityPolicy {
    NSString *certFilePath1 = [[NSBundle mainBundle] pathForResource:@"wd" ofType:@"cer"];
    NSData *certData1 = [NSData dataWithContentsOfFile:certFilePath1];
    
    NSSet *certSet = [NSSet setWithArray:@[certData1]];
    AFSecurityPolicy *policy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeCertificate withPinnedCertificates:certSet];
    policy.allowInvalidCertificates = YES;
    policy.validatesDomainName = NO;
    
    return policy;
}

+ (AFHTTPSessionManager *)getSessionManager {

//    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:[Global global].base_url]];
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:@""]];

    manager.securityPolicy = [self securityPolicy];
    // 请求
    AFJSONRequestSerializer *request = [AFJSONRequestSerializer serializer];
    request.timeoutInterval = 60;
    manager.requestSerializer = request;
    
    // 响应
    AFJSONResponseSerializer *response = [AFJSONResponseSerializer serializer];
    manager.responseSerializer = response;
    
    return manager;
}




@end
