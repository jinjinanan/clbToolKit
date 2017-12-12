//
//  NSObject+cDate.h
//  YiHao_Travel
//
//  Created by 陈林波 on 15/09/2017.
//  Copyright © 2017 易豪. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (cDate)

#define aday 86400
#define ahour 3600
#define aminute  60


#define formatone @"MM月dd日 EEEE"
#define formattwo @"MM月dd日 HH:mm"


//当前时间格式化
//例

//[NSObject currentDate:@"MM月dd日 EEEE"] -> xx月xx日 星期x
+(NSString *)currentDate:(NSString *)formatStr;

+(NSDate *)beforeDate:(NSString *)formatStr with:(NSTimeInterval )interval withDate:(NSDate *)withdate;

+(NSDate *)afterDate:(NSString *)formatStr with:(NSTimeInterval )interval withDate:(NSDate *)withdate;

+(NSString *)formatDate:(NSDate *)date withFormatStr:(NSString *)formatStr ;

//xx月xx日 星期x -> NSDate
+(NSDate *)dateConversion:(NSString *)formatStr withStr:(NSString *)str;




@end
