//
// CKJCommonTableViewCell.m
//  HKGoodColor
//
//  Created by chenkaijie on 2017/12/21.
//  Copyright © 2017年 chenkaijie. All rights reserved.
//

#import "CKJCommonTableViewCell.h"
#import "CKJSimpleTableView.h"
#import "NSObject+WDYHFCategory.h"
#import <Masonry/Masonry.h>



@interface CKJCommonCellOnlyView : UIView
@end
@implementation CKJCommonCellOnlyView
@end






@implementation CKJCommonCellConfig

+ (instancetype)cellConfigWithDetail:(nullable CKJCommonCellConfigBlock)detailSettingBlock {
    return [super configWithDetail:detailSettingBlock];
}

@end


@interface CKJCommonTableViewCell ()




@property (assign, nonatomic) NSInteger section;
@property (assign, nonatomic) NSInteger row;

@property (weak, nonatomic) CKJSimpleTableView *simpleTableView;
@property (weak, nonatomic) CKJCommonSectionModel *sectionModel;

@end

@implementation CKJCommonTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier configDic:(NSDictionary *)configDic {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.readOnly_configDic = configDic;
        [self kjInit];

        [self setupSubViews];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        [self kjInit];
    }
    return self;
}

- (void)kjInit {
    
    
    UIView *onlyView = [[CKJCommonCellOnlyView alloc] init];
    [self.contentView insertSubview:onlyView atIndex:0];
    [onlyView kjwd_mas_makeConstraints:^(MASConstraintMaker *make, UIView *superview) {
//        make.center.equalTo(superview);
//        make.width.equalTo(superview).priority(900);
//        make.height.equalTo(superview).priority(900);
#warning 如果这里变了，在setupData也要更新约束
        make.left.equalTo(superview).offset(0);
        make.right.equalTo(superview).offset(0).priority(900);
        make.top.equalTo(superview).offset(0);
        make.bottom.equalTo(superview).offset(0).priority(900);
    }];
    self.onlyView = onlyView;
    self.subviews_SuperView = onlyView;
    
    UIImageView *imageV = [[UIImageView alloc] init];
    [self.contentView insertSubview:imageV atIndex:0];
    self.bgImageView = imageV;
    
    [imageV kjwd_mas_makeConstraints:^(MASConstraintMaker * _Nonnull make, UIView * _Nonnull superview) {
        make.left.right.top.bottom.equalTo(onlyView);
    }];
    
    

    CAShapeLayer *layer = [CAShapeLayer layer];
//    [self.contentView.layer insertSublayer:layer atIndex:0];

    [self.contentView.subviews[0].layer insertSublayer:layer atIndex:0];

    self.cornerLayer = layer;
    
    
    
//                // 圆角弧度半径
//                CGFloat cornerRadius = 15.f;
//                // 设置cell的背景色为透明，如果不设置这个的话，则原来的背景色不会被覆盖
//    //            cell.backgroundColor = UIColor.clearColor;
//                
//                // 创建一个shapeLayer
//                CAShapeLayer *layer = [[CAShapeLayer alloc] init];
//                CAShapeLayer *backgroundLayer = [[CAShapeLayer alloc] init]; //显示选中
//                // 创建一个可变的图像Path句柄，该路径用于保存绘图信息
//                CGMutablePathRef pathRef = CGPathCreateMutable();
//                // 获取cell的size
//                CGRect bounds = CGRectInset(cell.bounds, 0, 0);
//                
//                // CGRectGetMinY：返回对象顶点坐标
//                // CGRectGetMaxY：返回对象底点坐标
//                // CGRectGetMinX：返回对象左边缘坐标
//                // CGRectGetMaxX：返回对象右边缘坐标
//                
//                // 这里要判断分组列表中的第一行，每组section的第一行，每组section的中间行
//                BOOL addLine = NO;
//                // CGPathAddRoundedRect(pathRef, nil, bounds, cornerRadius, cornerRadius);
//                if (indexPath.row == 0) {
//                    // 初始起点为cell的左下角坐标
//                    CGPathMoveToPoint(pathRef, nil, CGRectGetMinX(bounds), CGRectGetMaxY(bounds));
//                    // 起始坐标为左下角，设为p1，（CGRectGetMinX(bounds), CGRectGetMinY(bounds)）为左上角的点，设为p1(x1,y1)，(CGRectGetMidX(bounds), CGRectGetMinY(bounds))为顶部中点的点，设为p2(x2,y2)。然后连接p1和p2为一条直线l1，连接初始点p到p1成一条直线l，则在两条直线相交处绘制弧度为r的圆角。
//                    CGPathAddArcToPoint(pathRef, nil, CGRectGetMinX(bounds), CGRectGetMinY(bounds), CGRectGetMidX(bounds), CGRectGetMinY(bounds), cornerRadius);
//                    CGPathAddArcToPoint(pathRef, nil, CGRectGetMaxX(bounds), CGRectGetMinY(bounds), CGRectGetMaxX(bounds), CGRectGetMidY(bounds), cornerRadius);
//                    // 终点坐标为右下角坐标点，把绘图信息都放到路径中去,根据这些路径就构成了一块区域了
//                    CGPathAddLineToPoint(pathRef, nil, CGRectGetMaxX(bounds), CGRectGetMaxY(bounds));
//                    addLine = YES;
//                } else if (indexPath.row == [tableView numberOfRowsInSection:indexPath.section]-1) {
//                    // 初始起点为cell的左上角坐标
//                    CGPathMoveToPoint(pathRef, nil, CGRectGetMinX(bounds), CGRectGetMinY(bounds));
//                    CGPathAddArcToPoint(pathRef, nil, CGRectGetMinX(bounds), CGRectGetMaxY(bounds), CGRectGetMidX(bounds), CGRectGetMaxY(bounds), cornerRadius);
//                    CGPathAddArcToPoint(pathRef, nil, CGRectGetMaxX(bounds), CGRectGetMaxY(bounds), CGRectGetMaxX(bounds), CGRectGetMidY(bounds), cornerRadius);
//                    // 添加一条直线，终点坐标为右下角坐标点并放到路径中去
//                    CGPathAddLineToPoint(pathRef, nil, CGRectGetMaxX(bounds), CGRectGetMinY(bounds));
//                } else {
//                    // 添加cell的rectangle信息到path中（不包括圆角）
//                    CGPathAddRect(pathRef, nil, bounds);
//                    addLine = YES;
//                }
//                // 把已经绘制好的可变图像路径赋值给图层，然后图层根据这图像path进行图像渲染render
//                layer.path = pathRef;
//                backgroundLayer.path = pathRef;
//                // 注意：但凡通过Quartz2D中带有creat/copy/retain方法创建出来的值都必须要释放
//                CFRelease(pathRef);
//                // 按照shape layer的path填充颜色，类似于渲染render
//    //             layer.fillColor = [UIColor colorWithWhite:1.f alpha:0.8f].CGColor;
//                layer.fillColor = [UIColor whiteColor].CGColor;
//            
//                [cell.contentView.subviews[0].layer insertSublayer:layer atIndex:0];
    
}

- (void)setupSubViews {
//    NSLog(@"父类的 setupSubViews，   真实 %@ ", self);
}
-(nonnull CKJSimpleTableView *)simpleTableView {
    return _simpleTableView;
}

- (nonnull __kindof CKJCommonSectionModel *)sectionModel {
    return _sectionModel;
}
- (CKJCommonCellConfig *)configModel {
    return self.readOnly_configDic[KJPrefix_configDicKEY_ConfigModel];
}

- (void)setupData:(CKJCommonCellModel *)model section:(NSInteger)section row:(NSInteger)row selectIndexPath:(NSIndexPath *)indexPath tableView:(CKJSimpleTableView *)tableView {
}

- (void)_privateMethodWithSimpleTableView:(nonnull CKJSimpleTableView *)tabV sectionModel:(CKJCommonSectionModel *)sectionModel section:(NSInteger)section row:(NSInteger)row cell:(CKJCommonTableViewCell *)cell model:(CKJCommonCellModel *)model {
    if (self.simpleTableView != tabV) {
        self.simpleTableView = tabV;
    }
    if (self.sectionModel != sectionModel) {
        self.sectionModel = sectionModel;
    }
    if (self.section != section) {
        self.section = section;
    }
    if (self.row != row) {
        self.row = row;
    }
    
    // 背景
    if (cell.bgImageView.backgroundColor != model.bgConfig.bgColor) {
        cell.bgImageView.backgroundColor = model.bgConfig.bgColor;
    }
    if (cell.bgImageView.image != model.bgConfig.image) {
        cell.bgImageView.image = model.bgConfig.image;
    }
    if (cell.bgImageView.contentMode != model.bgConfig.contentMode) {
        cell.bgImageView.contentMode = model.bgConfig.contentMode;
    }
    if (cell.bgImageView.layer.cornerRadius != model.bgConfig.radius) {
        cell.bgImageView.layer.cornerRadius = model.bgConfig.radius;
    }
    
    
    CKJSimpleTableViewStyle *simpleStyle = self.simpleTableView.simpleStyle;
    
    if (simpleStyle.needUpdateOnlyViewConstraints) {
        UIEdgeInsets edge = UIEdgeInsetsZero;
        
        if (model.bgConfig.edge) {
            edge = model.bgConfig.edge.UIEdgeInsetsValue;
        } else if (simpleStyle.onlyViewEdge) {
            edge = simpleStyle.onlyViewEdge.UIEdgeInsetsValue;
        }

        [cell.onlyView kjwd_mas_updateConstraints:^(MASConstraintMaker * _Nonnull make, UIView * _Nonnull superview) {
            make.left.equalTo(superview).offset(edge.left);
            make.right.equalTo(superview).offset(-(edge.right)).priority(900);
            make.top.equalTo(superview).offset(edge.top);
            make.bottom.equalTo(superview).offset(-(edge.bottom)).priority(900);
        }];
    }
}



- (NSArray <__kindof CKJCommonCellModel *>*)currentSectionAllCellModelArray {
    NSArray <CKJCommonSectionModel *>* dataArr = self.simpleTableView.dataArr;
    NSArray <CKJCommonCellModel *>*modelArray = [dataArr kjwd_objectAtIndex:self.section].modelArray;
    return modelArray;
}


@end

