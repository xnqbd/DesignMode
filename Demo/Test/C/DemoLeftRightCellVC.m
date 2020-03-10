//
//  DemoCKJLeftRightCellVC.m
//  MobileHospital_Renji
//
//  Created by xnqbd on 2019/10/26.
//  Copyright © 2019 Lyc. All rights reserved.
//

#import "DemoLeftRightCellVC.h"
#import "CKJLeftRightTopEqualCell.h"
#import "CKJLeftRightCenterEqualCell.h"

@interface DemoLeftRightCellVC ()


@property (strong, nonatomic) CKJLeftRightCenterEqual_LeftLabelSetting *leftSetting;

@end

@implementation DemoLeftRightCellVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"CKJLeftRightCell示例";
    self.leftSetting = [CKJLeftRightCenterEqual_LeftLabelSetting settingWithLeftMargin:15 detail:nil];
    [self initSimpleTableViewData];
}

- (void)initSimpleTableViewData {
    KJ_typeweakself
    
    CKJLeftRightTopEqualCellModel *(^createTopEqualModel)(NSString *left, NSString *right) = ^CKJLeftRightTopEqualCellModel *(NSString *left, NSString *right) {
        CKJLeftRightTopEqualCellModel *model1 = [CKJLeftRightTopEqualCellModel topEqualWithLeftAtt:WDAttTitle(left) rightAtt:WDAttSubTitle(right) leftRightMargin:15 showLine:NO detail:^(CKJLeftRightTopEqualCellModel * _Nonnull m) {
            m.rightLab_textAlignment = NSTextAlignmentLeft;
            [m updateSetting:^(CKJLeftRightTopEqual_LeftLabelSetting * _Nonnull left, CKJLeftRightTopEqual_RightLabelSetting * _Nonnull right) {
                left.leftLab_width = @185;
            }];
        }];
        return model1;
    };
    
    CKJLeftRightCenterEqualCellModel *(^createCenterEqualModel)(NSString *left, NSString *right) = ^CKJLeftRightCenterEqualCellModel *(NSString *left, NSString *right) {
        CKJLeftRightCenterEqualCellModel *model1 = [CKJLeftRightCenterEqualCellModel centerEqualWithLeftAtt:WDAttTitle(left) rightAtt:WDAttSubTitle(right) leftSetting:weakSelf.leftSetting rightMargin:15 showLine:YES];
        return model1;
    };
    CKJCommonSectionModel *section1 = [CKJCommonSectionModel sectionWithHeaderAttString:WDCKJAttributed2(@"CKJLeftRightTopEqualCell顶部对齐", [UIColor kjwd_subTitle], @14) headerAlignment:NSTextAlignmentLeft detailSetting:^(__kindof CKJCommonSectionModel * _Nonnull _sec) {
        CKJLeftRightTopEqualCellModel *model1 = createTopEqualModel(@"就诊人：", @"张三");
        CKJLeftRightTopEqualCellModel *model2 = createTopEqualModel(@"身份证号：", @"330501****3715");
        CKJLeftRightTopEqualCellModel *model3 = createTopEqualModel(@"就诊医院：", @"上海交通大学医学院附属仁济医院东院（浦东新浦建路160号）");
        CKJLeftRightTopEqualCellModel *model4 = createTopEqualModel(@"门诊科室：", @"东院东消化科-幽门螺杆菌相关疾病 普通专病");
        CKJLeftRightTopEqualCellModel *model5 = createTopEqualModel(@"就诊位置：", @"上海市浦东新浦建路160号东外科大楼（7号楼1楼）");
        _sec.modelArray = @[model1, model2, model3, model4, model5];
    }];
    
    CKJCommonSectionModel *section2 = [CKJCommonSectionModel sectionWithHeaderAttString:WDCKJAttributed2(@"CKJLeftRightCenterEqualCell中心对齐", [UIColor kjwd_subTitle], @14) headerAlignment:NSTextAlignmentLeft detailSetting:^(__kindof CKJCommonSectionModel * _Nonnull _sec) {

        CKJLeftRightCenterEqualCellModel *model1 = createCenterEqualModel(@"就诊人：", @"张三");
        CKJLeftRightCenterEqualCellModel *model2 = createCenterEqualModel(@"身份证号：", @"330501****3715");
        CKJLeftRightCenterEqualCellModel *model3 = createCenterEqualModel(@"就诊医院：", @"上海交通大学医学院附属仁济医院东院（浦东新浦建路160号）");
        CKJLeftRightCenterEqualCellModel *model4 = createCenterEqualModel(@"门诊科室：", @"东院东消化科-幽门螺杆菌相关疾病 普通专病");
        CKJLeftRightCenterEqualCellModel *model5 = createCenterEqualModel(@"就诊位置：", @"上海市浦东新浦建路160号东外科大楼（7号楼1楼）");
        _sec.modelArray = @[model1, model2, model3, model4, model5];
    }];
    
    self.simpleTableView.dataArr = @[section1, section2];
}




@end
