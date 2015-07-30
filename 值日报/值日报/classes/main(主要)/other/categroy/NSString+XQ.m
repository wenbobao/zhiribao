//
//  NSString+XQ.m
//  值日报
//
//  Created by 格式化油条 on 15/7/18.
//  Copyright (c) 2015年 格式化油条. All rights reserved.
//

#import "NSString+XQ.h"

@implementation NSString (XQ)
- (NSString *)stringToUTF8Encoding {
    
    NSMutableString *string = [NSMutableString stringWithFormat:@""];
    
    for (NSUInteger index = 0 ; index < [self length] ; index++) {
        
        NSString *strTmp = [[NSString stringWithFormat:@"%C",[self characterAtIndex:index]]
                            stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        
        [string appendString:strTmp];
    }
    return string;
}
@end
