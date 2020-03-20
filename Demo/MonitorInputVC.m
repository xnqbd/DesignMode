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


@interface MonitorInputVC ()

@property (strong, nonatomic) UIButton *btn;
@property (strong, nonatomic) CKJPickerView *picker;
@property (strong, nonatomic) BaseMonitorModel *monitor;


@end

@implementation MonitorInputVC

#define kleftTitle @"leftTitle"
#define kplaceHolder @"placeHolder"
#define kunit @"unit"
#define kpickerData @"pickerData"
#define kcellid @"kcellid"
#define kcallback @"kcallback"


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
           make.bottom.equalTo(self.picker.mas_bottom);
       }];
}
- (CKJPickerView *)picker {
    if (_picker) return _picker;
    _picker = [[CKJPickerView alloc] init];
    _picker.backgroundColor = [UIColor kjwd_rbg:240 alpha:1];
    
//    __weak typeof(self) weakSelf = self;
//    _picker.endScroll_didSelect_callBack = ^(NSArray<CKJPickerRowModel *> * _Nonnull allSelectRows) {
////        NSLog(@"%@   ", allSelectRows);
////        weakSelf.simpleTableView kjwd_filterCellModelForID:<#(nonnull NSString *)#> finishBlock:<#^(__kindof CKJCommonCellModel * _Nonnull m)block#>
//    };
//    _picker.dataArr = [self sportType];
    [_picker kjwd_addToSuperView:self.view constraints:^(MASConstraintMaker * _Nonnull make, UIView * _Nonnull superview) {
        make.left.right.equalTo(superview);
        make.height.equalTo(@130);
        make.bottom.equalTo(superview.kjwdMas_safeAreaBottom).offset(0);
    }];
    _picker.hidden = YES;
    
    return _picker;
}

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
                        kpickerData : [self sportTime],
                        kcallback : ^NSString *(NSArray<CKJPickerRowModel *> * _Nonnull allSelectRows) {
                            int hour = allSelectRows[0].title.intValue;
                            int min = allSelectRows[2].title.intValue;
                            return [NSString stringWithFormat:@"%d", hour * 60 + min];
                        }
                    },
                    @{
                        kleftTitle : @"运动类型",
                        kplaceHolder : @"请选择",
                        kpickerData : [self sportType],
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
            NSString *pickerData = dic[kpickerData];
            
                CKJInputCellModel *model2 = [CKJInputCellModel inputWithCellHeight:nil cellModel_id:leftTitle detailSettingBlock:^(__kindof CKJInputCellModel * _Nonnull m) {
//                    m.stringChoose = [CKJStringChooseHelper new];
                    m.extension_Obj = dic;
                    
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

- (void)kj_tableView:(CKJSimpleTableView *)tableView didSelectRowAtSection:(NSInteger)section row:(NSInteger)row selectIndexPath:(NSIndexPath *)indexPath model:(__kindof CKJCommonCellModel *)model cell:(__kindof CKJCommonTableViewCell *)cell {
    __weak NSDictionary *dic = model.extension_Obj;
    NSArray <CKJPickerComponentModel *>*data = dic[kpickerData];
    
    
    if (data) {
        _picker.hidden = NO;
        __weak CKJInputCellModel *weakModel = model;
        __weak typeof(self) weakSelf = self;
        _picker.endScroll_didSelect_callBack = ^(NSArray<CKJPickerRowModel *> * _Nonnull allSelectRows, CKJPickerRowModel * _Nonnull currentRowModel) {
            
            NSString *(^bl)(NSArray<CKJPickerRowModel *> *) = dic[kcallback];
            if (bl) {
                NSString *result = bl(allSelectRows);
                
                [weakModel updateTFModel:^(CKJTFModel * _Nonnull tfModel) {
                    tfModel.text = result;
                }];
                [weakSelf.simpleTableView reloadData];
            }
        };
        self.picker.dataArr = model.extension_Obj[kpickerData];
        [self.picker reloadAllComponents];
        [self.picker _setDefaultSelectIndex];
    }
}





@end
