//
//  WebVC.swift
//  Demo
//
//  Created by admin2 on 2020/6/1.
//  Copyright © 2020 admin2. All rights reserved.
//

import UIKit
import WebKit
import SnapKit

class WebVC: UIViewController {
    
    var webV: WKWebView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let webV = DMWebView()
        
        let url = URL(string: "http://192.168.0.107:5500/TTTT.html")
        
        let req = URLRequest(url: url!, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        
        webV.uiDelegate = self
        webV.navigationDelegate = self
        
        webV.load(req)
        view.addSubview(webV)
        webV.snp.makeConstraints { (make) in
            make.edges.equalTo(self.view).inset(UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0))
        }
        
        self.webV = webV
        
        
        let btn = UIButton(type: .system)
        
        btn.setTitle("按钮", for: .normal)
        view.addSubview(btn)
        btn.kjwd_addTouchUpInside { [weak self](b) in
            let ele = "localStorage.getItem('ckjname')"
            self?.webV.evaluateJavaScript(ele, completionHandler: { (obj, err) in
                print("执行js后得到的数据 ", obj ?? "", err)
            })
        }
        btn.snp.makeConstraints { (make) in
            make.center.equalTo(self.view)
        }
    }
}

extension WebVC: WKUIDelegate {
    @available(iOS 8.0, *)
    
    // 创建新的webView时调用的方法   页面是弹出窗口 _blank 处理
    //    func webView(_ webView: WKWebView, createWebViewWith configuration: WKWebViewConfiguration, for navigationAction: WKNavigationAction, windowFeatures: WKWindowFeatures) -> WKWebView? {
    //    }
    
    @available(iOS 9.0, *)
    func webViewDidClose(_ webView: WKWebView) {
        print("关闭webView")
    }
    
    
    // web界面中有弹出警告框时调用
    @available(iOS 8.0, *)
    func webView(_ webView: WKWebView, runJavaScriptAlertPanelWithMessage message: String, initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping () -> Void) {
        print("web界面中有弹出警告框")
        let alert = UIAlertController(title: "提示", message: message, preferredStyle: .alert)
        self.present(alert, animated: true, completion: nil)
    }
    
    
    // 确认框
    @available(iOS 8.0, *)
    func webView(_ webView: WKWebView, runJavaScriptConfirmPanelWithMessage message: String, initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping (Bool) -> Void) {
        let alert = UIAlertController(title: "提示", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "取消", style: .cancel, handler: { (a) in
            completionHandler(false)
        }))
        alert.addAction(UIAlertAction(title: "确定", style: .cancel, handler: { (a) in
            completionHandler(true)
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    
    @available(iOS 8.0, *)
    func webView(_ webView: WKWebView, runJavaScriptTextInputPanelWithPrompt prompt: String, defaultText: String?, initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping (String?) -> Void) {
        let alert = UIAlertController(title: prompt, message: "", preferredStyle: .alert)
        alert.addTextField { (tf) in
            tf.text = defaultText
        }
        alert.addAction(UIAlertAction(title: "确定", style: .cancel, handler: { [weak alert] (a) in
            completionHandler(alert!.textFields![0].text);
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    // 默认预览元素调用
    //    @available(iOS, introduced: 10.0, deprecated: 13.0)
    //    func webView(_ webView: WKWebView, shouldPreviewElement elementInfo: WKPreviewElementInfo) -> Bool {
    //        return true
    //    }
    //
    //
    //    @available(iOS, introduced: 10.0, deprecated: 13.0)
    //    func webView(_ webView: WKWebView, previewingViewControllerForElement elementInfo: WKPreviewElementInfo, defaultActions previewActions: [WKPreviewActionItem]) -> UIViewController? {
    //
    //    }
    //
    //    @available(iOS, introduced: 10.0, deprecated: 13.0)
    //    func webView(_ webView: WKWebView, commitPreviewingViewController previewingViewController: UIViewController) {
    //
    //    }
    
}

extension WebVC: WKNavigationDelegate {
    
    // 在发送请求之前，决定是否跳转（根据WebView对于即将跳转的HTTP请求头信息和相关信息来决定是否跳转）
    @available(iOS 8.0, *)
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        guard let urlStr = navigationAction.request.url?.absoluteString.removingPercentEncoding else {
            decisionHandler(.allow)
            return
        }
        print("在发送请求之前，决定是否跳转 ------ 当前跳转地址：", urlStr)
        decisionHandler(.allow)
    }
    
    // 根据客户端受到的服务器响应头以及response相关信息来决定是否可以跳转
    @available(iOS 8.0, *)
    func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
        guard let urlStr = navigationResponse.response.url?.absoluteString.removingPercentEncoding else {
            decisionHandler(.allow)
            return
        }
        print("收到响应response后 决定是否允许跳转 ------ 当前跳转地址：", urlStr)
        decisionHandler(.allow)
    }
    
    // 页面开始加载时调用 和 UIWebView里  webView:shouldStartLoadWithRequest:navigationType
    @available(iOS 8.0, *)
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        print("页面开始加载---Start Load")
    }
    
    
    // 接收到服务器跳转请求即服务重定向时之后调用
//    @available(iOS 8.0, *)
//    func webView(_ webView: WKWebView, didReceiveServerRedirectForProvisionalNavigation navigation: WKNavigation!) {
//    }
    
    
    // 页面加载失败时调用  和 UIWebView里 - (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error 差不多
    @available(iOS 8.0, *)
    func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
        print("页面加载失败---Load Fail ", error);
    }
    
    /// 当内容开始返回时调用
    @available(iOS 8.0, *)
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        print("开始返回内容")
    }
    
    /// 页面加载完成之后调用
    @available(iOS 8.0, *)
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        print("页面加载完成")
    }
    
    /// 提交发生错误时调用
//    @available(iOS 8.0, *)
//    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
//    }
    
    
    /// 需要响应身份验证时调用 同样在block中需要传入用户身份凭证
//    @available(iOS 8.0, *)
//    func webView(_ webView: WKWebView, didReceive challenge: URLAuthenticationChallenge, completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Void) {
//    }
    
    /// 进程被终止时调用
//    @available(iOS 9.0, *)
//    func webViewWebContentProcessDidTerminate(_ webView: WKWebView) {
//    }
    
    
//    @available(iOS 13.0, *)
//    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, preferences: WKWebpagePreferences, decisionHandler: @escaping (WKNavigationActionPolicy, WKWebpagePreferences) -> Void) {
//    }
//
}
