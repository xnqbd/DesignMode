//
//  CKJCKJBaseTableVC.h
//  HKGoodColor
//
//  Created by chenkaijie on 2017/12/26.
//  Copyright © 2017年 chenkaijie. All rights reserved.
//

#import "CKJBaseViewController.h"
#import "CKJSimpleTableView.h"

NS_ASSUME_NONNULL_BEGIN

/*

CKJCommonSectionModel *section1 = [CKJCommonSectionModel sectionWithDetail:^(__kindof CKJCommonSectionModel * _Nonnull _sec) {
    
 
    
 
    _sec.modelArray = @[model1, model2, model3, model4];
}];

self.simpleTableView.dataArr = @[section1];


*/




#warning  注意: 继承于本来的子类， 需实现 CKJSimpleTableViewDataSource 协议
@interface CKJBaseTableVC : CKJBaseViewController <CKJSimpleTableViewDataSource, CKJSimpleTableViewDelegate, TitleStyleHeaderFooterViewDelegate>


@property (strong, nonatomic) IBOutlet CKJSimpleTableView *simpleTableView;
- (UITableViewStyle)simpleTableViewStyle;

/**
 CKJSimpleTableView的约束或者 frame
 */
- (void)layoutTableViewFrame:(CKJSimpleTableView *)tableV;

- (void)initSimpleTableViewData;


/// 添加尾视图
- (void)createFooterViewWithBtnTitle:(NSString *)title clickHandle:(void(^_Nullable)(UIButton * _Nonnull sender, __kindof CKJBaseTableVC *se, CKJSimpleTableView *simpleTableView))clickHandle;


@end

NS_ASSUME_NONNULL_END
