//
//  NSString+HW.m
//  值日报
//
//  Created by 黄伟 on 14/7/18.
//  Copyright (c) 2014年 黄伟. All rights reserved.
//

#import "NSString+XQ.h"

@implementation NSString (HW)
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
