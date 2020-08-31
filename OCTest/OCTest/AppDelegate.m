//
//  AppDelegate.m
//  OCTest
//
//  Created by admin2 on 2020/6/9.
//  Copyright © 2020 admin2. All rights reserved.
//证书

#import "AppDelegate.h"
#import <UserNotifications/UserNotifications.h>
#import "NSObject+WDYHFCategory.h"
#import <WebKit/WebKit.h>

@interface AppDelegate ()


@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
//    NSNotificationCenter
    
    
//    WKWebView *ss;
////    [[WKWebView alloc] ini];
//    ss.configuration
//
////    [ss evaluateJavaScript:<#(nonnull NSString *)#> completionHandler:<#^(id _Nullable, NSError * _Nullable error)completionHandler#>]
//
//    NSString *path = [[NSBundle mainBundle] pathForResource:@"舟山yd0001" ofType:@"txt"];
//
//    NSError *error = nil;
//
//    NSString *str = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:&error];
//
//    if (error) {
//        NSLog(@"错误%@   ", error);
//    }
//
    
    
//    
//    NSArray *res = [str kjwd_general_searchWithReg:@"(\\d+)(?=分钟)" options:NSRegularExpressionCaseInsensitive];
//    
//    //    res = [res ma];
//    
//    //    res kj
//    
//    //    NSMutableArray *result = [NSMutableArray array];
//    __block NSInteger ll = 0;
//    [res enumerateObjectsUsingBlock:^(NSString  *_Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
//        ll += obj.intValue;
//    }];
//    
//    NSLog(@"%d   ", ll);
    //    NSLog(@"%@   ", [res valueForKeyPath:@"@sum"]);
    
    //    [res enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
    //
    //           NSLog(@"%@   ", obj);
    //
    //    }];
    
    
    
    
    //
    
    
    //    [[str kjwd_searchWithRegularExpression:@"\(.*分钟)" options:NSRegularExpressionCaseInsensitive] enumerateObjectsUsingBlock:^(NSTextCheckingResult * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
    //        NSLog(@"%@   ", obj);
    //    }];
    
    //    str kjwd_group_searchWithReg:@"" options:(NSRegularExpressionOptions)
    
    //    NSLog(@"%@   ", str);
    
    
    return YES;
}




//- (void)webView:(WKWebView *)webView didReceiveAuthenticationChallenge:(NSURLAuthenticationChallenge *)challenge completionHandler:(void (^)(NSURLSessionAuthChallengeDisposition disposition, NSURLCredential * _Nullable credential))completionHandler
//
//此方法当web视图需要响应身份验证挑战时进行调用，
//
//其中NSURLSessionAuthChallengeDisposition四个类型如下：
//
//NSURLSessionAuthChallengeUseCredential = 0,                                      /* 使用指定的凭据，可能为零 */
//
//NSURLSessionAuthChallengePerformDefaultHandling = 1,                              /* 挑战的默认处理-如果未执行此委托，则忽略凭据参数.。 */
//
//NSURLSessionAuthChallengeCancelAuthenticationChallenge = 2,                      /* 整个请求将被取消，凭据参数将被忽略.。*/
//
//NSURLSessionAuthChallengeRejectProtectionSpace = 3,                              /* 此挑战被拒绝，并应尝试下一个身份验证保护空间，凭据参数被忽略。*/
//
//}


//    无窗版
//
//    NSString *authenticationMethod = [[challenge protectionSpace] authenticationMethod];
//
//    if ([authenticationMethod isEqualToString:NSURLAuthenticationMethodServerTrust]) {
//
//               NSURLCredential *credential = [[NSURLCredential     alloc]initWithTrust:challenge.protectionSpace.serverTrust];
//
//                completionHandler(NSURLSessionAuthChallengeUseCredential,credential);
//
//    }
//
//    作者：vicool
//链接：https://www.jianshu.com/p/a6b5d042977d
//    来源：简书
//    著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。


@end

