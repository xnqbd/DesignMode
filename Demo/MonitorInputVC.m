//
//  MonitorInputVC.m
//  Demo
//
//  Created by admin2 on 2020/3/18.
//  Copyright © 2020 admin2. All rights reserved.
//

#import "MonitorInputVC.h"
#import "NSObject+WDYHFCategory.h"
#import "BaseMonitorModel.h"
#import <ActionSheetPicker_3_0/ActionSheetPicker.h>
#import "CKJPickerView.h"

#import "CKJDatePickerView.h"

@interface MonitorInputVC ()

@property (strong, nonatomic) UIButton *btn;
@property (strong, nonatomic) CKJPickerView *normalPicker;
@property (strong, nonatomic) CKJDatePickerView *datePicker;
@property (strong, nonatomic) BaseMonitorModel *monitor;


@end

@implementation MonitorInputVC

#define kleftTitle @"leftTitle"
#define kplaceHolder @"placeHolder"
#define kunit @"unit"
#define knormalPickerData @"normalPickerData"
#define kdatePickerData @"kdatePickerData"
#define kcellid @"kcellid"
#define kcallback @"kcallback"

#define PickerHeight 130

- (NSArray <CKJPickerComponentModel *>*)sportTime {
    CKJPickerComponentModel *c1 = [CKJPickerComponentModel componentWithDetail:^(CKJPickerComponentModel * _Nonnull m) {
        m.modelArray = [NSMutableArray kjwd_enumCount:24 returnItemBlock:^id _Nonnull(NSUInteger i) {
            CKJPickerRowModel *row = [CKJPickerRowModel rowModelWithTitle:[NSString stringWithFormat:@"%02lu", i]];
            return row;
        }];
    }];
    
    CKJPickerComponentModel *c2 = [CKJPickerComponentModel componentWithDetail:^(CKJPickerComponentModel * _Nonnull m) {
        m.width = 40;
        m.modelArray = @[[CKJPickerRowModel rowModelWithTitle:WDAttSubTitle14(@"小时")]];
    }];
    
    CKJPickerComponentModel *c3 = [CKJPickerComponentModel componentWithDetail:^(CKJPickerComponentModel * _Nonnull m) {
        m.modelArray = [NSMutableArray kjwd_enumCount:60 returnItemBlock:^id _Nonnull(NSUInteger i) {
            CKJPickerRowModel *row = [CKJPickerRowModel rowModelWithTitle:[NSString stringWithFormat:@"%02lu", i]];
            return row;
        }];
    }];
    
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


//- (NSArray <CKJPickerComponentModel *>*)sleepBeginTime {
//    CKJPickerComponentModel *c1 = [CKJPickerComponentModel componentWithDetail:^(CKJPickerComponentModel * _Nonnull m) {
//        m.modelArray = [NSMutableArray kjwd_enumCount:24 returnItemBlock:^id _Nonnull(NSUInteger i) {
//            CKJPickerRowModel *row = [CKJPickerRowModel rowModelWithTitle:[NSString stringWithFormat:@"%02lu", i]];
//            return row;
//        }];
//    }];
//    
//    CKJPickerComponentModel *c2 = [CKJPickerComponentModel componentWithDetail:^(CKJPickerComponentModel * _Nonnull m) {
//        m.width = 40;
//        m.modelArray = @[[CKJPickerRowModel rowModelWithTitle:WDAttSubTitle14(@"小时")]];
//    }];
//    
//    CKJPickerComponentModel *c3 = [CKJPickerComponentModel componentWithDetail:^(CKJPickerComponentModel * _Nonnull m) {
//        m.modelArray = [NSMutableArray kjwd_enumCount:60 returnItemBlock:^id _Nonnull(NSUInteger i) {
//            CKJPickerRowModel *row = [CKJPickerRowModel rowModelWithTitle:[NSString stringWithFormat:@"%02lu", i]];
//            return row;
//        }];
//    }];
//    
//    CKJPickerComponentModel *c4 = [CKJPickerComponentModel componentWithDetail:^(CKJPickerComponentModel * _Nonnull m) {
//        m.width = 70;
//        m.modelArray = @[[CKJPickerRowModel rowModelWithTitle:WDAttSubTitle14(@"分钟")]];
//    }];
//    return @[c1, c2, c3, c4];
//}
//
//
//- (NSArray <CKJPickerComponentModel *>*)sportType {
//    CKJPickerComponentModel *c1 = [CKJPickerComponentModel componentWithDetail:^(CKJPickerComponentModel * _Nonnull m) {
//        m.modelArray = @[
//            [CKJPickerRowModel rowModelWithTitle:@"跑步"],
//            [CKJPickerRowModel rowModelWithTitle:@"步行"],
//            [CKJPickerRowModel rowModelWithTitle:@"自行车"],
//            [CKJPickerRowModel rowModelWithTitle:@"游泳"],
//        ];
//    }];
//    return @[c1];
//}




- (UIButton *)btn {
    if (_btn) return _btn;
    
    _btn = [UIButton buttonWithType:UIButtonTypeSystem];
    _btn.backgroundColor = [UIColor redColor];
    
    [_btn kjwd_addToSuperView:self.view constraints:^(MASConstraintMaker * _Nonnull make, UIView * _Nonnull superview) {
        make.left.right.equalTo(superview);
        make.height.equalTo(@100);
        make.bottom.equalTo(superview).offset(-100);
    }];
    return _btn;
}


- (void)layoutTableViewFrame:(CKJSimpleTableView *)tableV {
    [tableV kjwd_mas_makeConstraints:^(MASConstraintMaker *make, UIView *superview) {
        make.left.equalTo(superview.kjwdMas_safeAreaLeft);
        make.right.equalTo(superview.kjwdMas_safeAreaRight);
        make.top.equalTo(superview.kjwdMas_safeAreaTop);
        make.bottom.equalTo(superview).offset(-PickerHeight);
    }];
}
- (CKJPickerView *)normalPicker {
    if (_normalPicker) return _normalPicker;
    _normalPicker = [[CKJPickerView alloc] init];
    _normalPicker.backgroundColor = [UIColor kjwd_rbg:240 alpha:1];
    [_normalPicker kjwd_addToSuperView:self.view constraints:^(MASConstraintMaker * _Nonnull make, UIView * _Nonnull superview) {
        make.left.right.equalTo(superview);
        make.height.equalTo(@(PickerHeight));
        make.bottom.equalTo(superview.kjwdMas_safeAreaBottom).offset(0);
    }];
    _normalPicker.hidden = YES;
    return _normalPicker;
}
//- (WSDatePickerView *)datePicker {
//    if (_datePicker) return _datePicker;
//    //指定日期2011-11-11 11:11
//    NSDateFormatter *minDateFormater = [[NSDateFormatter alloc] init];
//    [minDateFormater setDateFormat:@"yyyy-MM-dd HH:mm"];
//    NSDate *scrollToDate = [minDateFormater dateFromString:@"2011-11-11 11:11"];
//
//    __weak typeof(self) weakSe = self;
//
//    WSDatePickerView *datepicker = [[WSDatePickerView alloc] initWithDateStyle:CKJDateStyle1 scrollToDate:scrollToDate CompleteBlock:^(NSDate *selectDate) {
//
//        NSString *date = [selectDate stringWithFormat:@"yyyy-MM-dd HH:mm"];
//        NSLog(@"选择的日期：%@",date);
////        [btn setTitle:date forState:UIControlStateNormal];
////        weakSe.date = selectDate;
//    }];
//    datepicker.dateLabelColor = [UIColor kjwd_rbg:150 alpha:1];
//    datepicker.datePickerColor = [UIColor blackColor];//滚轮日期颜色
//    datepicker.hideBackgroundYearLabel = YES;//隐藏背景年份文字
//    [datepicker kjwd_addToSuperView:self.view constraints:^(MASConstraintMaker * _Nonnull make, UIView * _Nonnull superview) {
//        make.left.right.equalTo(superview);
//        make.height.equalTo(@(PickerHeight));
//        make.bottom.equalTo(superview.kjwdMas_safeAreaBottom).offset(0);
//    }];
//    datepicker.hidden = YES;
//    _datePicker = datepicker;
//    return _datePicker;
//}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    BaseMonitorModel *monitor = [[BaseMonitorModel alloc] init];
    
    monitor.data =
        @{
            @"navigationTitle" : @"记运动",
            @"rows" : @[
                    @{
                        kleftTitle : @"运动时间",
                        kplaceHolder : @"请选择",
                        kunit : @"(min)",
                        kdatePickerData : @1
                    },
                    @{
                        kleftTitle : @"运动类型",
                        kplaceHolder : @"请选择",
                        kdatePickerData : @1
                    }
            ]
        };
    
    NSDictionary *sleep = @{
        @"navigationTitle" : @"记睡眠",
        @"rows" : @[
                @{
                    kleftTitle : @"开始时间",
                    kplaceHolder : @"请选择",
                    knormalPickerData : [self sportTime],
                    kcallback : ^NSString *(NSArray<CKJPickerRowModel *> * _Nonnull allSelectRows) {
                        int hour = allSelectRows[0].title.intValue;
                        int min = allSelectRows[2].title.intValue;
                        return [NSString stringWithFormat:@"%d", hour * 60 + min];
                    }
                },
                @{
                    kleftTitle : @"运动类型",
                    kplaceHolder : @"请选择",
                    knormalPickerData : [self sportType],
                    kcallback : ^NSString *(NSArray<CKJPickerRowModel *> * _Nonnull allSelectRows) {
                        return [NSString stringWithFormat:@"%@", allSelectRows[0].title];
                    }
                }
        ]
    };
    
    self.monitor = monitor;
    
    
//    self.navigationItem.leftBarButtonItem = [UIBarButtonItem kjwd_itemWithTitle:@"取消" color:[UIColor lightGrayColor] callBack:^(UIBarButtonItem * _Nonnull sender) {
//    }];
//    self.navigationItem.rightBarButtonItem = [UIBarButtonItem kjwd_itemWithTitle:@"添加" color:[UIColor redColor] callBack:^(UIBarButtonItem * _Nonnull sender) {
//
//    }];
    
    self.navigationItem.title = @"记血糖";
    [self.navigationController kjwd_setTitleColorFontDic:@{NSForegroundColorAttributeName : [UIColor kjwd_title]}];
    
    
    [self.simpleTableView updateStyle:^(CKJSimpleTableViewStyle * _Nonnull style) {
        style.rowHeight = @44;
    }];
    
    
    CKJCommonSectionModel *section1 = [CKJCommonSectionModel sectionWithHeaderHeight:@10 detailSetting:^(__kindof CKJCommonSectionModel * _Nonnull _sec) {
        CKJGeneralCellModel *model1 = [CKJGeneralCellModel generalWithCellHeight:nil cellModel_id:nil detailSettingBlock:^(__kindof CKJGeneralCellModel *__weak  _Nonnull m) {
            m.title3Model = [CKJTitle3Model title3ModelWithAttributedText:WDAttTitle14(@"2020年2月25日 10:30") left:10];
            m.arrow9Model = [CKJArrow9Model arrow9SystemModel];
        } didSelectRowBlock:nil];
        [_sec addCellModel:model1];
        
        NSArray *rows = monitor.data[@"rows"];
        
        for (NSDictionary *dic in rows) {

            NSString *leftTitle = dic[kleftTitle];
            NSString *placeHolder = dic[kplaceHolder];
            NSString *unit = dic[kunit];
//            NSString *pickerData = dic[knormalPickerData];
            
                CKJInputCellModel *model2 = [CKJInputCellModel inputWithCellHeight:nil cellModel_id:leftTitle detailSettingBlock:^(__kindof CKJInputCellModel * _Nonnull m) {
//                    m.stringChoose = [CKJStringChooseHelper new];
                    m.extension_Obj1 = dic;
                    
                    m.title3Model = [CKJTitle3Model title3ModelWithAttributedText:WDAttTitle14(leftTitle) left:10];
                    [m updateTFModel:^(CKJTFModel * _Nonnull tfModel) {
                        tfModel.textAlignment = NSTextAlignmentRight;
                        tfModel.attributedPlaceholder = WDAttSubTitle(placeHolder);
                        tfModel.userInteractionEnabled = NO;
                    }];
                    m.likePrice61Model = [CKJLikePriceLabel61Model likePriceModelWithAttText:WDAttTitle(unit) left:5 right:10];
                }];
            [_sec addCellModel:model2];
        }
        
    }];
    self.simpleTableView.dataArr = @[section1];
}

- (void)kj_tableView:(CKJSimpleTableView *)tableView didSelectRowAtSection:(NSInteger)section row:(NSInteger)row selectIndexPath:(NSIndexPath *)indexPath model:(__kindof __weak CKJCommonCellModel *)model cell:(__kindof CKJCommonTableViewCell *)cell {
    __weak NSDictionary *dic = model.extension_Obj1;
    NSArray <CKJPickerComponentModel *>*normalData = dic[knormalPickerData];
    NSArray <CKJPickerComponentModel *>*dateData = dic[kdatePickerData];
    
    if (normalData) {
        self.normalPicker.hidden = NO;
//        self.datePicker.hidden = YES;
        __weak CKJInputCellModel *weakModel = model;
        __weak typeof(self) weakSelf = self;
        self.normalPicker.endScroll_didSelect_callBack = ^(NSArray<CKJPickerRowModel *> * _Nonnull allSelectRows, CKJPickerRowModel * _Nonnull currentRowModel) {
            NSString *(^bl)(NSArray<CKJPickerRowModel *> *) = dic[kcallback];
            if (bl) {
                NSString *result = bl(allSelectRows);
                [weakModel updateTFModel:^(CKJTFModel * _Nonnull tfModel) {
                    tfModel.text = result;
                }];
                [weakSelf.simpleTableView reloadData];
            }
        };
        self.normalPicker.dataArr = model.extension_Obj1[knormalPickerData];
        [self.normalPicker reloadAllComponents];
        [self.normalPicker _setDefaultSelectIndex];
    } else if (dateData) {
        self.normalPicker.hidden = YES;
        [self.datePicker removeFromSuperview];
        
        NSLog(@"%@   ", ((NSDate *)model.extension_Obj2).kjwd_dateString);
        
        __weak typeof(self) weakSelf = self;
        CKJDatePickerView *p = [[CKJDatePickerView alloc] initWithDateStyle:CKJDateStyle1 scrollToDate:model.extension_Obj2 endScroll_didSelect_callBack:^(NSDate * _Nonnull currentDate) {
            model.extension_Obj2 = currentDate;
            
            [model.cell.simpleTableView reloadData];
        }];
        p.hideBackgroundYearLabel = YES;
        p.dateLabelColor = [UIColor kjwd_subTitle];
        [p kjwd_addToSuperView:self.view constraints:^(MASConstraintMaker * _Nonnull make, UIView * _Nonnull superview) {
            make.left.right.equalTo(superview);
            make.height.equalTo(@(PickerHeight));
            make.bottom.equalTo(superview.kjwdMas_safeAreaBottom).offset(0);
        }];
        self.datePicker = p;
    } else {
        self.normalPicker.hidden = YES;
    }
}

- (void)showDatePicker {
   
}


@end
