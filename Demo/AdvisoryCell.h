//
//  AdvisoryCell.h
//  Demo
//
//  Created by admin2 on 2020/3/17.
//  Copyright © 2020 admin2. All rights reserved.
//

#import "CKJCommonTableViewCell.h"



NS_ASSUME_NONNULL_BEGIN


@interface AdvisoryCellModel : CKJCommonCellModel



@end


@interface AdvisoryCell : CKJCommonTableViewCell

@property (weak, nonatomic) IBOutlet UILabel *contentLab;
@property (weak, nonatomic) IBOutlet UILabel *personLab;
@property (weak, nonatomic) IBOutlet UILabel *dateLab;


@end

NS_ASSUME_NONNULL_END
