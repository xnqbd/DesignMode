//
//  MonitorInputVC2.m
//  Demo
//
//  Created by admin2 on 2020/3/20.
//  Copyright © 2020 admin2. All rights reserved.
//

#import "MonitorInputVC2.h"
#import "TimeCell.h"
#import "UnitCell.h"
#import "NSObject+WDYHFCategory.h"
#import "CKJPickerView.h"
#import "CKJDatePickerView.h"
#import "MHeaderView.h"

@interface MonitorInputVC2 ()
//@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
//@property (weak, nonatomic) IBOutlet UIView *on;

@property (strong, nonatomic) UIView *picker;
//@property (strong, nonatomic) CKJDatePickerView *datePicker;

@property (strong, nonatomic) UIColor *grayColor;

@property (strong, nonatomic) UIView *onlyView;

@end

@implementation MonitorInputVC2

#define PickerHeight 170

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    self.view.backgroundColor = [UIColor systemOrangeColor];
    
    self.grayColor = [UIColor kjwd_rbg:247 alpha:1];
    UIView *onlyView = [[UIView alloc] init];
    
    onlyView.kCornerRadius = 10;
    onlyView.backgroundColor = [UIColor whiteColor];
    [onlyView kjwd_addToSuperView:self.view constraints:^(MASConstraintMaker * _Nonnull make, UIView * _Nonnull superview) {
        make.left.equalTo(superview.kjwdMas_safeAreaLeft);
        make.right.equalTo(superview.kjwdMas_safeAreaRight);
        make.top.equalTo(superview.kjwdMas_safeAreaTop).offset(10);
        make.bottom.equalTo(superview.kjwdMas_safeAreaBottom);
    }];
    __weak UIView *weakOnlyView = onlyView;
    self.onlyView = onlyView;
    
    
//
    MHeaderView *header = [MHeaderView kjwd_instanceUsingAutoNib];

    [header.add setTitleColor:_typeColor forState:UIControlStateNormal];

    [header kjwd_addToSuperView:onlyView constraints:^(MASConstraintMaker * _Nonnull make, UIView * _Nonnull superview) {
        make.left.right.top.equalTo(superview);
        make.height.equalTo(@80);
    }];
    
    
    UIView *gray = [[UIView alloc] init];
    gray.backgroundColor = self.grayColor;
    [gray kjwd_addToSuperView:onlyView constraints:^(MASConstraintMaker * _Nonnull make, UIView * _Nonnull superview) {
        make.top.equalTo(header.mas_bottom);
        make.left.right.equalTo(superview);
        make.height.equalTo(@10);
    }];
    
    __weak typeof(self) weakSelf = self;
    
    
    void(^timeBlock)(UIButton * _Nonnull _sender) = ^(UIButton * _Nonnull __weak _sender) {
        NSDate *date = _sender.ex_Obj1;
        
        
        [weakSelf.picker removeFromSuperview];
        
        CKJDatePickerView *p = [[CKJDatePickerView alloc] initWithDateStyle:CKJDateStyle1 scrollToDate:date endScroll_didSelect_callBack:^(NSDate * _Nonnull currentDate) {
            _sender.ex_Obj1 = currentDate;
            NSString *temp = [currentDate kjwd_dateStringWithFormatter:@"yyyy年MM月dd日 HH:mm"];
            [_sender setTitle:temp forState:UIControlStateNormal];
        }];
        p.backgroundColor = weakSelf.grayColor;
        p.hideBackgroundYearLabel = YES;
        p.dateLabelColor = [UIColor kjwd_subTitle];
        [p kjwd_addToSuperView:weakOnlyView constraints:^(MASConstraintMaker * _Nonnull make, UIView * _Nonnull superview) {
            make.left.right.equalTo(superview);
            make.height.equalTo(@(PickerHeight));
            make.bottom.equalTo(superview.kjwdMas_safeAreaBottom).offset(0);
        }];
        weakSelf.picker = p;
    };
    
    CKJPickerView *(^normalBlock)(NSArray *arr) = ^CKJPickerView *(NSArray *arr) {
        [weakSelf.picker removeFromSuperview];
        
        CKJPickerView *_normalPicker = [[CKJPickerView alloc] init];
        _normalPicker.backgroundColor = weakSelf.grayColor;
        [_normalPicker kjwd_addToSuperView:weakOnlyView constraints:^(MASConstraintMaker * _Nonnull make, UIView * _Nonnull superview) {
            make.left.right.equalTo(superview);
            make.height.equalTo(@(PickerHeight));
            make.bottom.equalTo(superview.kjwdMas_safeAreaBottom).offset(0);
        }];
        _normalPicker.dataArr = arr;
        [_normalPicker reloadAllComponents];
        [_normalPicker _setDefaultSelectIndex];
        
        weakSelf.picker = _normalPicker;
        return _normalPicker;
    };
    
   void(^singleNormal)(UIButton *) = ^(UIButton * _Nonnull __weak _sender) {
        normalBlock(_sender.ex_Obj1).endScroll_didSelect_callBack = ^(NSArray<CKJPickerRowModel *> * _Nonnull allSelectRows, CKJPickerRowModel * _Nonnull currentRowModel) {
            NSString *result = currentRowModel.title;
            [_sender setTitle:result forState:UIControlStateNormal];
        };
   };
    
    
//    UIView *bg = [[UIView alloc] init];
//    [bg kjwd_addToSuperView:weakOnlyView constraints:^(MASConstraintMaker * _Nonnull make, UIView * _Nonnull superview) {
//        make.left.right.bottom.equalTo(superview);
//        make.top.equalTo(superview.kjwdMas_safeAreaTop).offset(10);
//    }];
    
    TimeCell *time = [TimeCell kjwd_instanceUsingAutoNib];
    [time kjwd_addToSuperView:onlyView constraints:^(MASConstraintMaker * _Nonnull make, UIView * _Nonnull superview) {
        make.centerX.equalTo(superview);
        make.left.equalTo(superview).offset(20);
        make.top.equalTo(gray.mas_bottom).offset(10);
        make.height.equalTo(@44);
    }];
    [time.timeBtn kjwd_addTouchUpInsideForCallBack:timeBlock];
    
    UnitCell *one = [UnitCell kjwd_instanceUsingAutoNib];
    [one kjwd_addToSuperView:onlyView constraints:^(MASConstraintMaker * _Nonnull make, UIView * _Nonnull superview) {
        make.left.right.equalTo(time);
        make.top.equalTo(time.mas_bottom);
        make.height.equalTo(@44);
    }];
    
    
    UnitCell *two = [UnitCell kjwd_instanceUsingAutoNib];
    [two kjwd_addToSuperView:onlyView constraints:^(MASConstraintMaker * _Nonnull make, UIView * _Nonnull superview) {
        make.left.right.equalTo(time);
        make.top.equalTo(one.mas_bottom);
        make.height.equalTo(@44);
    }];
    
    
    
    
    
    
    header.title.text = [NSString stringWithFormat:@"记%@", _type];
    NSString *title = header.title.text;
    
    [header.cancel kjwd_addTouchUpInsideForCallBack:^(UIButton * _Nonnull _sender) {
        [weakSelf dismissViewControllerAnimated:YES completion:nil];
    }];
    [header.add kjwd_addTouchUpInsideForCallBack:^(UIButton * _Nonnull _sender) {
        [weakSelf dismissViewControllerAnimated:YES completion:nil];
    }];
    
    
    
    if ([title isEqualToString:@"记睡眠"]) {
        [one _setTitle:@"开始时间" btnTitle:nil unit:nil click:timeBlock];
        [two _setTitle:@"结束时间" btnTitle:nil unit:nil click:timeBlock];
    } else if ([title isEqualToString:@"记体重"]) {
        one.btn.ex_Obj1 = [weakSelf weight];
        two.btn.ex_Obj1 = [weakSelf _height];
        [one _setTitle:@"体重" btnTitle:nil unit:@"(kg)" click:^(UIButton * _Nonnull __weak _sender) {
            normalBlock(_sender.ex_Obj1).endScroll_didSelect_callBack = ^(NSArray<CKJPickerRowModel *> * _Nonnull allSelectRows, CKJPickerRowModel * _Nonnull currentRowModel) {
                int result = [CKJPickerRowModel _getTitles:allSelectRows].kjwd_stringValue.intValue;
                [_sender setTitle:[NSString stringWithFormat:@"%d", result] forState:UIControlStateNormal];
            };
        }];
        [two _setTitle:@"身高" btnTitle:nil unit:@"(cm)" click:singleNormal];
        
        two.bottomColor = [UIColor clearColor];
        [self addMessage:@"为了您的健康,请坚持每日测量体重，若有不便，请至少每周测量一次~" afterView:two];
    } else if ([title isEqualToString:@"记血糖"]) {
        one.btn.ex_Obj1 = [weakSelf bloodSugarValue];
        two.btn.ex_Obj1 = [weakSelf bloodSugarTime];
        [one _setTitle:@"血糖值" btnTitle:nil unit:@"(mmol/L)" click:^(UIButton * _Nonnull __weak _sender) {
            normalBlock(_sender.ex_Obj1).endScroll_didSelect_callBack = ^(NSArray<CKJPickerRowModel *> * _Nonnull allSelectRows, CKJPickerRowModel * _Nonnull currentRowModel) {
                int result = [CKJPickerRowModel _getTitles:allSelectRows].kjwd_stringValue.intValue;
                [_sender setTitle:[NSString stringWithFormat:@"%d", result] forState:UIControlStateNormal];
            };
        }];
        [two _setTitle:@"测量时间" btnTitle:nil unit:nil click:singleNormal];
        
        two.bottomColor = [UIColor clearColor];
        [self addMessage:@"为了您的健康,请坚持每日测量血糖，若有不便，请至少每周测量一次~" afterView:two];
    } else if ([title isEqualToString:@"记血压"]) {
        one.btn.ex_Obj1 = [weakSelf bloodPressure];
        two.btn.ex_Obj1 = [weakSelf bloodPressure];
        [one _setTitle:@"收缩压" btnTitle:nil unit:@"(高压 mmHg)" click:singleNormal];
        [two _setTitle:@"舒张压" btnTitle:nil unit:@"(低压 mmHg)" click:singleNormal];
        
        two.bottomColor = [UIColor clearColor];
        [self addMessage:@"为了您的健康,请坚持每日测量血压，若有不便，请至少每周测量一次~" afterView:two];
    } else if ([title isEqualToString:@"记运动"]) {
        one.btn.ex_Obj1 = [weakSelf sportTime];
        two.btn.ex_Obj1 = [weakSelf sportType];
        [one _setTitle:@"运动时间" btnTitle:nil unit:@"(min)" click:^(UIButton * _Nonnull __weak _sender) {
            normalBlock(_sender.ex_Obj1).endScroll_didSelect_callBack = ^(NSArray<CKJPickerRowModel *> * _Nonnull allSelectRows, CKJPickerRowModel * _Nonnull currentRowModel) {
                int hour = allSelectRows[0].title.intValue;
                int min = allSelectRows[2].title.intValue;
                NSString *result = [NSString stringWithFormat:@"%d", hour * 60 + min];
                [_sender setTitle:result forState:UIControlStateNormal];
            };
        }];
        [two _setTitle:@"运动类型" btnTitle:nil unit:nil click:singleNormal];
    }
}

- (void)addMessage:(NSString *)msg afterView:(UIView *)view {
    UIView *grayView = [[UIView alloc] init];
    grayView.backgroundColor = self.grayColor;
    [grayView kjwd_addToSuperView:self.onlyView constraints:^(MASConstraintMaker * _Nonnull make, UIView * _Nonnull superview) {
        make.left.right.equalTo(superview);
        make.top.equalTo(view.mas_bottom);
        make.height.equalTo(@70);
    }];
    UILabel *label = [[UILabel alloc] init];
    label.font = [UIFont systemFontOfSize:14];
    label.numberOfLines = 0;
    label.text = msg;
    label.textColor = [UIColor kjwd_subTitle];
    [label kjwd_addToSuperView:grayView constraints:^(MASConstraintMaker * _Nonnull make, UIView * _Nonnull superview) {
        make.edges.equalTo(superview).insets(UIEdgeInsetsMake(10, 50, 10, 50));
    }];
}



/// 体重
- (NSArray <CKJPickerComponentModel *>*)weight {
       CKJPickerComponentModel *c1 = [CKJPickerComponentModel componentWithDetail:^(CKJPickerComponentModel * _Nonnull m) {
         m.modelArray = [NSMutableArray kjwd_enumTo:9 returnItemBlock:^id _Nonnull(NSUInteger i) {
             CKJPickerRowModel *row = [CKJPickerRowModel rowModelWithTitle:[NSString stringWithFormat:@"%lu", i]];
             return row;
         }];
     }];
    CKJPickerComponentModel *c2 = [CKJPickerComponentModel componentWithDetail:^(CKJPickerComponentModel * _Nonnull m) {
            m.modelArray = [NSMutableArray kjwd_enumTo:9 returnItemBlock:^id _Nonnull(NSUInteger i) {
                CKJPickerRowModel *row = [CKJPickerRowModel rowModelWithTitle:[NSString stringWithFormat:@"%lu", i]];
                return row;
            }];
        }];
    CKJPickerComponentModel *c3 = [CKJPickerComponentModel componentWithDetail:^(CKJPickerComponentModel * _Nonnull m) {
        m.modelArray = [NSMutableArray kjwd_enumTo:9 returnItemBlock:^id _Nonnull(NSUInteger i) {
            CKJPickerRowModel *row = [CKJPickerRowModel rowModelWithTitle:[NSString stringWithFormat:@"%lu", i]];
            return row;
        }];
    }];
    return @[c1, c2, c3];
}


/// 体重
- (NSArray <CKJPickerComponentModel *>*)_height {
    __block CKJPickerRowModel *defaultM = nil;
    CKJPickerComponentModel *c1 = [CKJPickerComponentModel componentWithDetail:^(CKJPickerComponentModel * _Nonnull __weak m) {
        m.modelArray = [NSMutableArray kjwd_enumFrom:100 to:250 returnItemBlock:^id _Nonnull(NSUInteger i) {
            CKJPickerRowModel *row = [CKJPickerRowModel rowModelWithTitle:[NSString stringWithFormat:@"%lu", i]];
            if (i == 170) {
                defaultM = row;
            }
            return row;
        }];
    }];
    [c1 _setSelectModel:defaultM];
    return @[c1];
}


/// 血糖值
- (NSArray <CKJPickerComponentModel *>*)bloodSugarValue {
    CKJPickerComponentModel *c1 = [CKJPickerComponentModel componentWithDetail:^(CKJPickerComponentModel * _Nonnull m) {
        m.modelArray = [NSMutableArray kjwd_enumTo:10 returnItemBlock:^id _Nonnull(NSUInteger i) {
            CKJPickerRowModel *row = [CKJPickerRowModel rowModelWithTitle:[NSString stringWithFormat:@"%lu", i]];
            return row;
        }];
    }];
    CKJPickerComponentModel *c2 = [CKJPickerComponentModel componentWithDetail:^(CKJPickerComponentModel * _Nonnull m) {
         m.modelArray = [NSMutableArray kjwd_enumTo:10 returnItemBlock:^id _Nonnull(NSUInteger i) {
             CKJPickerRowModel *row = [CKJPickerRowModel rowModelWithTitle:[NSString stringWithFormat:@"%lu", i]];
             return row;
         }];
     }];
    return @[c1, c2];
}

/// 血糖测量时间
- (NSArray <CKJPickerComponentModel *>*)bloodSugarTime {
    CKJPickerComponentModel *c1 = [CKJPickerComponentModel componentWithDetail:^(CKJPickerComponentModel * _Nonnull m) {
        m.modelArray = @[
            [CKJPickerRowModel rowModelWithTitle:@"早餐前"],
            [CKJPickerRowModel rowModelWithTitle:@"早餐后"],
            [CKJPickerRowModel rowModelWithTitle:@"午餐前"],
            [CKJPickerRowModel rowModelWithTitle:@"午餐后"]
        ];
    }];
    return @[c1];
}


/// 血压
- (NSArray <CKJPickerComponentModel *>*)bloodPressure {
    CKJPickerComponentModel *c1 = [CKJPickerComponentModel componentWithDetail:^(CKJPickerComponentModel * _Nonnull m) {
        m.modelArray = [NSMutableArray kjwd_enumTo:300 returnItemBlock:^id _Nonnull(NSUInteger i) {
            CKJPickerRowModel *row = [CKJPickerRowModel rowModelWithTitle:[NSString stringWithFormat:@"%lu", i]];
            return row;
        }];
    }];
    return @[c1];
}


- (NSArray <CKJPickerComponentModel *>*)sportTime {
    CKJPickerComponentModel *c1 = [CKJPickerComponentModel componentWithDetail:^(CKJPickerComponentModel * _Nonnull m) {
        m.modelArray = [NSMutableArray kjwd_enumTo:23 returnItemBlock:^id _Nonnull(NSUInteger i) {
            CKJPickerRowModel *row = [CKJPickerRowModel rowModelWithTitle:[NSString stringWithFormat:@"%02lu", i]];
            return row;
        }];
    }];
    
    CKJPickerComponentModel *c2 = [CKJPickerComponentModel componentWithDetail:^(CKJPickerComponentModel * _Nonnull m) {
        m.width = 40;
        m.modelArray = @[[CKJPickerRowModel rowModelWithTitle:WDAttSubTitle14(@"小时")]];
    }];
    
    CKJPickerComponentModel *c3 = [CKJPickerComponentModel componentWithDetail:^(CKJPickerComponentModel * _Nonnull m) {
        m.modelArray = [NSMutableArray kjwd_enumTo:59 returnItemBlock:^id _Nonnull(NSUInteger i) {
            CKJPickerRowModel *row = [CKJPickerRowModel rowModelWithTitle:[NSString stringWithFormat:@"%02lu", i]];
            return row;
        }];
    }];
    c3.selectIndex = 7;
    
    CKJPickerComponentModel *c4 = [CKJPickerComponentModel componentWithDetail:^(CKJPickerComponentModel * _Nonnull m) {
        m.width = 70;
        m.modelArray = @[[CKJPickerRowModel rowModelWithTitle:WDAttSubTitle14(@"分钟")]];
    }];
    return @[c1, c2, c3, c4];
}


- (NSArray <CKJPickerComponentModel *>*)sportType {
    CKJPickerComponentModel *c1 = [CKJPickerComponentModel componentWithDetail:^(CKJPickerComponentModel * _Nonnull m) {
        m.modelArray = @[
            [CKJPickerRowModel rowModelWithTitle:@"跑步"],
            [CKJPickerRowModel rowModelWithTitle:@"步行"],
            [CKJPickerRowModel rowModelWithTitle:@"自行车"],
            [CKJPickerRowModel rowModelWithTitle:@"游泳"],
        ];
    }];
    return @[c1];
}



@end
