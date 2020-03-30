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
#import "MonitorInstrumentCell.h"

@interface MonitorHomeVC ()

@end

@implementation MonitorHomeVC

- (UITableViewStyle)simpleTableViewStyle {
    return UITableViewStylePlain;
}

//- (void)layoutTableViewFrame:(CKJSimpleTableView *)tableV {
//    [tableV kjwd_mas_makeConstraints:^(MASConstraintMaker *make, UIView *superview) {
//        make.centerX.top.bottom.equalTo(superview);
//        make.left.equalTo(superview).offset(20);
//    }];
//}


- (nonnull NSDictionary <NSString *, NSDictionary <NSString *, id>*> *)returnCell_Model_keyValues:(CKJSimpleTableView *_Nonnull)s {
    return @{
        NSStringFromClass([MonitorInstrumentCellModel class]) : @{KJPrefix_cellKEY : NSStringFromClass([MonitorInstrumentCell class]), KJPrefix_isRegisterNibKEY : @YES}
    };
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
    
//    UIBarButtonItem * backItem = [[UIBarButtonItem alloc] initWithImage:[UIImage kjwd_imageNamed:@"m_monitor_icon1"] style:(UIBarButtonItemStyleDone) target:self action:@selector(pop)];
//    [backItem setTintColor:[UIColor kjwd_title]];
//    self.navigationItem.leftBarButtonItem = backItem;
    
    [self.navigationItem.leftBarButtonItem setTintColor:[UIColor kjwd_title]];
    self.navigationItem.title = @"智能检测";
    
    
    self.simpleTableView.backgroundColor = [UIColor whiteColor];
    self.view.backgroundColor = self.simpleTableView.backgroundColor;

    [self.simpleTableView updateStyle:^(CKJSimpleTableViewStyle * _Nonnull style) {
        style.rowHeight = @44;
        style.lineEdge = [NSValue valueWithUIEdgeInsets:UIEdgeInsetsMake(0, 15, 0, 15)];
    }];
    
    
    CKJGeneralSetting *setting = [[CKJGeneralSetting alloc] init];
    setting.image2_margin_title = 20;
    setting.likePriceLabel8_margin_arrow9 = 8;
    setting.arrow9_margin_super = 20;

    
    CKJGeneralCellModel *(^create)(id title, CKJArrow9Click click) = ^CKJGeneralCellModel *(id title, CKJArrow9Click click) {
        
        CKJArrow9Model *add1 = [CKJArrow9Model arrow9ModelWithImage:[UIImage kjwd_imageNamed:@"m_monitor_icon2"] right:nil click:click];
        add1.imageView_Size = [NSValue valueWithCGSize:CGSizeMake(40, 40)];
        
        CKJGeneralCellModel *model1 = [CKJGeneralCellModel generalWithTitle:WDCKJAttBold(title, [UIColor kjwd_title], @16) likePriceAttText:nil setting:setting arrow:add1 didSelectRowBlock:nil];
        return model1;
    };
    
    CKJCommonSectionModel *section1 = [CKJCommonSectionModel sectionWithDetailSetting:^(__kindof CKJCommonSectionModel * _Nonnull _sec) {
        
        __weak typeof(self) weakSelf = self;
        void (^block)(NSString *) = ^(NSString *flag){
            MonitorHistoryVC *vc = [[MonitorHistoryVC alloc] init];
            vc.type = flag;
            [weakSelf.navigationController pushViewController:vc animated:YES];
        };
        
        CKJGeneralCellModel *model1 = create(@"数据检测", ^(CKJArrow9Model *m) {
            NSLog(@"点击数据检测添加");
        });
        
        CKJGeneralCellModel *model2 = [CKJGeneralCellModel generalWithTitle:@"血压检测" likePriceAttText:WDCKJAttAppend(@"142/78", PTheme.red, @16, @"mmhg", PTheme.red, @13) setting:setting arrow:nil  didSelectRowBlock:^(CKJGeneralCellModel *__weak  _Nonnull m) {
            block(@"血压");
        }];
        CKJGeneralCellModel *model3 = [CKJGeneralCellModel generalWithTitle:@"血糖检测" likePriceAttText:WDCKJAttAppend(@"7.6", PTheme.red, @16, @"mmol/L", PTheme.red, @13) setting:setting arrow:nil  didSelectRowBlock:^(CKJGeneralCellModel *__weak  _Nonnull m) {
            block(@"血糖");
        }];
        CKJGeneralCellModel *model4 = [CKJGeneralCellModel generalWithTitle:@"体重检测" likePriceAttText:WDCKJAttAppend(@"70", PTheme.red, @16, @"kg", PTheme.red, @13) setting:setting arrow:nil  didSelectRowBlock:^(CKJGeneralCellModel *__weak  _Nonnull m) {
            block(@"体重");
        }];
        CKJGeneralCellModel *model5 = [CKJGeneralCellModel generalWithTitle:@"运动检测" likePriceAttText:WDCKJAttAppend(@"70", PTheme.red, @16, @"min", PTheme.red, @13) setting:setting arrow:nil  didSelectRowBlock:^(CKJGeneralCellModel *__weak  _Nonnull m) {
            block(@"运动");
        }];
        
        CKJGeneralCellModel *model6 = [CKJGeneralCellModel generalWithTitle:@"睡眠检测" likePriceAttText:[WDCKJAttAppend(@"3", PTheme.red, @16, @"小时", PTheme.red, @13) kjwd_append:WDCKJAttAppend(@"0", PTheme.red, @16, @"分钟", PTheme.red, @13)] setting:setting arrow:nil  didSelectRowBlock:^(CKJGeneralCellModel *__weak  _Nonnull m) {
            block(@"睡眠");
        }];
        _sec.modelArray = @[model1, model2, model3, model4, model5, model6];
    }];
    
    CKJCommonSectionModel *section2 = [CKJCommonSectionModel sectionWithDetailSetting:^(__kindof CKJCommonSectionModel * _Nonnull _sec) {
        
//        CKJEmptyCellModel *model0 = [CKJEmptyCellModel emptyCellModelWithHeight:20 showLine:NO];
        
        
        CKJGeneralCellModel *model1 = create(@"我的仪器", ^(CKJArrow9Model *m) {
            NSLog(@"点击我的仪器添加");
        });
        [model1 _showLine:NO];
        
        
        MonitorInstrumentCellModel *model2 = [MonitorInstrumentCellModel commonWithCellHeight:@100 cellModel_id:nil detailSettingBlock:^(__kindof CKJCommonCellModel * _Nonnull m) {
            
        } didSelectRowBlock:nil];
        _sec.modelArray = @[model1, model2];
    }];
    
    self.simpleTableView.dataArr = @[section1, section2];
}


@end
