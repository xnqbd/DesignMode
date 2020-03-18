//
//  RJScrollViewCellVC.m
//  MobileHospital_Renji
//
//  Created by chenkaijie on 2019/6/18.
//  Copyright © 2019 Lyc. All rights reserved.
//

#import "RJSquareDemo2VC.h"
#import "CKJBaseBtnsCell.h"
#import "CKJScrollViewCell.h"
#import "RJDemoScrollItemView.h"
#import "UIView+CKJDesingable.h"
#import "CKJBtnsCell1.h"
#import "CKJBtnsCell2.h"
#import "RJTestResource.h"

@interface RJSquareDemo2VC ()<CKJScrollViewCellDelegate>

@end

@implementation RJSquareDemo2VC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"CKJBtnsCell、CKJScrollViewCell示例2";
    [self initSimpleTableViewData];
}

#define kHiddenCellId @"kHiddenCellId"

#define kHeight 100
#define kBottom 10

#pragma mark - CKJSimpleTableView 数据源 和 代理
- (nonnull NSDictionary <NSString *, NSDictionary <NSString *, id>*> *)returnCell_Model_keyValues:(CKJSimpleTableView *_Nonnull)s {
    
    CKJBaseBtnsCellConfig *config1 = [CKJBaseBtnsCellConfig configWithDetailSettingBlock:^(CKJBaseBtnsCellConfig * _Nonnull m) {
        m.fixHeight = 30;
        m.delegate = [m squareWithNumberOfItemsInSingleLine:4];
    }];
    CKJBaseBtnsCellConfig *config2 = [CKJBaseBtnsCellConfig configWithDetailSettingBlock:^(CKJBaseBtnsCellConfig * _Nonnull m) {
        m.delegate = [m squareWithNumberOfItemsInSingleLine:3];
        m.multiHeightByStackView = @0.6;
        m.separatorViewColor = [UIColor kjwd_r:230 g:230 b:230 alpha:1];
        m.h_itemSpacing = 1;
        m.detailSetting = ^(UIView * _Nonnull stackView_superView) {
            stackView_superView.kCornerRadius = (kHeight - 2 * kBottom) / 2.0;
            stackView_superView.kBorderColor = [UIColor kjwd_230Color];
            stackView_superView.kBorderWidth = 1;
        };
    }];
    CKJScrollViewCellConfig *scrollViewCellConfig = [CKJScrollViewCellConfig configWithDetailSettingBlock:^(__kindof CKJScrollViewCellConfig * _Nonnull m) {
        m.itemWidth = 120;
        m.itemSpace = 20;
        m.items_Edge_ScrollView = UIEdgeInsetsMake(10, 20, 10, 20);
//        m.scrollView_Edge_SuperView = UIEdgeInsetsMake(10, 20, 10, 20);
        m.delegate = self;
        [m updateIndicatorConfig:^(CKJScrollViewCellIndicatorConfig * _Nonnull i) {
            i.bottom = 10;
            i.longViewHeight = 5;
        }];
    }];
    return @{
        NSStringFromClass([CKJBtnsCell1Model class]) : @{KJPrefix_cellKEY : NSStringFromClass([CKJBtnsCell1 class]), KJPrefix_isRegisterNibKEY : @NO, KJPrefix_configDicKEY_ConfigModel : config1},
        NSStringFromClass([CKJBtnsCell2Model class]) : @{KJPrefix_cellKEY : NSStringFromClass([CKJBtnsCell2 class]), KJPrefix_isRegisterNibKEY : @NO, KJPrefix_configDicKEY_ConfigModel : config2},
        NSStringFromClass([CKJScrollViewCellModel class]) : @{KJPrefix_cellKEY : NSStringFromClass([CKJScrollViewCell class]), KJPrefix_isRegisterNibKEY : @NO, KJPrefix_configDicKEY_ConfigModel : scrollViewCellConfig}
    };
}

- (void)initSimpleTableViewData {
    
    KJ_typeweakself
    
    CKJCommonSectionModel *section1 = [CKJCommonSectionModel sectionWithHeaderAttString:WDCKJAttributed2(@"CKJBtnsCell示例", [UIColor kjwd_subTitle], nil) headerAlignment:NSTextAlignmentLeft detailSetting:^(__kindof CKJCommonSectionModel * _Nonnull _sec) {
        NSArray *data = [RJTestResource item3];
        data = [CKJBtnItemData returnItemsWithDicsnew:data detailSetting:^(CKJBtnItemData *__weak  _Nonnull itemData, NSUInteger index) {
            itemData.layout_Button = ^(UIButton * _Nonnull btn) {
                [btn kjwd_layoutButtonWithEdgeInsetsStyle:GLButtonEdgeInsetsStyleTop imageTitleSpace:10];
            };
            itemData.click_Button = ^(UIButton * _Nonnull btn, __kindof CKJBtnItemData * _Nonnull itemData) {
                if ([itemData.normalAttTitle.string isEqualToString:@"更多"]) {
                    if (itemData.selected) {
                    } else {
                        itemData.selected = YES;
                        [weakSelf.simpleTableView kjwd_filterCellModelForID:kHiddenCellId finishBlock:^(__kindof CKJCommonCellModel * _Nonnull m) {
                            m.displayInTableView = YES;
                        }];
                        [weakSelf.simpleTableView reloadData];
                    }
                }
            };
        }];
        
        CGFloat topMargin = 10, centerMargin = 10, bottomMargin = 10;
        
        NSArray <CKJBaseBtnsCellModel *>*arr = [CKJBtnsCell1Model btnsCellModelWithItemsnew:data cellHeight:@(UITableViewAutomaticDimension) leftMargin:@10 rightMargin:@10 detailSetting:^(__kindof CKJBaseBtnsCellModel *__weak  _Nonnull m, NSUInteger cellModel_index) {
            if (cellModel_index == 0) {
                m.stackView_topMargin = @(topMargin);
                m.stackView_bottomMargin = @(centerMargin / 2.0);
            } else if (cellModel_index == 1) {
                m.stackView_topMargin = @(centerMargin / 2.0);
                m.stackView_bottomMargin = @(centerMargin / 2.0);
            } else if (cellModel_index == 2) {
                m.stackView_topMargin = @(centerMargin / 2.0);
                m.stackView_bottomMargin = @(bottomMargin);
                m.cellModel_id = kHiddenCellId;
                m.displayInTableView = NO;
            }
        }];
        _sec.modelArray = arr;
    }];
    CKJCommonSectionModel *section2 = [CKJCommonSectionModel sectionWithHeaderAttString:WDCKJAttributed2(@"CKJBtnsCell示例", [UIColor kjwd_subTitle], nil) headerAlignment:NSTextAlignmentLeft detailSetting:^(__kindof CKJCommonSectionModel * _Nonnull _sec) {
        NSArray <CKJBtnItemData *>*items = [CKJBtnItemData returnItemsWithDics:[RJTestResource item4] detailSetting:^(CKJBtnItemData * _Nonnull __weak itemData, NSUInteger index) {
            itemData.layout_Button = ^(UIButton * _Nonnull btn) {
                [btn kjwd_layoutButtonWithEdgeInsetsStyle:GLButtonEdgeInsetsStyleTop imageTitleSpace:10];
            };
        }];
        
        NSArray <CKJCommonCellModel *>*arr = [CKJBtnsCell2Model btnsCellModelWithItemsnew:@[items] cellHeight:@100 leftMargin:@15 rightMargin:@15 detailSetting:^(__kindof CKJBaseBtnsCellModel *__weak  _Nonnull m, NSUInteger cellModel_index) {
            m.stackView_topMargin = @(kBottom);
            m.stackView_bottomMargin = @(kBottom);
        }];
        
        _sec.modelArray = arr;
    }];
    
    CKJCommonSectionModel *section3 = [CKJCommonSectionModel sectionWithHeaderAttString:WDCKJAttributed2(@"CKJScrollViewCell示例", [UIColor kjwd_subTitle], nil) headerAlignment:NSTextAlignmentLeft detailSetting:^(__kindof CKJCommonSectionModel * _Nonnull _sec) {
        
        CKJScrollViewCellModel *model1 = [CKJScrollViewCellModel scrollViewWithCellHeight:@100 detailSettingBlock:nil];
        _sec.modelArray = @[model1];
    }];
    
    self.simpleTableView.dataArr = @[section1, section2, section3];
    [self.simpleTableView kjwd_reloadData];
}

#pragma mark - CKJScrollViewCellDelegate
- (NSArray <__kindof CKJScrollViewCellItemView *>*)createItemViewForCKJScrollViewCell:(__kindof CKJScrollViewCell *_Nonnull __weak)cell {
    NSArray *data = @[
        [CKJMyVCItem itemWithImage:@"newhome_入院取号" title:@"入院取号" click:^(id  _Nonnull param) {

        }],
        [CKJMyVCItem itemWithImage:@"newhome_出院取号" title:@"出院取号" click:^(id  _Nonnull param) {
            
        }],
        [CKJMyVCItem itemWithImage:@"newhome_住院清单" title:@"住院日清单" click:^(id  _Nonnull param) {
            
        }],
        [CKJMyVCItem itemWithImage:@"newhome_出院取号2" title:@"出院取号" click:^(id  _Nonnull param) {
            
        }],
        [CKJMyVCItem itemWithImage:@"newhome_出院取号3" title:@"出院取号" click:^(id  _Nonnull param) {
            
        }],
        [CKJMyVCItem itemWithImage:@"newhome_出院取号4" title:@"出院取号" click:^(id  _Nonnull param) {
            
        }]
    ];
    
    NSMutableArray *arr = [NSMutableArray array];
    for (int i = 0; i < data.count; i++) {
        CKJMyVCItem *itemData = data[i];
        RJDemoScrollItemView *itemView = [RJDemoScrollItemView kjwd_instanceUsingAutoNib];
        itemView.itemData = itemData;
        [arr addObject:itemView];
    }
    return arr;
}


@end
