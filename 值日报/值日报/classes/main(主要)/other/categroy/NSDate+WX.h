//
//  HWDate+WX.h
//  值日报
//
//  Created by 黄伟 on 14/7/16.
//  Copyright (c) 2014年 黄伟. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (WX)

/**
 *  是否为今天
 */
- (BOOL) isToday;

/**
 *  是否为昨天
 */
- (BOOL) isYesterday;

/**
 *  是否为今年
 */
- (BOOL) isThisYear;

/**
 *  获得与当前时间的差距
 */
- (NSDateComponents *) deltaWithNowDate;
@end
