//
//  NetWorkResponse.h
//  Demo
//
//  Created by admin2 on 2020/3/17.
//  Copyright © 2020 admin2. All rights reserved.
//

#import "CKJBaseModel.h"

NS_ASSUME_NONNULL_BEGIN


@interface GraphicNetData : CKJBaseModel

@property (copy, nonatomic) NSString *content;
@property (copy, nonatomic) NSString *personName;
@property (copy, nonatomic) NSString *date;

@property (copy, nonatomic) NSString *answerNum;
@property (copy, nonatomic) NSString *adoptionStatus;
@property (copy, nonatomic) NSString *answerStatus;

@end



@interface AdvisoryNetData : CKJBaseModel

@property (copy, nonatomic) NSString *content;
@property (copy, nonatomic) NSString *personName;
@property (copy, nonatomic) NSString *date;

@end

NS_ASSUME_NONNULL_END
