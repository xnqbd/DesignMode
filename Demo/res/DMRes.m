//
//  DMRes.m
//  Demo
//
//  Created by admin2 on 2020/1/20.
//  Copyright © 2020 admin2. All rights reserved.
//

#import "DMRes.h"
#import "NSObject+WDYHFCategory.h"
#import "CKJWorker.h"

@implementation DMRes



+ (NSArray <NSArray <NSDictionary *> *>*)item2 {
    UIImage *(^b_image)(NSString *imageName) = ^UIImage *(NSString *imageName) {
        return [[UIImage kjwd_imageNamed:imageName] kjwd_scaleToSize:CGSizeMake(50, 50)];
    };
    return @[
        @[
            @{KJPrefix_cNormalAttTitle : WDAtt13(@"预约挂号"), KJPrefix_cNormalImage : b_image(@"yuyueguahao")},
            @{KJPrefix_cNormalAttTitle : WDAtt13(@"当天挂号"), KJPrefix_cNormalImage : b_image(@"qianyue-server")},
            @{KJPrefix_cNormalAttTitle : WDAtt13(@"门诊缴费"), KJPrefix_cNormalImage : b_image(@"在线缴费")},
            @{KJPrefix_cNormalAttTitle : WDAtt13(@"住院业务"), KJPrefix_cNormalImage : b_image(@"住院缴费")}
        ],
        @[
            @{KJPrefix_cNormalAttTitle : WDAtt13(@"我的账单"), KJPrefix_cNormalImage : b_image(@"电子处方")},
            @{KJPrefix_cNormalAttTitle : WDAtt13(@"报告查询"), KJPrefix_cNormalImage : b_image(@"报告查询")},
            @{KJPrefix_cNormalAttTitle : WDAtt13(@"病历复印"), KJPrefix_cNormalImage : b_image(@"online-server")},
            @{KJPrefix_cNormalAttTitle : WDAtt13(@"附近药店"), KJPrefix_cNormalImage : b_image(@"hot-hospital")}
        ]
    ];
}


@end
