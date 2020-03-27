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

- (UITableViewStyle)simpleTableViewStyle {
    return UITableViewStylePlain;
}

- (void)layoutTableViewFrame:(CKJSimpleTableView *)tableV {
    [tableV kjwd_mas_makeConstraints:^(MASConstraintMaker *make, UIView *superview) {
        make.centerX.top.bottom.equalTo(superview);
        make.left.equalTo(superview).offset(20);
    }];
}

- (void)pop {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController kjwd_setTitleColorFontDic:@{NSForegroundColorAttributeName : [UIColor kjwd_title], NSFontAttributeName : [UIFont systemFontOfSize:18]}];
}
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.navigationController kjwd_setTitleColorFontDic:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIBarButtonItem * backItem = [[UIBarButtonItem alloc] initWithImage:[UIImage kjwd_imageNamed:@"m_monitor_icon1"] style:(UIBarButtonItemStyleDone) target:self action:@selector(pop)];
    [backItem setTintColor:[UIColor kjwd_title]];
    self.navigationItem.leftBarButtonItem = backItem;
    
    self.navigationItem.title = @"智能检测";
    
    
    self.simpleTableView.backgroundColor = [UIColor whiteColor];
    self.view.backgroundColor = self.simpleTableView.backgroundColor;

    [self.simpleTableView updateStyle:^(CKJSimpleTableViewStyle * _Nonnull style) {
        style.rowHeight = @44;
    }];

    CKJCommonSectionModel *section1 = [CKJCommonSectionModel sectionWithDetailSetting:^(__kindof CKJCommonSectionModel * _Nonnull _sec) {
        CKJGeneralCellModel *model1 = [CKJGeneralCellModel generalWithCellHeight:nil cellModel_id:nil detailSettingBlock:^(__kindof CKJGeneralCellModel *__weak  _Nonnull m) {
            m.title3Model = [CKJTitle3Model title3ModelWithText:WDCKJAttBold(@"数据监测", [UIColor kjwd_title], @16) left:12];
            m.arrow9Model = [CKJArrow9Model arrow9ModelWithImage:[UIImage kjwd_imageNamed:@"m_monitor_icon2"] right:nil];
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
    
    CKJCommonSectionModel *section2 = [CKJCommonSectionModel sectionWithDetailSetting:^(__kindof CKJCommonSectionModel * _Nonnull _sec) {
        
//        CKJEmptyCellModel *model0 = [CKJEmptyCellModel emptyCellModelWithHeight:20 showLine:NO];
        
        CKJGeneralCellModel *model1 = [CKJGeneralCellModel generalWithCellHeight:nil cellModel_id:nil detailSettingBlock:^(__kindof CKJGeneralCellModel *__weak  _Nonnull m) {
            m.title3Model = [CKJTitle3Model title3ModelWithText:WDCKJAttBold(@"我的仪器", [UIColor kjwd_title], @16) left:12];
            m.arrow9Model = [CKJArrow9Model arrow9ModelWithImage:[UIImage kjwd_imageNamed:@"m_monitor_icon2"] right:nil];
        } didSelectRowBlock:nil];
        _sec.modelArray = @[model1];
    }];
    
    self.simpleTableView.dataArr = @[section1, section2];
}


@end
