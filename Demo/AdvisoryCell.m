//
//  AdvisoryCell.m
//  Demo
//
//  Created by admin2 on 2020/3/17.
//  Copyright © 2020 admin2. All rights reserved.
//

#import "AdvisoryCell.h"
#import "NetWorkResponse.h"

@implementation AdvisoryCellModel

@end


@implementation AdvisoryCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.dateLab.textColor = [UIColor kjwd_subTitle];
}

- (void)setupData:(__kindof CKJCommonCellModel *)model section:(NSInteger)section row:(NSInteger)row selectIndexPath:(NSIndexPath *)indexPath tableView:(CKJSimpleTableView *)tableView {
    
    AdvisoryNetData *data = model.networkData;
    
    self.contentLab.text = WDKJ_SpaceString(data.content);
    self.personLab.text = WDKJ_SpaceString(data.personName);
    self.dateLab.text = WDKJ_SpaceString(data.date);
}

@end
