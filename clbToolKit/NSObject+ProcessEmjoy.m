//
//  NSObject+ProcessEmjoy.m
//  clb
//
//  Created by 陈林波 on 16/08/2017.
//  Copyright © 2017 陈林波. All rights reserved.
//

#import "NSObject+ProcessEmjoy.h"

@implementation NSObject (ProcessEmjoy)

+(NSString *)getStr:(NSString *)obj
{
    if ([obj hasPrefix:@"["] && [obj hasSuffix:@"]"]) {
        obj = [obj stringByReplacingOccurrencesOfString:@"[" withString:@""];
        obj = [obj stringByReplacingOccurrencesOfString:@"]" withString:@""];
        return [self getStrByDecimal:obj];
    }
    else
    {
        return obj;
    }
}

+(NSString *)getDecimal:(NSString *)obj
{
    NSString *a = [self getDecimalByStr:obj];
    a = [NSString stringWithFormat:@"[%@]",a];
    return a;
}

#pragma mark - 十进制数字转文字
// 十进制unicode 转 文字
+(NSString *)getStrByDecimal:(NSString *)str
{
    NSArray *b = [str componentsSeparatedByString:@","];
    NSMutableString *z = [[NSMutableString alloc] init];
    for (NSString *i in b) {
        NSString *a = [self getHexByDecimal:i.integerValue];
        NSString *s = [self replaceUnicode:[NSString stringWithFormat:@"\\u%@",a]];
        [z appendString:s];
    }
    return z;
}

//文字转十进制
+(NSString *)getDecimalByStr:(NSString *)str
{
    NSString *unicodeStr = [self utf8ToUnicode:str];
    NSString *noneUStr = [unicodeStr stringByReplacingOccurrencesOfString:@"\\u" withString:@","];
    NSArray *ary = [noneUStr componentsSeparatedByString:@","];
    
    NSMutableString *d = [[NSMutableString alloc] init];
    
    for (NSInteger i = 1 ;i < ary.count ; i++) {
        NSString *b = ary[i];
        NSString *c = [self getDecimalByHex:b];
        if (i == ary.count -1) {
            [d appendString:[NSString stringWithFormat:@"%@",c]];
        }
        else
        {
            [d appendString:[NSString stringWithFormat:@"%@,",c]];
        }
    }
    return d;
}

#pragma 进制转换
//十进制转十六进制
+ (NSString *)getHexByDecimal:(NSInteger)decimal {
    
    NSString *hex =@"";
    NSString *letter;
    NSInteger number;
    for (int i = 0; i<9; i++) {
        
        number = decimal % 16;
        decimal = decimal / 16;
        switch (number) {
                
            case 10:
                letter =@"A"; break;
            case 11:
                letter =@"B"; break;
            case 12:
                letter =@"C"; break;
            case 13:
                letter =@"D"; break;
            case 14:
                letter =@"E"; break;
            case 15:
                letter =@"F"; break;
            default:
                letter = [NSString stringWithFormat:@"%ld", number];
        }
        hex = [letter stringByAppendingString:hex];
        if (decimal == 0) {
            
            break;
        }
    }
    return hex;
}

//十六进制转十进制
+(NSString *)getDecimalByHex:(NSString *)hex
{
    NSInteger a = [self getDecimalByBinary:[self getBinaryByHex:hex]];
    NSString *str = [NSString stringWithFormat:@"%ld",a];
    return str;
}

//二进制转十进制
+ (NSInteger)getDecimalByBinary:(NSString *)binary {
    
    NSInteger decimal = 0;
    for (int i=0; i<binary.length; i++) {
        
        NSString *number = [binary substringWithRange:NSMakeRange(binary.length - i - 1, 1)];
        if ([number isEqualToString:@"1"]) {
            
            decimal += pow(2, i);
        }
    }
    return decimal;
}


//二进制转十六进制
+ (NSString *)getHexByBinary:(NSString *)binary {
    
    NSMutableDictionary *binaryDic = [[NSMutableDictionary alloc] initWithCapacity:16];
    [binaryDic setObject:@"0" forKey:@"0000"];
    [binaryDic setObject:@"1" forKey:@"0001"];
    [binaryDic setObject:@"2" forKey:@"0010"];
    [binaryDic setObject:@"3" forKey:@"0011"];
    [binaryDic setObject:@"4" forKey:@"0100"];
    [binaryDic setObject:@"5" forKey:@"0101"];
    [binaryDic setObject:@"6" forKey:@"0110"];
    [binaryDic setObject:@"7" forKey:@"0111"];
    [binaryDic setObject:@"8" forKey:@"1000"];
    [binaryDic setObject:@"9" forKey:@"1001"];
    [binaryDic setObject:@"A" forKey:@"1010"];
    [binaryDic setObject:@"B" forKey:@"1011"];
    [binaryDic setObject:@"C" forKey:@"1100"];
    [binaryDic setObject:@"D" forKey:@"1101"];
    [binaryDic setObject:@"E" forKey:@"1110"];
    [binaryDic setObject:@"F" forKey:@"1111"];
    
    if (binary.length % 4 != 0) {
        
        NSMutableString *mStr = [[NSMutableString alloc]init];;
        for (int i = 0; i < 4 - binary.length % 4; i++) {
            
            [mStr appendString:@"0"];
        }
        binary = [mStr stringByAppendingString:binary];
    }
    NSString *hex = @"";
    
    for (int i=0; i<binary.length; i+=4) {
        
        NSString *key = [binary substringWithRange:NSMakeRange(i, 4)];
        NSString *value = [binaryDic objectForKey:key];
        if (value) {
            
            hex = [hex stringByAppendingString:value];
        }
    }
    return hex;
}

//十六进制转二进制
+(NSString *)getBinaryByHex:(NSString *)hex {
    
    NSMutableDictionary *hexDic = [[NSMutableDictionary alloc] initWithCapacity:16];
    [hexDic setObject:@"0000" forKey:@"0"];
    [hexDic setObject:@"0001" forKey:@"1"];
    [hexDic setObject:@"0010" forKey:@"2"];
    [hexDic setObject:@"0011" forKey:@"3"];
    [hexDic setObject:@"0100" forKey:@"4"];
    [hexDic setObject:@"0101" forKey:@"5"];
    [hexDic setObject:@"0110" forKey:@"6"];
    [hexDic setObject:@"0111" forKey:@"7"];
    [hexDic setObject:@"1000" forKey:@"8"];
    [hexDic setObject:@"1001" forKey:@"9"];
    [hexDic setObject:@"1010" forKey:@"A"];
    [hexDic setObject:@"1011" forKey:@"B"];
    [hexDic setObject:@"1100" forKey:@"C"];
    [hexDic setObject:@"1101" forKey:@"D"];
    [hexDic setObject:@"1110" forKey:@"E"];
    [hexDic setObject:@"1111" forKey:@"F"];
    
    NSString *binary = @"";
    for (int i=0; i<[hex length]; i++) {
        
        NSString *key = [hex substringWithRange:NSMakeRange(i, 1)];
        NSString *value = [hexDic objectForKey:key.uppercaseString];
        if (value) {
            
            binary = [binary stringByAppendingString:value];
        }
    }
    return binary;
}

//十进制转二进制
+(NSString *)getBinaryByDecimal:(NSInteger)decimal {
    
    NSString *binary = @"";
    while (decimal) {
        
        binary = [[NSString stringWithFormat:@"%ld", decimal % 2] stringByAppendingString:binary];
        if (decimal / 2 < 1) {
            
            break;
        }
        decimal = decimal / 2 ;
    }
    if (binary.length % 4 != 0) {
        
        NSMutableString *mStr = [[NSMutableString alloc]init];;
        for (int i = 0; i < 4 - binary.length % 4; i++) {
            
            [mStr appendString:@"0"];
        }
        binary = [mStr stringByAppendingString:binary];
    }
    return binary;
}


//unicode 转 文字
+ (NSString *)replaceUnicode:(NSString *)unicodeStr
{
    
    NSString *tempStr1 = [unicodeStr stringByReplacingOccurrencesOfString:@"\\u"withString:@"\\U"];
    NSString *tempStr2 = [tempStr1 stringByReplacingOccurrencesOfString:@"\""withString:@"\\\""];
    NSString *tempStr3 = [[@"\""stringByAppendingString:tempStr2] stringByAppendingString:@"\""];
    NSData *tempData = [tempStr3 dataUsingEncoding:NSUTF8StringEncoding];
    NSString* returnStr = [NSPropertyListSerialization propertyListFromData:tempData
                                                           mutabilityOption:NSPropertyListImmutable
                                                                     format:NULL
                                                           errorDescription:NULL];
    return [returnStr stringByReplacingOccurrencesOfString:@"\\r\\n"withString:@"\n"];
}


//utf-8 转 unicode
+(NSString *)utf8ToUnicode:(NSString *)string

{
    
    NSUInteger length = [string length];
    
    NSMutableString *s = [NSMutableString stringWithCapacity:0];
    
    for (int i = 0;i < length; i++)
        
    {
        
        unichar _char = [string characterAtIndex:i];
        
        //判断是否为英文和数字
        
        if (_char <= '9' && _char >= '0')
            
        {
            
//            [s appendFormat:@"%@",[string substringWithRange:NSMakeRange(i, 1)]];
            [s appendFormat:@"\\u%x",[string characterAtIndex:i]];

        }
        
        else if(_char >= 'a' && _char <= 'z')
            
        {
            
//            [s appendFormat:@"%@",[string substringWithRange:NSMakeRange(i, 1)]];
            
            [s appendFormat:@"\\u%x",[string characterAtIndex:i]];
            
        }
        
        else if(_char >= 'A' && _char <= 'Z')
            
        {
            
//            [s appendFormat:@"%@",[string substringWithRange:NSMakeRange(i, 1)]];
            
            [s appendFormat:@"\\u%x",[string characterAtIndex:i]];

            
        }
        
        else
            
        {
            
            [s appendFormat:@"\\u%x",[string characterAtIndex:i]];
            
        }
        
    }
    
    return s;
    
}



@end
