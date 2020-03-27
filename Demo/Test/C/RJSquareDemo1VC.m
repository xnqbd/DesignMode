//
//  RJSquareVC.m
//  MobileHospital_Renji
//
//  Created by chenkaijie on 2019/5/28.
//  Copyright © 2019 Lyc. All rights reserved.
//

#import "RJSquareDemo1VC.h"
#import "CKJStackCell.h"
#import "CKJBaseBtnsCell.h"
#import "RJDemoExpertItemView.h"
#import "CKJBtnsCell1.h"
#import "RJTestResource.h"

@interface RJSquareDemo1VC () <CKJScrollViewCellDelegate>

@end

@implementation RJSquareDemo1VC

#define kHidCellId 128

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"CKJBtnsCell、CKJScrollViewCell示例1";
    [self initSimpleTableViewData];
}

- (nonnull NSDictionary <NSString *, NSDictionary <NSString *, id>*> *)returnCell_Model_keyValues:(CKJSimpleTableView *_Nonnull)s {
    CKJBaseBtnsCellConfig *config1 = [CKJBaseBtnsCellConfig configWithDetail:^(__kindof CKJBaseBtnsCellConfig * _Nonnull c) {
//        m.stackView_Edge_SuperView = UIEdgeInsetsMake(5, 10, 5, 10);
        c.delegate = [c squareWithNumberOfItemsInSingleLine:3];
        c.h_itemSpacing = 20;
    }];
    CKJScrollViewCellConfig *scrollViewCellConfig = [CKJScrollViewCellConfig configWithDetail:^(__kindof CKJScrollViewCellConfig * _Nonnull m) {
        m.itemWidth = 100;
        m.itemSpace = 20;
        m.items_Edge_ScrollView = UIEdgeInsetsMake(15, 20, 15, 20);
        m.delegate = self;
    }];
    return @{
        NSStringFromClass([CKJBtnsCell1Model class]) : @{KJPrefix_cellKEY : NSStringFromClass([CKJBtnsCell1 class]), KJPrefix_isRegisterNibKEY : @NO, KJPrefix_configDicKEY_ConfigModel : config1},
        NSStringFromClass([CKJScrollViewCellModel class]) : @{KJPrefix_cellKEY : NSStringFromClass([CKJScrollViewCell class]), KJPrefix_isRegisterNibKEY : @NO, KJPrefix_configDicKEY_ConfigModel : scrollViewCellConfig},
    };
}

- (void)initSimpleTableViewData {
    
    KJ_typeweakself
    
  
    CKJCommonSectionModel *section1 = [CKJCommonSectionModel sectionWithHeaderAttString:WDCKJAttributed2(@"CKJBtnsCell示例", [UIColor kjwd_subTitle], nil) headerAlignment:NSTextAlignmentLeft detailSetting:^(__kindof CKJCommonSectionModel * _Nonnull _sec) {
        CKJCellModel *model1 = [CKJCellModel ckjCellWithCellHeight:@44 cellModel_id:nil detailSettingBlock:^(__kindof CKJCellModel * _Nonnull m) {
            m.selectionStyle = UITableViewCellSelectionStyleNone;
            m.title3Model = [CKJTitle3Model title3ModelWithText:@"预交金明细" left:15];
            
            m.btn7Model = [CKJCellBtnModel btnModelWithSize:CGSizeMake(60, 30) normalImage:nil rightMargin:12 detailSettingBlock:^(CKJCellBtnModel * _Nonnull sender) {
                sender.normalAttributedTitle = WDCKJAttributed2(@"筛选", [UIColor kjwd_r:25 g:130 b:197 alpha:1], nil);
            } didClickBtnHandle:^(CKJCell * _Nonnull cell, CKJCellBtnModel * _Nonnull btn7Model) {
                NSLog(@"点击筛选");
                if (cell.currentSectionAllCellModelArray.count > 1) return;
                [cell.simpleTableView appendCellModelArray:[weakSelf extensionCellModels] atLastRow_InAllCellModelArrayOfSection:cell.section withRowAnimation:UITableViewRowAnimationTop animationBlock:^(void (^ _Nonnull animationBlock)(void)) {
                    animationBlock();
                }];
            }];
        } didSelectRowBlock:nil];
        _sec.modelArray = @[model1];
    }];
    
    CKJCommonSectionModel *section2 = [CKJCommonSectionModel sectionWithHeaderAttString:WDCKJAttributed2(@"CKJScrollViewCell示例", [UIColor kjwd_subTitle], nil) headerAlignment:NSTextAlignmentLeft detailSetting:^(__kindof CKJCommonSectionModel * _Nonnull _sec) {
        CKJScrollViewCellModel *model2 = [CKJScrollViewCellModel scrollViewWithCellHeight:@160 detailSettingBlock:nil];
        _sec.modelArray = @[model2];
    }];
    
    self.simpleTableView.dataArr = @[section1, section2];
    [self.simpleTableView kjwd_reloadData];
}

- (NSArray <__kindof CKJCommonCellModel *>*)extensionCellModels {
    
    NSString *dateGroupId = @"dateGroupId";
    
    NSMutableArray *cellModels = [NSMutableArray array];
    
    
    KJ_typeweakself
    CKJCellModel *model1 = [CKJCellModel ckjCellWithCellHeight:@40 cellModel_id:nil detailSettingBlock:^(__kindof CKJCellModel * _Nonnull m) {
        [m addGroupId:dateGroupId];
        m.showLine = NO;
        m.selectionStyle = UITableViewCellSelectionStyleNone;
        m.title3Model = [CKJTitle3Model title3ModelWithText:WDCKJAttributed2(@"月份筛选", [UIColor blackColor], @17) left:15];
    } didSelectRowBlock:nil];
    
    [cellModels addObject:model1];
    
    UIImage *image = [UIImage kjwd_imageWithColor:[UIColor kjwd_r:245 g:245 b:245 alpha:1] size:CGSizeMake(150, 50)];
    
    NSArray *titles = @[
        @[@"2019年05月", @"2019年04月", @"2019年03月"],
        @[@"2019年02月", @"2019年01月", @"2018年12月"],
        @[@"2018年11月", @"2018年10月"]
    ];
    
    NSMutableArray *data = [NSMutableArray array];
    
    for (NSArray *temp in titles) {
        NSMutableArray *res = [NSMutableArray array];
        for (NSString *title in temp) {
            [res addObject:@{KJPrefix_cNormalAttTitle : WDAtt13(title), KJPrefix_cNormalBgImage : image, KJPrefix_cCornerRadius : @5}];
        }
        [data addObject:res];
    }
    
    
    NSArray <NSArray <CKJBtnItemData *> *>*items = [CKJBtnItemData returnItemsWithDicsnew:data detailSetting:^(CKJBtnItemData * _Nonnull __weak itemData, NSUInteger index) {
        itemData.click_Button = ^(UIButton * _Nonnull btn, __kindof CKJBtnItemData * _Nonnull itemData) {
            
            CKJCommonTableViewCell *cell = [btn kjwd_getCell];
            
            NSLog(@"点击了  %@ ", cell);
            
            [weakSelf.simpleTableView removeCellModelsByGroupId:dateGroupId inSection:cell.section removeHiddenCellModel:NO withRowAnimation:UITableViewRowAnimationTop animationBlock:^(void (^ _Nonnull animationBlock)(void)) {
                animationBlock();
            }];
            
        };
    }];
    NSArray <CKJCommonCellModel *>*models = [CKJBtnsCell1Model btnsCellModelWithItemsnew:items cellHeight:@44 leftMargin:@15 rightMargin:@15 detailSetting:^(__kindof CKJBaseBtnsCellModel *__weak  _Nonnull m, NSUInteger cellModel_index) {
        [m addGroupId:dateGroupId];
        m.stackView_topMargin = @5;
        m.stackView_bottomMargin = @5;
    }];
    [cellModels addObjectsFromArray:models];
    
    CKJTableViewCell1Model *model4 = [CKJTableViewCell1Model baseTableViewCellWithCellHeight:@40 cellModel_id:nil detailSettingBlock:^(__kindof CKJTableViewCell1Model * _Nonnull m) {
        [m addGroupId:dateGroupId];
        m.showLine = NO;
        m.selectionStyle = UITableViewCellSelectionStyleNone;
        m.textLabelAttStr = WDCKJAttributed2(@"显示最近半年明细", [UIColor kjwd_subTitle], @13.5);
        m.textAlignment = NSTextAlignmentCenter;
    } didSelectRowBlock:nil];
    [cellModels addObject:model4];
    
    return cellModels;
}

#pragma mark - CKJScrollViewCellDelegate
- (NSArray <__kindof CKJScrollViewCellItemView *>*)createItemViewForCKJScrollViewCell:(__kindof CKJScrollViewCell *_Nonnull __weak)cell {
    NSMutableArray *arr = [NSMutableArray array];
    
    NSArray <NSDictionary *>*data = [RJTestResource item1];
    
    for (int i = 0; i < data.count; i++) {
        NSDictionary *dic = data[i];
        RJDemoExpertItemData *temp = [RJDemoExpertItemData modelWithDic:dic];
        
        __weak RJDemoExpertItemData *weakTemp = temp;
        
        temp.tapBlock = ^{
          NSLog(@"点击了 %@   ", weakTemp.name);
        };
        RJDemoExpertItemView *view = [RJDemoExpertItemView kjwd_instanceUsingAutoNib];
        view.itemData = temp;
        [arr addObject:view];
    }
    return arr;
}

@end
