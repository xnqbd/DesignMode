//
//  CKJDatePickerView.h
//  Demo
//
//  Created by admin2 on 2020/3/23.
//  Copyright © 2020 admin2. All rights reserved.
//

#import <UIKit/UIKit.h>


NS_ASSUME_NONNULL_BEGIN



/**
 *  弹出日期类型
 */
typedef enum{
    CKJDateStyle1  = 0,//年月日时分
    CKJDateStyle2,//月日时分
    CKJDateStyle3,//年月日
    CKJDateStyle4,//年月
    CKJDateStyle5,//月日
    CKJDateStyle6,//时分
    CKJDateStyle7,//年
    CKJDateStyle8,//月
    CKJDateStyle9,//日时分
}CKJDateStyle;



@interface CKJDatePickerView : UIView


/**
 *  确定按钮颜色
 */
@property (nonatomic,strong)UIColor *doneButtonColor;
/**
 *  年-月-日-时-分 文字颜色(默认橙色)
 */
@property (nonatomic,strong)UIColor *dateLabelColor;
/**
 *  滚轮日期颜色(默认黑色)
 */
@property (nonatomic,strong)UIColor *datePickerColor;

/**
 *  限制最大时间（默认2099）datePicker大于最大日期则滚动回最大限制日期
 */
@property (nonatomic, strong) NSDate *maxLimitDate;
/**
 *  限制最小时间（默认0） datePicker小于最小日期则滚动回最小限制日期
 */
@property (nonatomic, strong) NSDate *minLimitDate;

/**
 *  大号年份字体颜色(默认灰色)想隐藏可以设置为clearColor
 */
@property (nonatomic, strong) UIColor *yearLabelColor;

/**
 *  隐藏背景年份文字
 */
@property (nonatomic, assign) BOOL hideBackgroundYearLabel;


- (instancetype)initWithDateStyle:(CKJDateStyle)datePickerStyle scrollToDate:(NSDate *)scrollToDate endScroll_didSelect_callBack:(void(^)(NSDate *currentDate))endScroll_didSelect_callBack;



@end

NS_ASSUME_NONNULL_END
