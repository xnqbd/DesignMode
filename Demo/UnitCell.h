//
//  UnitCell.h
//  Demo
//
//  Created by admin2 on 2020/3/20.
//  Copyright © 2020 admin2. All rights reserved.
//

#import "UIView+CKJDesingable.h"

NS_ASSUME_NONNULL_BEGIN

@interface UnitCell : CKJBottomLineView

@property (strong, nonatomic) IBOutlet UILabel *title;
@property (strong, nonatomic) IBOutlet UIButton *btn;
@property (strong, nonatomic) IBOutlet UILabel *unitLab;


- (void)_setTitle:(NSString *)title btnTitle:(NSString *_Nullable)btnTitle
             unit:(NSString *_Nullable)unit
            click:(void(^)(UIButton * _Nonnull __weak _sender))click;


@end

NS_ASSUME_NONNULL_END
