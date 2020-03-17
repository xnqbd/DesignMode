//
//  HomeVC.m
//  Demo
//
//  Created by admin2 on 2020/3/17.
//  Copyright © 2020 admin2. All rights reserved.
//

#import "HomeVC.h"
#import <JXCategoryView/JXCategoryView.h>
#import <JXCategoryView/JXCategoryListContainerView.h>
#import "NSObject+WDYHFCategory.h"
#import "VideoVC.h"
#import "GraphicVC.h"
#import "AdvisoryVC.h"


@interface HomeVC () <JXCategoryViewDelegate, JXCategoryListContainerViewDelegate>

@property (nonatomic, strong) JXCategoryListContainerView *listContainerView;
@property (strong, nonatomic) JXCategoryTitleView *segment;

@property (strong, nonatomic) VideoVC *videoVC;
@property (strong, nonatomic) GraphicVC *graphicVC;
@property (strong, nonatomic) AdvisoryVC *advisoryVC;

@end

@implementation HomeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"居民咨询";
    
    self.videoVC = [[VideoVC alloc] init];
    self.graphicVC = [[GraphicVC alloc] init];
    self.advisoryVC = [[AdvisoryVC alloc] init];
    
    [self installSegmentView];
    [self installContainerView];
}

- (void)installSegmentView {
    __weak typeof(self) weakSelf = self;
    JXCategoryTitleView *(^createBlock)(NSArray <NSString *>*) = ^JXCategoryTitleView *(NSArray <NSString *>*titles) {
        JXCategoryTitleView *segmentView = [[JXCategoryTitleView alloc] init];
        segmentView.titleSelectedColor = [UIColor redColor];
        segmentView.delegate = weakSelf;
        segmentView.backgroundColor = [UIColor whiteColor];
        segmentView.titles = titles;
        segmentView.titleColorGradientEnabled = YES;
        
        JXCategoryIndicatorLineView *lineView = [[JXCategoryIndicatorLineView alloc] init];
        //        lineView.indicatorLineViewColor = kBuleBtnColor;
        //        lineView.indicatorLineWidth = 60;
        
        segmentView.indicators = @[lineView];
        
        [weakSelf.view addSubview:segmentView];
        return segmentView;
    };
    JXCategoryTitleView *titleView = createBlock(@[@"视频问诊", @"图文问诊", @"咨询广场"]);
    titleView.cellWidthIncrement = 25;
    self.segment = titleView;
    
    [titleView kjwd_mas_makeConstraints:^(MASConstraintMaker *make, UIView *superview) {
        make.left.equalTo(superview.kjwdMas_safeAreaLeft);
        make.right.equalTo(superview.kjwdMas_safeAreaRight);
        make.top.equalTo(superview.kjwdMas_safeAreaTop);
        make.height.equalTo(@45);
    }];
}


- (void)installContainerView {
    JXCategoryListContainerView *containerView = [[JXCategoryListContainerView alloc] initWithType:JXCategoryListContainerType_ScrollView delegate:self];
    [self.view addSubview:containerView];
    self.segment.contentScrollView = containerView.scrollView;
    
    [containerView kjwd_mas_makeConstraints:^(MASConstraintMaker *make, UIView *superview) {
        make.top.equalTo(self.segment.mas_bottom);
        make.left.equalTo(superview.kjwdMas_safeAreaLeft);
        make.right.equalTo(superview.kjwdMas_safeAreaRight);
        make.bottom.equalTo(superview.kjwdMas_safeAreaBottom);
    }];
    self.listContainerView = containerView;
}

#pragma mark - JXCategoryViewDelegate
- (void)categoryView:(JXCategoryBaseView *)categoryView didClickSelectedItemAtIndex:(NSInteger)index {
    NSLog(@"didClickSelectedItemAtIndex  %d   ", index);
    [self.listContainerView didClickSelectedItemAtIndex:index];
}

- (void)categoryView:(JXCategoryBaseView *)categoryView didSelectedItemAtIndex:(NSInteger)index {
    
    NSLog(@"didSelectedItemAtIndex  %d", index);
    
//    if (index == 1) {
//        self.type = RJProjectMedicineType_Medicine;
//    } else {
//        self.type = RJProjectMedicineType_Project;
//    }
    
//    NSArray *rows = [self.simpleTableView returnRowsInSection:0 handle:^BOOL(__kindof CKJCommonCellModel * _Nonnull m) {
//        return [m isKindOfClass:[CKJTableViewCell1Model class]];
//    }];
//    [self.simpleTableView removeCellModelAtSection:0 rows:rows removeHiddenCellModel:NO];
//    [self.simpleTableView reloadData];
    
//    [self firstNetwork];
}

- (void)categoryView:(JXCategoryBaseView *)categoryView scrollingFromLeftIndex:(NSInteger)leftIndex toRightIndex:(NSInteger)rightIndex ratio:(CGFloat)ratio {
    [self.listContainerView scrollingFromLeftIndex:leftIndex toRightIndex:rightIndex ratio:ratio selectedIndex:categoryView.selectedIndex];
}

#pragma mark - JXCategoryListContainerViewDelegate
- (NSInteger)numberOfListsInlistContainerView:(JXCategoryListContainerView *)listContainerView {
    return 3;
}
- (id<JXCategoryListContentViewDelegate>)listContainerView:(JXCategoryListContainerView *)listContainerView initListForIndex:(NSInteger)index {
    if (index == 1) {
        return self.graphicVC;
    } if (index == 2) {
        return self.advisoryVC;
    } else {
        return self.videoVC;
    }
}




@end
