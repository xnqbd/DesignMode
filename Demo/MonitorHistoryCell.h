//
//  MonitorHistoryCell.h
//  Demo
//
//  Created by admin2 on 2020/3/26.
//  Copyright © 2020 admin2. All rights reserved.
//

#import "CKJCommonTableViewCell.h"

NS_ASSUME_NONNULL_BEGIN



@interface MonitorHistoryCellModel : CKJCommonCellModel

@end

@interface MonitorHistoryCell : CKJCommonTableViewCell

@property (strong, nonatomic) IBOutlet UILabel *timeLab;
@property (strong, nonatomic) IBOutlet UILabel *centerLab;
@property (strong, nonatomic) IBOutlet UILabel *rightLab;

@end

NS_ASSUME_NONNULL_END
