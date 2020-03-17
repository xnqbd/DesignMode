//
//  GraphicCell.h
//  Demo
//
//  Created by admin2 on 2020/3/17.
//  Copyright © 2020 admin2. All rights reserved.
//

#import "CKJCommonTableViewCell.h"

NS_ASSUME_NONNULL_BEGIN





@interface GraphicCellModel : CKJCommonCellModel



@end




@interface GraphicCell : CKJCommonTableViewCell


@property (weak, nonatomic) IBOutlet UILabel *contentLab;


/// 0个回答
@property (weak, nonatomic) IBOutlet UILabel *answerNumLab;

/// 采纳状态
@property (weak, nonatomic) IBOutlet UILabel *adoptionStatusLab;

/// 回答状态
@property (weak, nonatomic) IBOutlet UILabel *answerStatusLab;



@property (weak, nonatomic) IBOutlet UILabel *personLab;
@property (weak, nonatomic) IBOutlet UILabel *dateLab;

@end

NS_ASSUME_NONNULL_END
