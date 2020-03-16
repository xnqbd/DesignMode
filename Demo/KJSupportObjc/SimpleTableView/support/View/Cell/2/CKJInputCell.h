//
//  CKJInputCell.h
//  MobileHospital_Renji
//
//  Created by chenkaijie on 2019/5/13.
//  Copyright © 2019 Lyc. All rights reserved.
//

#import "CKJCell.h"
#import "CKJChooseHelper.h"
#import "CKJInputData.h"

typedef void(^CKJTriggerCodeBlock)(NSUInteger seconds);

NS_ASSUME_NONNULL_BEGIN



@class CKJInputCellModel, CKJTFModel, CKJInputExpressionRequiredModel;

/// EmptyRequired 空必须
CKJInputExpressionRequiredModel * WDKJ_ER(NSString *emptyRequiredText);


typedef void(^CKJInputCellModelRowBlock)(__kindof CKJInputCellModel *_Nonnull m);
typedef BOOL(^CKJExpressionRequiredBlock)(NSString *_Nullable text, __kindof CKJCommonCellModel *cm);

@interface CKJInputExpressionRequiredModel : CKJBaseModel

/// 默认是YES，必须
@property (assign, nonatomic) BOOL required;

@property (copy, nonatomic) NSString *requiredText;
@property (copy, nonatomic) CKJExpressionRequiredBlock requiredExpression;

+ (instancetype)modelWithRequiredText:(NSString *)requiredText failExpression:(CKJExpressionRequiredBlock)expression;


/// 手机号格式错误
+ (instancetype)system_phoneRegError;

/// 验证码格式错误
+ (instancetype)system_verityCodeLengthError;

/// 确认密码和密码不一致
+ (instancetype)system_confirmPwdNotEqualPwdWithTableView:(CKJSimpleTableView *)simpleTableView;


@end


@interface CKJTFModel : CKJBaseModel

/// 只读
@property (weak, nonatomic) UITextField *readOnly_currentTF;


/// 右边的距离, 默认值0
@property (assign, nonatomic) CGFloat rightMargin;

@property (assign, nonatomic) BOOL userInteractionEnabled;

@property (assign, nonatomic) UITextBorderStyle borderStyle;
@property (assign, nonatomic) UIKeyboardType keyboardType;


/// 如果是NO 就是明文
@property (assign, nonatomic) BOOL secureTextEntry;

// 默认不设置， 如果设置 一般设置UITextFieldViewModeWhileEditing
@property (assign, nonatomic) UITextFieldViewMode clearButtonMode;

/// 输入框文本的属性 只支持（文字大小和颜色）
@property (strong, nonatomic) NSDictionary *tfTextAttributed;


/// 最大输入长度
@property (strong, nonatomic) NSNumber *maxInputLength;

@property(nullable, nonatomic, copy) NSString *text;

@property(nullable, nonatomic,copy) NSAttributedString *attributedPlaceholder;
- (void)_setPlaceholder:(NSString *_Nullable)placeholder;

@property(nonatomic) NSTextAlignment textAlignment;

+ (nonnull instancetype)modelWithDetailSettingBlock:(void(^_Nullable)(__kindof CKJTFModel *_Nonnull m))detailSettingBlock;

- (void)_afterSecondsListenTextChange:(CGFloat)seconds callBack:(void(^_Nullable)(NSString *_Nullable text))callBack;


/// 检验手机号
+ (BOOL)varityPhoneFail:(NSString *)phone;



#pragma mark - 下面是私有的
@property (assign, nonatomic) CGFloat seconds;
@property (copy, nonatomic) void(^block)(NSString *_Nullable text);


@property (copy, nonatomic) void (^updateText)(NSString *text);


@end



@interface CKJGetCodeModel : CKJBaseModel


/**
 右边的距离, 默认值15
 */
@property (assign, nonatomic) CGFloat rightMargin;

/**
 获取验证码Btn的宽度, 有默认值
 */
@property (assign, nonatomic) CGFloat codeBtnWidth;


/**
 秒数正在减少的 文字, 有默认值
 */
@property (copy, nonatomic) NSString *(^countDownChanging)(CKJCountDownButton *countDownButton, NSUInteger second);

/**
 秒数正在减少的 文字, 有默认值
 */
@property (copy, nonatomic) NSString *(^countDownFinished)(CKJCountDownButton *countDownButton, NSUInteger second);

/**
 点击了验证码Block
 */
@property (copy, nonatomic) void (^clickCodeBlock)(_Nonnull CKJTriggerCodeBlock triggerCodeBlock);


+ (nonnull instancetype)modelWithClickCodeBtnBlock:(void (^)(_Nonnull CKJTriggerCodeBlock triggerCodeBlock))clickCodeBlock detailSettingBlock:(void(^_Nullable)(__kindof CKJGetCodeModel *m))detailSettingBlock;


@end



@interface CKJInputCellModel : CKJCellModel

@property (strong, nonatomic, nullable) CKJStringChooseHelper *stringChoose;
@property (strong, nonatomic, nullable) CKJDateChooseHelper *dateChoose;

- (void)updateTFModel:(void(^_Nullable)(CKJTFModel *_Nonnull tfModel))block;

@property (strong, nonatomic, readonly) CKJTFModel *tfModel;

@property (strong, nonatomic, nullable) CKJGetCodeModel *getCodeModel;

/// 输入框的限制
@property (strong, nonatomic, nullable) NSArray <CKJInputExpressionRequiredModel *>*expressionRequiredArray;

/// 增加限制
- (void)addRequired:(CKJInputExpressionRequiredModel *)model;


- (NSString *_Nullable)tfText;

+ (instancetype)inputWithCellHeight:(nullable NSNumber *)cellHeight cellModel_id:(nullable NSString *)cellModel_id detailSettingBlock:(nullable CKJInputCellModelRowBlock)detailSettingBlock;


@end



@interface CKJInputCell : CKJCell

@end




@interface CKJInputAddition : CKJBaseModel

+ (nonnull UIImage *)systemStarImageWithSize:(CGSize)size;

@end


NS_ASSUME_NONNULL_END
