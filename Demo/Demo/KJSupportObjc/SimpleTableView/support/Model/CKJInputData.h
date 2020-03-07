//
//  CKJInputData.h
//  MobileHospital_Renji
//
//  Created by xnqbd on 2019/12/12.
//  Copyright © 2019 Lyc. All rights reserved.
//

#import "CKJBaseModel.h"
#import "CKJChooseHelper.h"

@class CKJSimpleTableView;

NS_ASSUME_NONNULL_BEGIN


UIKIT_EXTERN NSString *_Nonnull const kOInput_Name;
UIKIT_EXTERN NSString *_Nonnull const kOInput_Sex;
UIKIT_EXTERN NSString *_Nonnull const kOInput_Phone;
UIKIT_EXTERN NSString *_Nonnull const kOInput_VerityCode;
UIKIT_EXTERN NSString *_Nonnull const kOInput_idCardType;
UIKIT_EXTERN NSString *_Nonnull const kOInput_idCardNumber;
UIKIT_EXTERN NSString *_Nonnull const kOInput_Birthday;
UIKIT_EXTERN NSString *_Nonnull const kOInput_Relationship;
UIKIT_EXTERN NSString *_Nonnull const kOInput_Address;
UIKIT_EXTERN NSString *_Nonnull const kOInput_Email;
UIKIT_EXTERN NSString *_Nonnull const kOInput_Pwd;
UIKIT_EXTERN NSString *_Nonnull const kOInput_ConfirmPwd;

@interface CKJInputData : CKJBaseModel


@property (copy, nonatomic, nullable) NSString *name;
@property (copy, nonatomic, nullable) NSString *phone;
@property (copy, nonatomic, nullable) NSString *verityCode;
@property (copy, nonatomic, nullable) NSString *idCardNumber;
@property (copy, nonatomic, nullable) NSString *address;
@property (copy, nonatomic, nullable) NSString *email;
@property (copy, nonatomic, nullable) NSString *pwd;
@property (copy, nonatomic, nullable) NSString *confirmPwd;

@property (strong, nonatomic, nullable) CKJStringChooseItem *sex;
@property (strong, nonatomic, nullable) CKJStringChooseItem *idCardType;
@property (strong, nonatomic, nullable) CKJStringChooseItem *relationship;

@property (strong, nonatomic, nullable) NSDate *birthday;


- (instancetype)initWithSimpleTableView:(CKJSimpleTableView *)simpleTableView;

@end

NS_ASSUME_NONNULL_END
