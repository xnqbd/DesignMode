//
//  main.m
//  OCMac
//
//  Created by admin2 on 2020/6/10.
//  Copyright © 2020 admin2. All rights reserved.
//

#import <Foundation/Foundation.h>

//
//@interface Cat : NSObject
//
//
//
//@end
//
//@implementation Cat
//
//- (void)dealloc
//{
//    NSLog(@"%@   ", @"Cat 销毁");
//}
//
//@end
//
//
//

@interface Person : NSObject


@property (copy) NSMutableArray *kjArr;

//@property (strong, nonatomic) void(^bl)(void);
//
//@property (strong, nonatomic) Cat *cat;
//
//@property (strong, nonatomic) dispatch_queue_t queue;

@end

@implementation Person



@end


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
//        Person *p = [[Person alloc] init];
////        NSLog(@"%@   ", p);
//
//        NSMutableArray *array = [NSMutableArray arrayWithObjects:@[@"张三", @"李四"], nil];
////        NSArray *array = @[@"张三", @"李四"];
//        NSLog(@"%p   ", array);
//
//        p.kjArr = array.copy;   // 这里调用了copy，产生的是不可变数组，下一行代码就会崩溃
//
//        NSLog(@"%p   ", p.kjArr);
//
////        p.kjArr = @[@"张三", @"李四"];
//        [p.kjArr removeObjectAtIndex:0];
        
//      https?:\/\/(.)
//      https?:\\/\\/
//        ((\d+.){3})   \\d+)(?=:)
        NSString *reg = @"https?:\\/\\/(((\\d+.){3}\\d+)):?";
        NSString *origin = @"https://10.1.94.146";
        
        NSError *error = NULL;
          NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:reg options:NSRegularExpressionCaseInsensitive error:&error];
          if (error) {
              NSLog(@"使用正则筛选字符串有误， 错误信息：%@   ", error);
              
          }
        
        NSMutableArray <NSString *>*reg_result = [NSMutableArray array];
        
          NSArray <NSTextCheckingResult *>*matches = [regex matchesInString:origin options:0 range:NSMakeRange(0, origin.length)];
        
        [matches enumerateObjectsUsingBlock:^(NSTextCheckingResult * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {

            NSRange range = [obj rangeAtIndex:1];
            NSString *temp = [origin substringWithRange:range];
            [reg_result addObject:temp];
        }];
        
        NSLog(@"%@   ", reg_result);
//        NSLog(@"%@   ", @"https?:\\/\\/\(\(\\d+.){3}\\d+)(?=:)");
        
    }
    return 0;
}
// (
//  http://10.1.94.146:9091
//
//当使用loadRequest来读取本地的HTML时，WKWebView是无法读取成功的，后台会出现如下的提示：
//Could not create a sandbox extension for /
//原因是WKWebView是不允许通过loadRequest的方法来加载本地根目录的HTML文件。
//而在iOS9的SDK中加入了以下方法来加载本地的HTML文件：
//[WKWebView loadFileURL:allowingReadAccessToURL:]
//但是在iOS9以下的版本是没提供这个便利的方法的。以下为解决方案的思路，就是在iOS9以下版本时，先将本地HTML文件的数据copy到tmp目录中，然后再使用loadRequest来加载。但是如果在HTML中加入了其他资源文件，例如js，css，image等必须一同copy到temp中。这个是最蛋疼的事情了。
//
//
//
//
//q2e12367129783ajsdDiquwd
//
//1238912888
//378288271993
//
//dogdogsog
//111234233333
//1212
