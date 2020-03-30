//
//  MonitorInstrumentCell.h
//  Demo
//
//  Created by admin2 on 2020/3/27.
//  Copyright © 2020 admin2. All rights reserved.
//

#import "CKJCommonTableViewCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface MonitorInstrumentCellModel : CKJCommonCellModel

@end

@interface MonitorInstrumentCell : CKJCommonTableViewCell

@property (strong, nonatomic) IBOutlet UIView *thebgV;

@property (strong, nonatomic) IBOutlet UILabel *topLab;
@property (strong, nonatomic) IBOutlet UILabel *bottomLab;

@end

NS_ASSUME_NONNULL_END
