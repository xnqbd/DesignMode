//
//  DemoVC.m
//  MobileHospital_Renji
//
//  Created by xnqbd on 2019/12/16.
//  Copyright © 2019 Lyc. All rights reserved.
//

#import "DemoVC.h"

@interface DemoVC ()

@end

@implementation DemoVC


- (UITableViewStyle)simpleTableViewStyle {
    return UITableViewStylePlain;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"注册";
    
    [self.simpleTableView updateStyle:^(CKJSimpleTableViewStyle * _Nonnull style) {
        style.rowHeight = @44;
        style.sectionCornerStyle = [CKJSectionCornerStyle detail:^(__kindof CKJSectionCornerStyle * _Nonnull __weak m) {
            m.corner_Radius = 20;
            m.stroke_Color = [UIColor systemPinkColor];
        }];
    }];
    
    for (int i = 0; i < 2; i++) {

        CKJCommonSectionModel *section1 = [CKJCommonSectionModel sectionWithDetail:^(__kindof CKJCommonSectionModel * _Nonnull _sec) {
            CKJGeneralCellModel *model1 = [CKJGeneralCellModel generalWithCellHeight:@44 cellModel_id:nil detailSettingBlock:^(__kindof CKJGeneralCellModel * _Nonnull m) {
                m.title3Model = [CKJTitle3Model title3ModelWithText:WDCKJAttBold(@"行政部", [UIColor blackColor], @17) left:10];
                m.likePrice8Model = [CKJLikePriceLabel8Model likePriceLabel8ModelWithAttText:WDCKJAttributed2(@"20", [UIColor kjwd_subTitle], @14) left:0 right:15];
            } didSelectRowBlock:nil];
            CKJGeneralCellModel *model2 = [CKJGeneralCellModel generalWithCellHeight:@44 cellModel_id:nil detailSettingBlock:^(__kindof CKJGeneralCellModel * _Nonnull m) {
                m.title3Model = [CKJTitle3Model title3ModelWithText:WDCKJAttributed2(@"张三", [UIColor kjwd_title], nil) left:20];
            } didSelectRowBlock:nil];
            CKJGeneralCellModel *model3 = [CKJGeneralCellModel generalWithCellHeight:@44 cellModel_id:nil detailSettingBlock:^(__kindof CKJGeneralCellModel * _Nonnull m) {
                m.title3Model = [CKJTitle3Model title3ModelWithText:WDCKJAttributed2(@"李四", [UIColor kjwd_title], nil) left:20];
            } didSelectRowBlock:nil];
            _sec.modelArray = @[model1];
        }];
        [self.simpleTableView appendCKJCommonSectionModel:section1];
    }
    

    CKJCommonSectionModel *section1 = [CKJCommonSectionModel sectionWithDetail:^(__kindof CKJCommonSectionModel * _Nonnull _sec) {
        CKJGeneralCellModel *model1 = [CKJGeneralCellModel generalWithCellHeight:@44 cellModel_id:nil detailSettingBlock:^(__kindof CKJGeneralCellModel * _Nonnull m) {
            m.title3Model = [CKJTitle3Model title3ModelWithText:WDCKJAttBold(@"行政部", [UIColor blackColor], @17) left:10];
            m.likePrice8Model = [CKJLikePriceLabel8Model likePriceLabel8ModelWithAttText:WDCKJAttributed2(@"20", [UIColor kjwd_subTitle], @14) left:0 right:15];
        } didSelectRowBlock:nil];
        CKJGeneralCellModel *model2 = [CKJGeneralCellModel generalWithCellHeight:@44 cellModel_id:nil detailSettingBlock:^(__kindof CKJGeneralCellModel * _Nonnull m) {
            m.title3Model = [CKJTitle3Model title3ModelWithText:WDCKJAttributed2(@"张三", [UIColor kjwd_title], nil) left:20];
        } didSelectRowBlock:nil];
        CKJGeneralCellModel *model3 = [CKJGeneralCellModel generalWithCellHeight:@44 cellModel_id:nil detailSettingBlock:^(__kindof CKJGeneralCellModel * _Nonnull m) {
            m.title3Model = [CKJTitle3Model title3ModelWithText:WDCKJAttributed2(@"李四", [UIColor kjwd_title], nil) left:20];
        } didSelectRowBlock:nil];
        _sec.modelArray = @[model1, model2, model3];
    }];
    [self.simpleTableView appendCKJCommonSectionModel:section1];
}

- (void)layoutTableViewFrame:(CKJSimpleTableView *)tableV {
    [tableV kjwd_mas_makeConstraints:^(MASConstraintMaker *make, UIView *superview) {
        make.left.equalTo(superview).offset(15);
        make.centerX.equalTo(superview);
        make.top.equalTo(superview).offset(20);
        make.bottom.equalTo(superview);
    }];
}

@end



