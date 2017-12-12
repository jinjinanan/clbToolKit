//
//  NSObject+ProcessEmjoy.h
//  clb
//
//  Created by 陈林波 on 16/08/2017.
//  Copyright © 2017 陈林波. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (ProcessEmjoy)


//易豪
+(NSString *)getStr:(NSString *)obj;

+(NSString *)getDecimal:(NSString *)obj;

#pragma mark -
// 十进制unicode 转 文字
+(NSString *)getStrByDecimal:(NSString *)str;

//文字转十进制
+(NSString *)getDecimalByStr:(NSString *)str;

@end
