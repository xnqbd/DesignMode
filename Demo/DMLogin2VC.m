//
//  DMLogin2VC.m
//  Demo
//
//  Created by admin2 on 2020/3/16.
//  Copyright © 2020 admin2. All rights reserved.
//

#import "DMLogin2VC.h"
#import "HomeVC.h"

@interface DMLogin2VC ()

@end

@implementation DMLogin2VC

- (UITableViewStyle)simpleTableViewStyle {
    return UITableViewStylePlain;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.simpleTableView.backgroundColor = [UIColor whiteColor];
    
    [self.simpleTableView updateStyle:^(CKJSimpleTableViewStyle * _Nonnull s) {
        s.onlyViewEdge = [NSValue valueWithUIEdgeInsets:UIEdgeInsetsMake(0, 20, 0, 20)];
    }];

    CKJCellModel *(^block)(NSString *rightTitle, CKJBlockType1 agree) = ^CKJCellModel *(NSString *rightTitle, CKJBlockType1 agree) {

        CKJCellModel *one = [CKJCellModel ckjCellWithCellHeight:@30 cellModel_id:nil detailSettingBlock:^(__kindof CKJCellModel * _Nonnull m) {
            m.selectionStyle = UITableViewCellSelectionStyleNone;
            m.showLine = NO;
            m.image2Model = [CKJImage2Model image2ModelWithNormalImage:[UIImage kjwd_imageNamed:@"login_radio"] size:[NSValue valueWithCGSize:CGSizeMake(50, 25)] left:10 detail:^(CKJImage2Model * _Nonnull i) {
                i.selectedImage = [UIImage kjwd_imageNamed:@"login_radio_sle"];
                i.normalAttributedTitle = WDCKJAttributed2(@" 同意", [UIColor orangeColor], @13);
            } click:^(CKJBaseBtnModel * _Nonnull btnModel, UIButton * _Nonnull btn) {
                btnModel.selected = !btnModel.selected;
                btn.selected = btnModel.selected;
            }];
            m.subTitle4Model = [CKJSubTitle4Model subTitle4ModelWithAttributedText:WDCKJAttributed2(rightTitle, [UIColor kjwd_title], @13) top:0 left:0 bottom:0 right:0 click:^(__kindof CKJCell * _Nonnull c) {
                NSLog(@"点击 《用户协议》");
            }];
        } didSelectRowBlock:nil];
        return one;
    };
    
    
    
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
        
//        int aa = 0x11;  // -1
        
        CKJCellModel *agree1 = block(@"《用户协议》", ^{
            
        });
        CKJCellModel *agree2 = block(@"《用户隐私协议》", ^{
            
        });

        __weak typeof(self) weakSelf = self;
        CKJOneBtnCellModel *login = [CKJOneBtnCellModel oneBtnWithCellHeight:@44 title:@"登录" detailSettingBlock:^(__kindof CKJOneBtnCellModel * _Nonnull m) {
            [m updateBtnData:^(CKJBtnItemData * _Nonnull btnData) {
                btnData.normalBgImage = [UIImage kjwd_imageWithColor:[UIColor redColor] size:CGSizeMake(300, 40)];
            }];
        } clickBtn:^(__kindof CKJOneBtnCellModel * _Nonnull cm, UIButton * _Nonnull btn) {
            NSLog(@"%@   ", @"点击登录");
            
            HomeVC *vc = [[HomeVC alloc] init];
            [weakSelf.navigationController pushViewController:vc animated:YES];
            
        } updateConstraint:^(MASConstraintMaker * _Nonnull make, UIView * _Nonnull superview) {
            make.edges.equalTo(superview);
        }];
        
        
        CKJEmptyCellModel *emp = [CKJEmptyCellModel emptyCellModelWithHeight:15 showLine:NO];
        [emp updateBGConfig:^(CKJCommonCellBGImageViewConfig * _Nonnull bg) {
            bg.bgColor = [UIColor whiteColor];
        }];
        
        _sec.modelArray = @[model1, phone, pwd, agree1, agree2, emp, login];
    }];
    
    self.simpleTableView.dataArr = @[section1];
}

@end
