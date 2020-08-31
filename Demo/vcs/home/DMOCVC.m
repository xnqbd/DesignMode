//
//  DMOCVC.m
//  Demo
//
//  Created by admin2 on 2020/1/21.
//  Copyright © 2020 admin2. All rights reserved.
//

#import "DMOCVC.h"
#import <LocalAuthentication/LocalAuthentication.h>
#import <WebKit/WebKit.h>
#import <JavaScriptCore/JavaScriptCore.h>

@interface DMOCVC () <WKUIDelegate, WKNavigationDelegate>

@property (strong, nonatomic) WKWebView *webView;

@end

@implementation DMOCVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.webView = [[WKWebView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.webView.UIDelegate = self;
    self.webView.navigationDelegate = self;
    [self.view addSubview:self.webView];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL kjwd_URLWithString:@"http://192.168.0.107:5500/TTTT.html"] cachePolicy:NSURLRequestReloadIgnoringLocalCacheData timeoutInterval:60];
    NSLog(@"%@   ", @"_webView loadRequest");
    [self.webView loadRequest:request];
}

#pragma mark - WKNavigationDelegate



/// 在发送请求之前，决定是否跳转（根据WebView对于即将跳转的HTTP请求头信息和相关信息来决定是否跳转）
- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler {
    
        // 允许跳转
        decisionHandler(WKNavigationActionPolicyAllow);
    
}



// 这个可能会崩溃，可以先注释掉
//- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction preferences:(WKWebpagePreferences *)preferences decisionHandler:(void (^)(WKNavigationActionPolicy, WKWebpagePreferences *))decisionHandler  {
//}

/// 根据客户端受到的服务器响应头以及response相关信息来决定是否可以跳转
- (void)webView:(WKWebView *)webView decidePolicyForNavigationResponse:(WKNavigationResponse *)navigationResponse decisionHandler:(void (^)(WKNavigationResponsePolicy))decisionHandler {
    
    NSString *urlStr = [navigationResponse.response.URL.absoluteString stringByRemovingPercentEncoding];
    
    NSLog(@"收到响应response后 决定是否允许跳转 ------ 当前跳转地址：%@",urlStr);
    //允许跳转
    decisionHandler(WKNavigationResponsePolicyAllow);
    //不允许跳转
    //decisionHandler(WKNavigationResponsePolicyCancel);
}

/// 页面开始加载时调用 和 UIWebView里  webView:shouldStartLoadWithRequest:navigationType
- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(null_unspecified WKNavigation *)navigation {
    NSLog(@"页面开始加载---Start Load");
}

///// 接收到服务器跳转请求即服务重定向时之后调用
//- (void)webView:(WKWebView *)webView didReceiveServerRedirectForProvisionalNavigation:(null_unspecified WKNavigation *)navigation {
//
//}



/// 页面加载失败时调用  和 UIWebView里 - (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error 差不多
- (void)webView:(WKWebView *)webView didFailProvisionalNavigation:(null_unspecified WKNavigation *)navigation withError:(NSError *)error {
    NSLog(@"页面加载失败---Load Fail  %@", error);
}

/// 当内容开始返回时调用
- (void)webView:(WKWebView *)webView didCommitNavigation:(null_unspecified WKNavigation *)navigation {
    NSLog(@"开始返回内容");
}

/// 页面加载完成之后调用
- (void)webView:(WKWebView *)webView didFinishNavigation:(null_unspecified WKNavigation *)navigation {
    NSLog(@"页面加载完成");
    
    JSContext *context = [webView valueForKeyPath:@"documentView.webView.mainFrame.javaScriptContext"];

    context[@"passValue"] = ^{

        NSArray *arg = [JSContext currentArguments];
        for (id obj in arg) {
            NSLog(@"%@", obj);
        }
    };
}

/// 提交发生错误时调用
- (void)webView:(WKWebView *)webView didFailNavigation:(null_unspecified WKNavigation *)navigation withError:(NSError *)error {
    
}

/// 需要响应身份验证时调用 同样在block中需要传入用户身份凭证
//- (void)webView:(WKWebView *)webView didReceiveAuthenticationChallenge:(NSURLAuthenticationChallenge *)challenge completionHandler:(void (^)(NSURLSessionAuthChallengeDisposition disposition, NSURLCredential * _Nullable credential))completionHandler {
//
//    {   //如果出现 The certificate for this server is invalid. You might be connecting to a
//        NSURLSessionAuthChallengeDisposition disposition = NSURLSessionAuthChallengePerformDefaultHandling;
//        __block NSURLCredential *credential = nil;
//
//        if ([challenge.protectionSpace.authenticationMethod isEqualToString:NSURLAuthenticationMethodServerTrust]) {
//            credential = [NSURLCredential credentialForTrust:challenge.protectionSpace.serverTrust];
//            if (credential) {
//                disposition = NSURLSessionAuthChallengeUseCredential;
//            } else {
//                disposition = NSURLSessionAuthChallengePerformDefaultHandling;
//            }
//        } else {
//            disposition = NSURLSessionAuthChallengePerformDefaultHandling;
//        }
//
//        if (completionHandler) {
//            completionHandler(disposition, credential);
//        }
//    }
//
//
//}

/// 进程被终止时调用
- (void)webViewWebContentProcessDidTerminate:(WKWebView *)webView  {
    
}


#pragma mark - WKUIDelegate 主要处理JS脚本，确认框，警告框等


/// 创建新的webView时调用的方法   页面是弹出窗口 _blank 处理
- (nullable WKWebView *)webView:(WKWebView *)webView createWebViewWithConfiguration:(WKWebViewConfiguration *)configuration forNavigationAction:(WKNavigationAction *)navigationAction windowFeatures:(WKWindowFeatures *)windowFeatures {
//    NSLog(@"创建新的webView时调用的方法");
//    return webView;
    if (!navigationAction.targetFrame.isMainFrame) {
        [webView loadRequest:navigationAction.request];
    }
    return nil;
}


/// 关闭webView时调用
- (void)webViewDidClose:(WKWebView *)webView {
    NSLog(@"关闭webView");
}

/// web界面中有弹出警告框时调用
/// @param message 警告框中的内容
/// @param completionHandler 警告框消失调用
- (void)webView:(WKWebView *)webView runJavaScriptAlertPanelWithMessage:(NSString *)message initiatedByFrame:(WKFrameInfo *)frame completionHandler:(void (^)(void))completionHandler {
    
    NSLog(@"web界面中有弹出警告框");
    
//    {
//        completionHandler();
//    }
    
    {
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"提示" message:message?:@"" preferredStyle:UIAlertControllerStyleAlert];
        [alertController addAction:([UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            completionHandler();
        }])];
        [self presentViewController:alertController animated:YES completion:nil];
    }
}

/// 确认框     js调用confirm方法后回调的方法 confirm是js中的确定框，需要在block中把用户选择的情况传递进去
- (void)webView:(WKWebView *)webView runJavaScriptConfirmPanelWithMessage:(NSString *)message initiatedByFrame:(WKFrameInfo *)frame completionHandler:(void (^)(BOOL result))completionHandler {
    
//    {
//        completionHandler(YES);
//    }
    
    {
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"" message:message?:@"" preferredStyle:UIAlertControllerStyleAlert];
        [alertController addAction:([UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            completionHandler(NO);
        }])];
        [alertController addAction:([UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            completionHandler(YES);
        }])];
        [self presentViewController:alertController animated:YES completion:nil];
    }
}

/// 输入框     js调用prompt方法后回调的方法 prompt是js中的输入框 需要在block中把用户输入的信息传入
- (void)webView:(WKWebView *)webView runJavaScriptTextInputPanelWithPrompt:(NSString *)prompt defaultText:(nullable NSString *)defaultText initiatedByFrame:(WKFrameInfo *)frame completionHandler:(void (^)(NSString * _Nullable result))completionHandler {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:prompt message:@"" preferredStyle:UIAlertControllerStyleAlert];
    
    __weak UIAlertController *weakAlert = alertController;
    
    [alertController addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.text = defaultText;
    }];
    [alertController addAction:([UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        completionHandler(weakAlert.textFields[0].text?:@"");
    }])];
    [self presentViewController:alertController animated:YES completion:nil];
}


/// 默认预览元素调用
- (BOOL)webView:(WKWebView *)webView shouldPreviewElement:(WKPreviewElementInfo *)elementInfo API_DEPRECATED_WITH_REPLACEMENT("webView:contextMenuConfigurationForElement:completionHandler:", ios(10.0, 13.0)) {
    NSLog(@"-----默认预览元素调用");
    return YES;
}
@end
