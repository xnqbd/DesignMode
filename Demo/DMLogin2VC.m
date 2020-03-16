//
//  DMLogin2VC.m
//  Demo
//
//  Created by admin2 on 2020/3/16.
//  Copyright © 2020 admin2. All rights reserved.
//

#import "DMLogin2VC.h"

@interface DMLogin2VC ()

@end

@implementation DMLogin2VC

- (UITableViewStyle)simpleTableViewStyle {
    return UITableViewStylePlain;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.simpleTableView updateStyle:^(CKJSimpleTableViewStyle * _Nonnull s) {
        s.onlyViewEdge = [NSValue valueWithUIEdgeInsets:UIEdgeInsetsMake(0, 20, 0, 20)];
    }];
    
    CKJCommonSectionModel *section1 = [CKJCommonSectionModel sectionWithDetailSetting:^(__kindof CKJCommonSectionModel * _Nonnull _sec) {
        CKJImageViewCellModel *model1 = [CKJImageViewCellModel imageViewWithCellHeight:@230 detailSettingBlock:^(__kindof CKJImageViewCellModel * _Nonnull m) {
            [m updateBGConfig:^(CKJCommonCellBGImageViewConfig * _Nonnull bg) {
                bg.edge = [NSValue valueWithUIEdgeInsets:UIEdgeInsetsZero];
            }];
            m.showLine = NO;
            m.localImage = [UIImage kjwd_imageNamed:@"背景"];
        } updateConstraint:^(MASConstraintMaker * _Nonnull make, UIView * _Nonnull superview) {
            make.edges.equalTo(superview);
        }];
        
        CGSize size = CGSizeMake(25, 25);
        CGFloat left = 15;
        NSValue *edge = [NSValue valueWithUIEdgeInsets:UIEdgeInsetsMake(10, 20, 10, 20)];
        
        CKJInputCellModel *phone = [CKJInputCellModel inputWithCellHeight:@60 cellModel_id:kOInput_Phone detailSettingBlock:^(__kindof CKJInputCellModel * _Nonnull m) {
            m.showLine = NO;
            [m updateBGConfig:^(CKJCommonCellBGImageViewConfig * _Nonnull bg) {
                bg.image = [UIImage kjwd_imageNamed:@"login_input"];
                bg.edge = edge;
            }];
            m.image2Model = [CKJImage2Model image2ModelWithImageString:@"login_icon_number" size:size left:left];
            m.title3Model = [CKJTitle3Model title3ModelWithAttributedText:nil left:10];
            [m updateTFModel:^(CKJTFModel * _Nonnull tfModel) {
                tfModel.clearButtonMode = UITextFieldViewModeWhileEditing;
            }];
            [m addRequired:[CKJInputExpressionRequiredModel system_phoneRegError]];
        }];
        
        
        CKJInputCellModel *pwd = [CKJInputCellModel inputWithCellHeight:@60 cellModel_id:kOInput_Pwd detailSettingBlock:^(__kindof CKJInputCellModel * _Nonnull m) {
            m.showLine = NO;
            [m updateBGConfig:^(CKJCommonCellBGImageViewConfig * _Nonnull bg) {
                bg.image = [UIImage kjwd_imageNamed:@"login_input"];
                bg.edge = edge;
            }];
            m.image2Model = [CKJImage2Model image2ModelWithImageString:@"login_icon_key" size:size left:left];
            m.title3Model = [CKJTitle3Model title3ModelWithAttributedText:nil left:10];
            [m updateTFModel:^(CKJTFModel * _Nonnull tfModel) {
                tfModel.clearButtonMode = UITextFieldViewModeWhileEditing;
            }];
            m.btn7Model = [CKJCellBtnModel btnModelWithSize:CGSizeMake(17, 17) normalImage:[UIImage kjwd_imageNamed:@"login_btn_password_off"] rightMargin:10 detailSettingBlock:^(CKJCellBtnModel * _Nonnull sender) {
                sender.selectedImage = [UIImage kjwd_imageNamed:@"login_btn_password_on"];
            } didClickBtnHandle:^(CKJInputCell * _Nonnull cell, CKJCellBtnModel * _Nonnull btnModel) {
                btnModel.selected = !btnModel.selected;
                [((CKJInputCellModel *)cell.cellModel) updateTFModel:^(CKJTFModel * _Nonnull tfModel) {
                    tfModel.secureTextEntry = btnModel.selected;
                }];
                [cell.simpleTableView reloadData];
            }];
//            [m addRequired:[CKJInputExpressionRequiredModel system_phoneRegError]];
        }];
        
        
        CKJOneBtnCellModel *login = [CKJOneBtnCellModel oneBtnWithCellHeight:@50 title:@"登录" detailSettingBlock:^(__kindof CKJOneBtnCellModel * _Nonnull m) {
            [m updateBtnData:^(CKJBtnItemData * _Nonnull btnData) {
                btnData.cornerRadius = 3;
                btnData.normalBgImage = [UIImage kjwd_imageWithColor:[UIColor redColor] size:CGSizeMake(300, 40)];
            }];
        } clickBtn:^(__kindof CKJOneBtnCellModel * _Nonnull cm, UIButton * _Nonnull btn) {
            NSLog(@"%@   ", @"点击登录");
        } updateConstraint:^(MASConstraintMaker * _Nonnull make, UIView * _Nonnull superview) {
            make.edges.equalTo(superview);
        }];
        
        _sec.modelArray = @[model1, phone, pwd, login];
    }];
    
    self.simpleTableView.dataArr = @[section1];
}

@end
