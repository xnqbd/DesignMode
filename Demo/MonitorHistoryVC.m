//
//  MonitorHistoryVC.m
//  Demo
//
//  Created by admin2 on 2020/3/24.
//  Copyright © 2020 admin2. All rights reserved.
//

#import "MonitorHistoryVC.h"
#import "CKJSimpleTableView.h"
#import "MonitorHistoryCell.h"
#import "MonitorInputVC2.h"
#import "NaVC.h"

@interface MonitorHistoryVC () <CKJSimpleTableViewDataSource, CKJSimpleTableViewDelegate>



@property (weak, nonatomic) IBOutlet UILabel *oneLab;
@property (weak, nonatomic) IBOutlet UILabel *numLab;
@property (weak, nonatomic) IBOutlet UILabel *unitLab;
@property (weak, nonatomic) IBOutlet UILabel *fourLab;
@property (weak, nonatomic) IBOutlet CKJSimpleTableView *simpleTableView;

@property (weak, nonatomic) IBOutlet UIButton *recordBtn;

@end

@implementation MonitorHistoryVC

- (nonnull NSDictionary <NSString *, NSDictionary <NSString *, id>*> *)returnCell_Model_keyValues:(CKJSimpleTableView *_Nonnull)s {
    return @{
        NSStringFromClass([MonitorHistoryCellModel class]) : @{KJPrefix_cellKEY : NSStringFromClass([MonitorHistoryCell class]), KJPrefix_isRegisterNibKEY : @YES}
    };
}
- (void)tableView:(CKJSimpleTableView *)tableView willDisplayCell:(__kindof CKJCommonTableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath section:(NSInteger)section row:(NSInteger)row model:(__kindof CKJCommonCellModel *)model sectionModel:(CKJCommonSectionModel *)sectionModel {
    if ([cell isKindOfClass:[MonitorHistoryCell class]]) {
        MonitorHistoryCell *_cell = cell;
        
        if (model.extension_Interger != YES) {
            _cell.coverV.layer.transform = CATransform3DIdentity;
            [UIView animateWithDuration:0.5 animations:^{
                _cell.coverV.layer.transform = CATransform3DMakeTranslation(cell.kjwd_width, 0, 0);
            }];
            model.extension_Interger = YES;
        }
    }
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = _type;
    
    self.simpleTableView.contentInset = UIEdgeInsetsMake(22, 0, 0, 0);
    self.simpleTableView.backgroundColor = [UIColor clearColor];
    self.simpleTableView.simpleTableViewDataSource = self;
    self.simpleTableView.simpleTableViewDelegate = self;
    [self.simpleTableView updateStyle:^(CKJSimpleTableViewStyle * _Nonnull s) {
        s.rowHeight = @44;
    }];
    
    if ([_type isEqualToString:@"血糖"]) {
        self.view.backgroundColor = [UIColor kjwd_r:245 g:118 b:130 alpha:1];
        self.oneLab.text = @"早餐前";
        self.numLab.attributedText =  WDCKJAttBold(@"7.6", [UIColor whiteColor], @50);
        self.unitLab.text = @"mmol/L";
        self.fourLab.text = @"高血糖";
    } else if ([_type isEqualToString:@"睡眠"]) {
        self.view.backgroundColor = [UIColor kjwd_r:85 g:113 b:225 alpha:1];
        self.oneLab.text = @"睡眠时长";
        NSMutableAttributedString *temp = WDCKJAttAppend(@"9", [UIColor whiteColor], @50, @"小时", [UIColor whiteColor], @15);
        [temp appendAttributedString:WDCKJAttAppend(@"45", [UIColor whiteColor], @50, @"分钟", [UIColor whiteColor], @15)];
        self.numLab.attributedText = temp;
//        self.unitLab.text = @"";
//        self.fourLab.text = @"";
    } else if ([_type isEqualToString:@"体重"]) {
        self.view.backgroundColor = [UIColor kjwd_r:90 g:169 b:248 alpha:1];
        self.oneLab.attributedText = WDCKJAttAppend([NSString stringWithFormat:@"身高:%@cm   ", @"170"], [UIColor whiteColor], @15, [NSString stringWithFormat:@"BMI:%@", @"27.9"], [UIColor whiteColor], @15);
        self.numLab.attributedText = WDCKJAttBold(@"70kg", [UIColor whiteColor], @50);
//        self.unitLab.text = @"";
        self.fourLab.text = @"肥胖";
    } else if ([_type isEqualToString:@"血压"]) {
        self.view.backgroundColor = [UIColor kjwd_r:90 g:86 b:188 alpha:1];
        self.oneLab.text = @"收缩压/舒张压mmhg";
        self.numLab.attributedText =  WDCKJAttBold(@"142/78", [UIColor whiteColor], @50);
        self.fourLab.text = @"轻度高血压";
    } else if ([_type isEqualToString:@"运动"]) {
        self.view.backgroundColor = [UIColor kjwd_r:253 g:170 b:81 alpha:1];
        self.oneLab.text = @"运动时长 min";
        self.numLab.attributedText =  WDCKJAttBold(@"70", [UIColor whiteColor], @50);
        self.fourLab.text = @"步行";
    }
    
    [_recordBtn setTitle:[NSString stringWithFormat:@"记录%@", _type] forState:UIControlStateNormal];
    [self createData];
}


- (IBAction)recordingAction:(UIButton *)sender {
    MonitorInputVC2 *vc = [[MonitorInputVC2 alloc] init];
    vc.type = _type;
    vc.typeColor = self.view.backgroundColor;
    NaVC *navc = [[NaVC alloc] initWithRootViewController:vc];
    [self presentViewController:navc animated:YES completion:nil];
}

- (void)createData {

    CKJCommonSectionModel *section1 = [CKJCommonSectionModel sectionWithDetailSetting:^(__kindof CKJCommonSectionModel * _Nonnull _sec) {
        
        CKJGeneralCellModel *model1 = [CKJGeneralCellModel generalWithTitle:WDCKJAttBold(@"历史记录", [UIColor blackColor], @16) arrow:NO didSelectRowBlock:nil];
        model1.lineEdge = [NSValue valueWithUIEdgeInsets:UIEdgeInsetsZero];
        [_sec addCellModel:model1];
        
        [_sec addCellModels:[NSMutableArray kjwd_enumTo:100 returnItemBlock:^id _Nonnull(NSUInteger i) {
            MonitorHistoryCellModel *m = [MonitorHistoryCellModel new];
            m.lineEdge = [NSValue valueWithUIEdgeInsets:UIEdgeInsetsZero];
            return m;
        }]];
        

//        _sec.modelArray = @[model1, model2, model3, model4];
    }];
    
    self.simpleTableView.dataArr = @[section1];
}



@end
