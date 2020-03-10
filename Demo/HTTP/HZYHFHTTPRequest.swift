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




class WDYHFPPSuccModel {

    var hiddenHubBlock: HZYHFHiddenHub?
    var data: AnyObject?
    var dicData: [String : AnyObject]?
    var arrayData: [AnyObject]?

    init(data: AnyObject, hid: @escaping HZYHFHiddenHub) {
        self.data = data
        self.hiddenHubBlock = hid
        if data is Dictionary<String, AnyObject> {
            self.dicData = data as? [String : AnyObject]
        } else if data is Array<AnyObject> {
            self.arrayData = data as? [AnyObject]
        }
    }
}

class WDYHFPPFailModel {
    init(error: NSError?, hid: @escaping HZYHFHiddenHub, isException: Bool, response: AnyObject) {
        
    }
}

typealias WDYHFKJFailure = (WDYHFPPFailModel) -> ()

class WDYHFPPExceptionModel {
    init(failModel: WDYHFPPFailModel, failBlock: HZYHFHiddenHub) {
        
    }
}


typealias WDYHFKJSuccess = (WDYHFPPSuccModel) -> ()

typealias HZYHFException = (WDYHFPPFailModel, WDYHFKJFailure) -> ()



class HZYHFHTTPRequest {
    
    static func kj_after(timeInterval: TimeInterval, callBackType: CKJCallBackType, response: AnyObject?, success: @escaping WDYHFKJSuccess, failure: @escaping WDYHFKJFailure, exception: HZYHFException?, hiddenHubBlock: @escaping HZYHFHiddenHub) {
        let res = response ?? [String : AnyObject]() as AnyObject
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + timeInterval) {
            switch callBackType {
            case .Success:
                success(WDYHFPPSuccModel(data: res, hid: hiddenHubBlock))
            case .Failure:
                failure(WDYHFPPFailModel(error: nil, hid: hiddenHubBlock, isException: false, response: res))
            case .Exception:
                let failModel = WDYHFPPFailModel(error: nil, hid: hiddenHubBlock, isException: true, response: res)
                exception?(failModel, failure) ?? failure(failModel)
            }
        }
    }

    
//    static func post_request(url: String, prefix: String, parameters: [String : Any], success: @escaping WDYHFKJSuccess, failure: @escaping HZYHFHiddenHub, hiddenHub: @escaping HZYHFHiddenHub, exception: HZYHFException?) {
//
//
//        var headers = [String : String]()
//        headers["Content-Type"] = "application/json"
//
//        Alamofire.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: headers).responseJSON { (response: DataResponse<Any>) in
//
//            DispatchQueue.main.async {
//
//                let myBlock = {
//                    if (exception != nil) {
//                        exception!(response, hiddenHub, failure)
//                    } else {
//                        failure(nil, hiddenHub, true, response)
//                    }
//                }
//
//                if response.value is NSNull {
//                    myBlock()
//                    return
//                }
//
//
//            }
//
//
//
//
//            debugPrint(parameters)
//
//            let dic = parameters as NSDictionary
//
//
//            print("接口 \(url)  参数 \(dic)")
//            print("response.data是   \(response.data)")
//            print("response.result是   \(response.result)")
//            print("response.value是   \(response.value)")
//            print("response.error是   \(response.error)")
//
//
//
//            if response.result.isSuccess {
//
//            }
//        }
//    }
}


