//
//  RJHomeScrollItem.m
//  MobileHospital_Renji
//
//  Created by chenkaijie on 2019/6/13.
//  Copyright © 2019 Lyc. All rights reserved.
//

#import "RJDemoScrollItemView.h"
#import "UIView+CKJDesingable.h"
#import "NSObject+WDYHFCategory.h"



@implementation RJDemoScrollItemView

- (void)awakeFromNib {
    [super awakeFromNib];
    self.imageV.kBorderColor = [UIColor kjwd_r:220 g:220 b:220 alpha:1];
//    self.imageV.kBorderColor = [UIColor redColor];
    self.imageV.kBorderWidth = 1;
    self.imageV.kCornerRadius = 5;
}


- (IBAction)tap:(UITapGestureRecognizer *)sender {
    CKJMyVCItem *itemData = self.itemData;
    if (itemData.click) {
        itemData.click(nil);
    }
}



- (void)setItemData:(CKJMyVCItem *)itemData {
    _itemData = itemData;
    self.imageV.image = [UIImage kjwd_imageNamed:itemData.image];
    self.lab.text = WDKJ_SpaceString(itemData.title);
}


@end
