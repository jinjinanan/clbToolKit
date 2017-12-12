//
//  NSObject+cDate.m
//  YiHao_Travel
//
//  Created by 陈林波 on 15/09/2017.
//  Copyright © 2017 易豪. All rights reserved.
//
//参考    http://www.cocoachina.com/bbs/read.php?tid=134821

//NSDate -- 表示一个绝对的时间点
//NSTimeZone -- 时区信息
//NSLocale -- 本地化信息
//NSDateComponents -- 一个封装了具体年月日、时秒分、周、季度等的类
//NSCalendar -- 日历类，它提供了大部分的日期计算接口，并且允许您在NSDate和NSDateComponents之间转换
//NSDateFormatter -- 用来在日期和字符串之间转换

#import "NSObject+cDate.h"

@implementation NSObject (cDate)

+(NSString *)currentDate:(NSString *)formatStr
{
    NSDate *date = [NSDate date];
    return [NSObject formatDate:date withFormatStr:formatStr];
}

+(NSDate *)beforeDate:(NSString *)formatStr with:(NSTimeInterval )interval withDate:(NSDate *)withdate
{
    NSTimeInterval aTimeInterval = ([withdate timeIntervalSinceReferenceDate] - interval);
    NSDate *newdate = [NSDate dateWithTimeIntervalSinceReferenceDate:aTimeInterval];
    return newdate;
//    return [NSObject formatDate:newdate withFormatStr:formatStr];
}

+(NSDate *)afterDate:(NSString *)formatStr with:(NSTimeInterval )interval withDate:(NSDate *)withdate
{
    NSTimeInterval aTimeInterval = ([withdate timeIntervalSinceReferenceDate] + interval);
    NSDate *newdate = [NSDate dateWithTimeIntervalSinceReferenceDate:aTimeInterval];
    return newdate;
//    return [NSObject formatDate:newdate withFormatStr:formatStr];
}

+(NSString *)formatDate:(NSDate *)date withFormatStr:(NSString *)formatStr
{
    NSDateFormatter *format = [NSDateFormatter new];
    format.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"];
    [format setDateFormat:formatStr];
    NSString *str = [format stringFromDate:date];
    return str;
}

+(NSDate *)dateConversion:(NSString *)formatStr withStr:(NSString *)str
{
    NSDateFormatter *format = [NSDateFormatter new];
    format.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"];
    [format setDateFormat:formatStr];
    NSDate *date = [format dateFromString:str];
    return date;
}



@end
