//
//  CKJInputData.m
//  MobileHospital_Renji
//
//  Created by xnqbd on 2019/12/12.
//  Copyright © 2019 Lyc. All rights reserved.
//

#import "CKJInputData.h"
#import "CKJSimpleTableView.h"


NSString *_Nonnull const kOInput_Name = @"kOInput_Name";
NSString *_Nonnull const kOInput_Sex = @"kOInput_Sex";
NSString *_Nonnull const kOInput_Phone = @"kOInput_Phone";
NSString *_Nonnull const kOInput_VerityCode = @"kOInput_VerityCode";
NSString *_Nonnull const kOInput_idCardType = @"kOInput_idCardType";
NSString *_Nonnull const kOInput_idCardNumber = @"kOInput_idCardNumber";
NSString *_Nonnull const kOInput_Birthday = @"kOInput_Birthday";
NSString *_Nonnull const kOInput_Relationship = @"kOInput_Relationship";
NSString *_Nonnull const kOInput_Address = @"kOInput_Address";
NSString *_Nonnull const kOInput_Email = @"kOInput_Email";
NSString *_Nonnull const kOInput_Pwd = @"kOInput_Pwd";
NSString *_Nonnull const kOInput_ConfirmPwd = @"kOInput_ConfirmPwd";



@implementation CKJInputData

- (instancetype)initWithSimpleTableView:(CKJSimpleTableView *)simpleTableView {
    
    // 姓名
    NSString *_name = [simpleTableView inputCellModelOfID:kOInput_Name].tfText;
    
    // 手机号
    NSString *_phone = [simpleTableView inputCellModelOfID:kOInput_Phone].tfText;
    
    // 验证码
    NSString *_verityCode = [simpleTableView inputCellModelOfID:kOInput_VerityCode].tfText;
    
    // 证件号
    NSString *_idCardNumber = [simpleTableView inputCellModelOfID:kOInput_idCardNumber].tfText;
    
    // 出生日期
    NSDate *_birthday = [simpleTableView inputCellModelOfID:kOInput_Birthday].dateChoose.currentSelectedDate;
    
    // 地址
    NSString *_address = [simpleTableView inputCellModelOfID:kOInput_Address].tfText;
    
    // 邮箱
    NSString *_email = [simpleTableView inputCellModelOfID:kOInput_Email].tfText;
    
    // 密码
    NSString *_pwd = [simpleTableView inputCellModelOfID:kOInput_Pwd].tfText;
    
    // 确认密码
    NSString *_confirmPwd = [simpleTableView inputCellModelOfID:kOInput_ConfirmPwd].tfText;
    
    
    // 性别
    CKJStringChooseItem *_sex = [simpleTableView inputCellModelOfID:kOInput_Sex].stringChoose.currentSelectedItem;
    
    // 证件类型
    CKJStringChooseItem *_idCardType = [simpleTableView inputCellModelOfID:kOInput_idCardType].stringChoose.currentSelectedItem;
    
    // 关系
    CKJStringChooseItem *_relationShip = [simpleTableView inputCellModelOfID:kOInput_Relationship].stringChoose.currentSelectedItem;
    
    
    self.name = _name;
    self.phone = _phone;
    self.verityCode = _verityCode;
    self.idCardNumber = _idCardNumber;
    self.birthday = _birthday;
    self.address = _address;
    self.email = _email;
    self.pwd = _pwd;
    self.confirmPwd = _confirmPwd;
    
    self.sex = _sex;
    self.idCardType = _idCardType;
    self.relationship = _relationShip;
    
    
    return self;
}

@end
