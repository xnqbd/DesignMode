//
//  CKJLibraryHelper.m
//  MobileHospital_Renji
//
//  Created by xnqbd on 2019/10/24.
//  Copyright © 2019 Lyc. All rights reserved.
//

#import "CKJLibraryHelper.h"

@implementation CKJLibraryHelper

+ (void)commomCode1WithTFModel:(CKJTFModel *)tfModel tf:(UITextField *)tf {
    
    NSString *text = tfModel.text;

    NSAttributedString *attributedPlaceholder = tfModel.attributedPlaceholder;
    
    tf.text = text;
    
    if (WDKJ_IsEmpty_AttributedStr(attributedPlaceholder)) {
        tf.attributedPlaceholder = nil;
    } else {
        tf.attributedPlaceholder = attributedPlaceholder;
    }
    tf.userInteractionEnabled = tfModel.userInteractionEnabled;
    tf.textAlignment = tfModel.textAlignment;
    tf.borderStyle = tfModel.borderStyle;
    tf.keyboardType = tfModel.keyboardType;
    tf.secureTextEntry = tfModel.secureTextEntry;
    tf.clearButtonMode = tfModel.clearButtonMode;
    
    tf.textColor = tfModel.tfTextAttributed[NSForegroundColorAttributeName];
    tf.font = tfModel.tfTextAttributed[NSFontAttributeName];
    
    if (tfModel.readOnly_currentTF != tf) {
        tfModel.readOnly_currentTF = tf;
    }
}
+ (void)commomCode2WithTFModel:(CKJTFModel *)tfModel tf:(UITextField *)tf {

//        NSLog(@"tf.text  %@", tf.text);
        
        if (![tfModel.text isEqualToString:tf.text]) {
            tfModel.text = tf.text;
            
            SEL sel = @selector(__privateMethod__exeCallBack);
            [NSObject cancelPreviousPerformRequestsWithTarget:tfModel selector:sel object:nil];
            [tfModel performSelector:sel withObject:nil afterDelay:tfModel.seconds];
    //        NSLog(@"后 %@", tf.attributedText.string);
        }
}

@end
