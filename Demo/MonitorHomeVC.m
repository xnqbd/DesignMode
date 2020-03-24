//
//  MonitorHomeVC.m
//  Demo
//
//  Created by admin2 on 2020/3/24.
//  Copyright © 2020 admin2. All rights reserved.
//

#import "MonitorHomeVC.h"
#import "PTheme.h"
#import "MonitorHistoryVC.h"

@interface MonitorHomeVC ()

@end

@implementation MonitorHomeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.simpleTableView updateStyle:^(CKJSimpleTableViewStyle * _Nonnull style) {
        style.rowHeight = @44;
    }];

    CKJCommonSectionModel *section1 = [CKJCommonSectionModel sectionWithDetailSetting:^(__kindof CKJCommonSectionModel * _Nonnull _sec) {
        CKJGeneralCellModel *model1 = [CKJGeneralCellModel generalWithCellHeight:nil cellModel_id:nil detailSettingBlock:^(__kindof CKJGeneralCellModel *__weak  _Nonnull m) {
            m.title3Model = [CKJTitle3Model title3ModelWithAttributedText:WDCKJAttBold(@"数据监测", [UIColor kjwd_title], @22) left:10];
            m.arrow9Model = [CKJArrow9Model arrow9SystemModel];
        } didSelectRowBlock:nil];
        
        
        __weak typeof(self) weakSelf = self;
        void (^block)(NSString *) = ^(NSString *flag){
            MonitorHistoryVC *vc = [[MonitorHistoryVC alloc] init];
            vc.type = flag;
            [weakSelf.navigationController pushViewController:vc animated:YES];
        };
        

        CKJGeneralCellModel *model2 = [CKJGeneralCellModel generalWithTitle:@"血压检测" likePriceAttText:WDCKJAttAppend(@"142", PTheme.red, @16, @"mmhg", PTheme.red, @13) arrow:YES didSelectRowBlock:^(CKJGeneralCellModel *__weak  _Nonnull m) {
            block(@"血压");
        }];
        CKJGeneralCellModel *model3 = [CKJGeneralCellModel generalWithTitle:@"血糖检测" likePriceAttText:WDCKJAttAppend(@"142", PTheme.red, @16, @"mmhg", PTheme.red, @13) arrow:YES didSelectRowBlock:^(CKJGeneralCellModel *__weak  _Nonnull m) {
            block(@"血糖");
        }];
        CKJGeneralCellModel *model4 = [CKJGeneralCellModel generalWithTitle:@"体重检测" likePriceAttText:WDCKJAttAppend(@"142", PTheme.red, @16, @"mmhg", PTheme.red, @13) arrow:YES didSelectRowBlock:^(CKJGeneralCellModel *__weak  _Nonnull m) {
            block(@"体重");
        }];
        CKJGeneralCellModel *model5 = [CKJGeneralCellModel generalWithTitle:@"运动检测" likePriceAttText:WDCKJAttAppend(@"142", PTheme.red, @16, @"mmhg", PTheme.red, @13) arrow:YES didSelectRowBlock:^(CKJGeneralCellModel *__weak  _Nonnull m) {
            block(@"运动");
        }];
        CKJGeneralCellModel *model6 = [CKJGeneralCellModel generalWithTitle:@"睡眠检测" likePriceAttText:WDCKJAttAppend(@"142", PTheme.red, @16, @"mmhg", PTheme.red, @13) arrow:YES didSelectRowBlock:^(CKJGeneralCellModel *__weak  _Nonnull m) {
            block(@"睡眠");
        }];
        
        _sec.modelArray = @[model1, model2, model3, model4, model5, model6];
    }];
    self.simpleTableView.dataArr = @[section1];
}


@end
