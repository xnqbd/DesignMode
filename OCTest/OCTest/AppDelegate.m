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

#import <JavaScriptCore/JavaScriptCore.h>




@protocol IOSPersonJSProtocol <JSExport>
// JSExport是一个协议，Native中遵守此解析的类可以将方法和属性转换为JS的接口供JS调用。
// 首先自定义个协议继承自JSExprot，并定义需要暴露给js的属性和方法

- (NSString *)export_name;

@end

@interface IOSPerson : NSObject<IOSPersonJSProtocol>




@property (copy, nonatomic) NSString *name;
@property (assign, nonatomic) CGFloat height;

- (void)p_run;

@end


@implementation IOSPerson

- (NSString *)export_name {
    return self.name;
}

- (void)p_run {
    NSLog(@"%@  run ", self.name);
}

@end




@interface AppDelegate ()


@end

@implementation AppDelegate



- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    /*
     
     注意，在这里，一个js文件里import、require、export这些关键字，都是不能被识别的，
     alert函数不能被识别，可以在原生里注册一下这个函数， ctx[@"alert"] = ^(NSString *ss){ NSLog(@"%@   ", ss); };

     
                 
     
     */
    
//    {
//
////        JSVirtualMachine *vm = [[JSVirtualMachine alloc] init];
//        JSContext *ctx = [[JSContext alloc] init];
//        ctx.exceptionHandler = ^(JSContext *context, JSValue *exception) {
//            NSLog(@"出现异常，异常信息：%@", exception);
//        };
//        
//        ctx[@"alert"] = ^(NSString *ss){
//            NSLog(@"%@   ", ss);
//        };
//        
//        NSString *filePath = [[NSBundle mainBundle] pathForResource:@"demo11" ofType:@"js"];
//        NSString *script = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
//        [ctx evaluateScript:script];   
//    }
    
    
//    // 在 iOS 里面执行 JS
//    JSContext *jsContext = [[JSContext alloc] init];
//    [jsContext evaluateScript:@"var num = 500"];
//    [jsContext evaluateScript:@"var computePrice = function(value){ return value * 2 }"];
//    JSValue *value = [jsContext evaluateScript:@"computePrice(num)"];
//    int  intVal = [value  toInt32];
//    NSLog(@"计算结果为 %d", intVal); // 打印出 计算结果为 1000
    
    
//    {
//        JSContext *ctx = [[JSContext alloc] init];
//        ctx[@"jsCallNative"] = ^{
//            NSArray *args = [JSContext currentArguments];
//            for (JSValue *v in args) {
//                NSLog(@"参数是 %@", v);
//            }
////            打印出
////            2020-09-10 09:38:42.366040+0800 OCTest[6042:3766264] 参数是 Hello iOS
////            2020-09-10 09:38:42.366127+0800 OCTest[6042:3766264] 参数是 I am JS
//        };
//        [ctx evaluateScript:@"jsCallNative('Hello iOS', 'I am JS');"];
//    }
//    {
//        JSContext *ctx = [[JSContext alloc] init];
//        ctx[@"log"] = ^{
//            NSArray *currentParamers = [JSContext currentArguments];
//            JSValue *currentThis = [JSContext currentThis];
//            JSValue *currentCallee = [JSContext currentCallee];
//
//            NSLog(@"currentThis: %@    currentCallee  %@    currentParamers %@ ", currentThis, currentCallee, currentParamers);
//            for (JSValue *v in currentParamers) {
//                NSLog(@"参数是 %@", v);
//            }
//        };
//        IOSPerson *per = [[IOSPerson alloc] init];
//        per.name = @"张三";
//        per.height = 170;
//        ctx[@"p"] = per;
//        [ctx evaluateScript:@"log(p.export_name())"]; // 不要log(p.name） 没有暴露的，是访问不到的
//    }
    

//        {
//            JSVirtualMachine *vm = [[JSVirtualMachine alloc] init];
//            JSContext *ctx = [[JSContext alloc] initWithVirtualMachine:vm];
//            ctx.exceptionHandler = ^(JSContext *context, JSValue *exception) {
//                NSLog(@"出现异常，异常信息：%@", exception);
//            };
//
//            ctx[@"alert"] = ^(NSString *ss){
//                NSLog(@"%@   ", ss);
//            };
//
//            NSString *filePath = [[NSBundle mainBundle] pathForResource:@"demo10" ofType:@"js"];
//            NSString *script = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
//            [ctx evaluateScript:script];
//
//
//
//            NSLog(@"%@   ", ctx[@"en"]);
//        }
    
//    {
//        JSVirtualMachine *vm = [[JSVirtualMachine alloc] init];
//        JSContext *ctx = [[JSContext alloc] initWithVirtualMachine:vm];
//        ctx.exceptionHandler = ^(JSContext *context, JSValue *exception) {
//            NSLog(@"出现异常，异常信息：%@", exception);
//        };
//
//        NSString *filePath = [[NSBundle mainBundle] pathForResource:@"encrypt" ofType:@"js"];
//        NSString *script = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
//        [ctx evaluateScript:script];
//
////        @"380c32a962290f63"
//
////        Data: Encrypt.aesEncrypt(params, secretKey),
//
//
//        NSDictionary *dd = @{
//            @"AppId": @"600100",
//            @"AppUId": @"oq8KwuI3gmrUTFYooG92WlHBlzS4"
//        };
//
//
//        NSLog(@"%@   ", [ctx[@"aesDecrypt"] callWithArguments:@[dd, @"380c32a962290f63"]]);
//
////        NSLog(@"%@   ", ctx[@"aa"]);
////        NSLog(@"%@   ", [ctx[@"uuid"] callWithArguments:@[]]);
////        NSLog(@"%@   ", ctx[@"uuid"]);
//
//    }
    
    
    
    
    
    

//    {
//        // js 调用原生
//        JSVirtualMachine *vm = [[JSVirtualMachine alloc] init];
//        JSContext *ctx2 = [[JSContext alloc] initWithVirtualMachine:vm];
//        ctx2[@"nativeBlock"] = ^(int a){
//          NSLog(@"调用原生block  %d   ", a);
//        };
//        NSString *filePath = [[NSBundle mainBundle] pathForResource:@"demo2" ofType:@"js"];
//        NSString *script = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
//
//        [ctx2 evaluateScript:script];
//    }
    

//    JSVirtualMachine *vm = [[JSVirtualMachine alloc] init];
//
//    JSContext *ctx = [[JSContext alloc] initWithVirtualMachine:vm];
//    ctx.exceptionHandler = ^(JSContext *context, JSValue *exception) {
//        NSLog(@"出现异常，异常信息：%@", exception);
//    };
//
//
//    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"demo1" ofType:@"js"];
//    NSString *script = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
//
//    [ctx evaluateScript:script];
//
//    // 访问js对象， 要特别注意，js里如果设置的变量是let和const，在这里访问不到，一定要是var
//    NSLog(@"[] %@", ctx[@"a"]);
//    NSLog(@"objectForKeyedSubscript %@", [ctx objectForKeyedSubscript:@"a"]);
//    NSLog(@"globalObject %@", [ctx.globalObject objectForKeyedSubscript:@"a"]);
//
//
//
//     // 给js 变量赋值
//    ctx[@"a"] = [JSValue valueWithInt32:90 inContext:ctx];
//    [ctx              setObject:[JSValue valueWithInt32:90 inContext:ctx] forKeyedSubscript:@"a"];
//    [ctx.globalObject setObject:[JSValue valueWithInt32:90 inContext:ctx] forKeyedSubscript:@"a"];
//
//    // 调用 js 方法
//    NSLog(@"%@   ", [ctx[@"aes"] callWithArguments:@[]]);
//
//
//
//    JSValue *b = ctx[@"b"];
//    NSLog(@"%@", [b toDictionary]);
//
//
//
//    JSContext *ctx2 = [[JSContext alloc] init];
//    ctx2[@"Person2"] = [IOSPerson class];
//
    
    
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

