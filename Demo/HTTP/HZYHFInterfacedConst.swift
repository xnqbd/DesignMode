//
//  HZYHFInterfacedConst.swift
//  HZYHF
//
//  Created by chenkaijie on 2018/10/11.
//  Copyright © 2018年 chenkaijie. All rights reserved.
//

import UIKit


@objcMembers class HZYHFInterfacedConst : NSObject {
    
    
    static let KWDYHF_KEY = "71F62B4CA43810A3E055000000000001";
    
    
    /** 机构编码 */
    static let KWDYHF_JiGouCode = "jkhzsdk";
    /** 机构名称 */
    static let KWDYHF_JiGouName = "机构名称";
    
    
    //#if DevelopSever
    ///** 接口前缀-开发服务器*/
    //static let kApiPrefix = "接口服务器的请求前缀 例: http://192.168.10.10:8080";
    //#elif TestSever
    /** 接口前缀-测试服务器*/
    
    //static let KWDYHF_ApiPrefix = "http://122.225.124.34:39008/huzh_credit/";
    static let KWDYHF_ApiPrefix = "http://122.225.124.34:39008/test/huzh_credit/";
    
    /** 测试情况下 支付 服务器地址 */
    static let KWDYHF_TestPayCustomServer = "http://122.225.124.34:39008/test/huzh_credit/sdk/sdktobill";
    
    static let KWDYHF_Prefix_ct = "ct/";
    static let KWDYHF_Prefix_sdk = "sdk/";
    
    
    //#elif ProductSever
    ///** 接口前缀-生产服务器*/
    //static let kApiPrefix = "https://www.baidu.com";
    //#endif
    
    
    // MARK:- 1.1.    签约接口
    
    /** 1.1.1.    签约状态查询 */
    static let KWDYHF_SigningStatusQuery = "xy0001";
    /** 1.1.2.    签约申请 */
    static let KWDYHF_SigningApply = "xy0002";
    /** 1.1.3.    签约变更手机号 */
    static let KWDYHF_SigningModifyPhone = "xy0003";
    /** 1.1.4.    解约 */
    static let KWDYHF_Release = "xy0004";
    /** 1.1.5.    验证码通知和获取*/
    static let KWDYHF_VerificationCode = "xy0006";
    /** 1.1.6.    获取医院列表 */
    static let KWDYHF_HospitalList = "xy0008";
    
    
    
    // MARK:- 1.2.    门诊账单接口
    
    /** 1.2.1.    移动支付状态查询 */
    static let KWDYHF_MobilePayStatusQuery = "yd0001";
    /** 1.2.2.    移动支付数据保存 */
    static let KWDYHF_MobilePayStatusSave = "yd0002";
    /** 1.2.3.    门诊账单基本信息查询 */
    static let KWDYHF_OutpatientBillBasicInformationQuery = "yd0003";
    /** 1.2.4.    门诊账单明细查询 */
    static let KWDYHF_OutpatientBillDetail = "yd0004";
    /** 1.2.5.    未支付门诊账单锁定循环申请 */
    static let KWDYHF_NoPayOutpatientBill = "yd0005";
    /** 1.2.6.    试结算发起 */
    static let KWDYHF_TestPay = "yd0006";
    /** 1.2.7.    正式结算发起 */
    static let KWDYHF_FormalPay = "yd0007";
    /** 1.2.8.    订单信息列表查询 */
    static let KWDYHF_OrderMessageList = "yd0008";
    /** 1.2.9.    订单信息详情查询 */
    static let KWDYHF_OrderMessageDetail = "yd0009";
    /** 1.3.1.    获取支付所需参数 */
    static let KWDYHF_GetPayParameters = "yd0010";

}

