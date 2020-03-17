//
//  AdvisoryVC.m
//  Demo
//
//  Created by admin2 on 2020/3/17.
//  Copyright © 2020 admin2. All rights reserved.
//

#import "AdvisoryVC.h"
#import "AdvisoryCell.h"
#import <MJRefresh/MJRefresh.h>
#import "NetWorkResponse.h"

@interface AdvisoryVC ()

@end

@implementation AdvisoryVC

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.view.backgroundColor = [UIColor blueColor];
    
    __weak typeof(self) weakSelf = self;
    
    MJRefreshNormalHeader *headerRefresh =  [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [weakSelf firstNetwork];
    }];
    headerRefresh.lastUpdatedTimeLabel.hidden = YES;
    self.simpleTableView.mj_header = headerRefresh;
    [self.simpleTableView.mj_header beginRefreshing];
}


#pragma mark - CKJSimpleTableViewDataSource
- (nonnull NSDictionary <NSString *, NSDictionary <NSString *, id>*> *)returnCell_Model_keyValues:(CKJSimpleTableView *_Nonnull)s {
    return @{
        NSStringFromClass([AdvisoryCellModel class]) : @{KJPrefix_cellKEY : NSStringFromClass([AdvisoryCell class]), KJPrefix_isRegisterNibKEY : @YES}
    };
}


#pragma mark - JXCategoryListContentViewDelegate
- (UIView *)listView {
    return self.view;
}

#pragma mark - 网络
- (void)firstNetwork {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        [self.simpleTableView.mj_header endRefreshing];
        

        NSMutableArray *result = [NSMutableArray array];
        
        for (int i = 0; i < 10; i++) {
            CKJCommonSectionModel *section1 = [CKJCommonSectionModel sectionWithDetailSetting:^(__kindof CKJCommonSectionModel * _Nonnull _sec) {
                AdvisoryNetData *data = [AdvisoryNetData modelWithDic:@{}];
                data.content = @"内容内容内容内容内容内容内容内容内容内容内容内容内容内容";
                data.personName = @"张三";
                data.date = @"20120-03-16";
                
                AdvisoryCellModel *model1 = [AdvisoryCellModel commonWithCellHeight:@80 cellModel_id:nil detailSettingBlock:^(AdvisoryCellModel * _Nonnull m) {
                    m.networkData = data;
                } didSelectRowBlock:nil];
                _sec.modelArray = @[model1];
            }];
            [result addObject:section1];
        }
        
        self.simpleTableView.dataArr = result;
        [self.simpleTableView reloadData];
    });
}

@end
