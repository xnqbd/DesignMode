//
//  WDHTTPRequestCore.h
//  MobileManage
//
//  Created by admin2 on 2020/9/10.
//  Copyright © 2020 admin2. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/**
 测试回调类型
 */
typedef NS_ENUM(NSInteger, CKJCallBackType) {
    CKJCallBackType_Success = 0,
    CKJCallBackType_Failure = 1,
    CKJCallBackType_Exception = 2
};




typedef void(^WDYHFKJHiddenHub)(void);



@interface WDYHFPPSuccModel : NSObject
@property (copy, nonatomic, nullable) WDYHFKJHiddenHub hiddenHubBlock;

@property (strong, nonatomic, nullable) id data;
@property (strong, nonatomic, nullable) NSDictionary *dicData;
@property (strong, nonatomic, nullable) NSArray *arrayData;


+ (instancetype)succModelWithData:(nullable id)data hid:(nullable WDYHFKJHiddenHub)hiddenHubBlock;


@end



@interface WDYHFPPFailModel : NSObject
@property (strong, nonatomic, readonly, nullable) NSError *error;
@property (copy, nonatomic, readonly, nullable) WDYHFKJHiddenHub hiddenHubBlock;
@property (assign, nonatomic, readonly) BOOL isException;
@property (strong, nonatomic, readonly, nullable) id response;
@property (assign, nonatomic, readonly) BOOL isTimeout;


+ (instancetype)failModelWithError:(nullable NSError *)error hid:(nullable WDYHFKJHiddenHub)hiddenHubBlock isException:(BOOL)isException response:(nullable id)response;

@end


typedef void(^WDYHFKJFailure)(WDYHFPPFailModel *failModel);





@interface WDYHFPPExceptionModel : NSObject

@property (strong, nonatomic) WDYHFPPFailModel *failModel;
@property (copy, nonatomic) WDYHFKJFailure failureBlock;

+ (instancetype)exceptionModelWithFailModel:(WDYHFPPFailModel *)failModel fail:(nullable WDYHFKJFailure)failureBlock;

@end







typedef void(^WDYHFKJSuccess)(WDYHFPPSuccModel *succModel);
typedef void(^WDYHFKJException)(WDYHFPPFailModel *failModel, WDYHFKJFailure failureBlock);




@interface WDHTTPRequestCore : NSObject



+ (NSURLSessionTask *)kj_after:(NSTimeInterval)timeInterval executeBlock:(CKJCallBackType)callBackType response:(id)responseData Success:(nullable WDYHFKJSuccess)successBlock failure:(nullable WDYHFKJFailure)failureBlock hiddenHubBlock:(nullable WDYHFKJHiddenHub)hiddenHubBlock exceptionBlock:(nullable WDYHFKJException)exceptionBlock;



+ (NSURLSessionTask *)get_requestWithURL:(NSString *)URL parameters:(NSDictionary *)parameter headers:(nullable NSDictionary <NSString *, NSString *> *)headers Success:(nullable WDYHFKJSuccess)successBlock failure:(nullable WDYHFKJFailure)failureBlock hiddenHubBlock:(nullable WDYHFKJHiddenHub)hiddenHubBlock exceptionBlock:(nullable WDYHFKJException)exceptionBlock;
+ (NSURLSessionTask *)post_requestWithURL:(NSString *)URL parameters:(NSDictionary *)parameter headers:(nullable NSDictionary <NSString *, NSString *> *)headers Success:(nullable WDYHFKJSuccess)successBlock failure:(nullable WDYHFKJFailure)failureBlock hiddenHubBlock:(nullable WDYHFKJHiddenHub)hiddenHubBlock exceptionBlock:(nullable WDYHFKJException)exceptionBlock;


@end

NS_ASSUME_NONNULL_END
