//
//  NSDate+WX.m
//  值日报
//
//  Created by 黄伟 on 14/7/16.
//  Copyright (c) 2014年 黄伟. All rights reserved.
//

#import "NSDate+WX.h"
#define CURRENT_CALENDAR [NSCalendar currentCalendar]
@implementation NSDate (WX)
/**
 *  是否为今天
 */
- (BOOL) isToday {
    
    int components = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay;
    
    // 获得self的年月日
    NSDateComponents *selfDateComponents = [CURRENT_CALENDAR components:components fromDate:self];
    
    // 获得当前时间的年月日
    NSDateComponents *nowDateComponents = [CURRENT_CALENDAR components:components fromDate:[NSDate date]];
    
    // 判断两个时间段的年月日是否相同
    return (selfDateComponents.year == nowDateComponents.year) && (selfDateComponents.month == nowDateComponents.month) &&(selfDateComponents.day == nowDateComponents.day);
}

/**
 *  是否为昨天
 */
- (BOOL) isYesterday {
    
        return NO;
}

/**
 *  是否为今年
 */
- (BOOL) isThisYear {

    int components = NSCalendarUnitYear;
    
    // 获得self的年月日
    NSDateComponents *selfDateComponents = [CURRENT_CALENDAR components:components fromDate:self];
    
    // 获得当前时间的年月日
    NSDateComponents *nowDateComponents = [CURRENT_CALENDAR components:components fromDate:[NSDate date]];
    
    // 判断两个时间的年份是否相同
    return selfDateComponents.year == nowDateComponents.year;
}

/**
 *  获得与当前时间的差距
 */
- (NSDateComponents *) deltaWithNowDate {
    
    int components = NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    
    // 返回两个时间的差距
    return [CURRENT_CALENDAR components:components fromDate:self toDate:[NSDate date] options:0];
}
@end
