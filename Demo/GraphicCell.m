//
//  GraphicCell.m
//  Demo
//
//  Created by admin2 on 2020/3/17.
//  Copyright © 2020 admin2. All rights reserved.
//

#import "GraphicCell.h"
#import "NetWorkResponse.h"

@implementation GraphicCellModel


@end


@implementation GraphicCell


- (void)awakeFromNib {
    [super awakeFromNib];
    self.dateLab.textColor = [UIColor kjwd_subTitle];
}

- (void)setupData:(__kindof CKJCommonCellModel *)model section:(NSInteger)section row:(NSInteger)row selectIndexPath:(NSIndexPath *)indexPath tableView:(CKJSimpleTableView *)tableView {
    
    GraphicNetData *data = model.networkData;
    
    self.contentLab.text = WDKJ_SpaceString(data.content);
    self.personLab.text = WDKJ_SpaceString(data.personName);
    self.dateLab.text = WDKJ_SpaceString(data.date);
    
    self.answerNumLab.text = [NSString stringWithFormat:@"%@个回答", data.answerNum];
    self.adoptionStatusLab.text = WDKJ_SpaceString(data.adoptionStatus);
    self.answerStatusLab.text = WDKJ_SpaceString(data.answerStatus);
}


@end
