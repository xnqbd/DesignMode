//
//  HZYHFHTTPRequest.swift
//  HZYHF
//
//  Created by chenkaijie on 2018/10/24.
//  Copyright © 2018年 chenkaijie. All rights reserved.
//

import UIKit
import SwifterSwift
import SwiftyJSON
import Alamofire

enum CKJCallBackType {
    case Success, Failure, Exception
}


typealias HZYHFHiddenHub = () -> ()

typealias HZYHFSuccess = ([String : Any], HZYHFHiddenHub) -> ()

typealias HZYHFFailure = (Error?, HZYHFHiddenHub, _  isException: Bool, _ response: Any) -> ()
typealias HZYHFException = (Any, HZYHFHiddenHub, HZYHFFailure) -> ()








class HZYHFHTTPRequest {
    
//    static func kj_after(timeInterval: TimeInterval, callBackType: CKJCallBackType, response: Any, success: HZYHFSuccess, failure: HZYHFFailure, exception: HZYHFException) {
//        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + timeInterval) {
//            switch callBackType {
//            case Success:
//                WDYHFPPSuccModel
//            case Failure:
//            case Exception:
//            }
//        }
//        
//    }
    //    + (NSURLSessionTask *)kj_after:(NSTimeInterval)timeInterval executeBlock:(CKJCallBackType)callBackType response:(id)responseData Success:(WDYHFKJSuccess)successBlock failure:(WDYHFKJFailure)failureBlock hiddenHubBlock:(WDYHFKJHiddenHub)hiddenHubBlock exceptionBlock:(WDYHFKJException)exceptionBlock;
    
    static func post_request(url: String, prefix: String, parameters: [String : Any], success: @escaping HZYHFSuccess, failure: @escaping HZYHFFailure, hiddenHub: @escaping HZYHFHiddenHub, exception: HZYHFException?) {
        
        
        var headers = [String : String]()
        headers["Content-Type"] = "application/json"
        
        Alamofire.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: headers).responseJSON { (response: DataResponse<Any>) in
            
            DispatchQueue.main.async {
                
                let myBlock = {
                    if (exception != nil) {
                        exception!(response, hiddenHub, failure)
                    } else {
                        failure(nil, hiddenHub, true, response)
                    }
                }
                
                if response.value is NSNull {
                    myBlock()
                    return
                }
                                
                
            }
            
            
            
            
            debugPrint(parameters)
            
            let dic = parameters as NSDictionary
            
            
            print("接口 \(url)  参数 \(dic)")
            print("response.data是   \(response.data)")
            print("response.result是   \(response.result)")
            print("response.value是   \(response.value)")
            print("response.error是   \(response.error)")
            
            
            
            if response.result.isSuccess {
                
            }
        }
    }
}


