//
//  XQBaseModel.m
//  值日报
//
//  Created by 格式化油条 on 15/7/16.
//  Copyright (c) 2015年 格式化油条. All rights reserved.
//

#import "XQBaseModel.h"
#import "NSDate+WX.h"

@implementation XQBaseModel
- (NSString *)created_at {
    
    //    2015-07-16 16:12:11
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    
    // 微博发送的时间
    NSDate *createDate = [formatter dateFromString:_created_at];
    
//     判断信息发送的时间跟当前时间的差距
    if (createDate.isToday) { // 今天
        
        if (createDate.deltaWithNowDate.hour >= 1) {
            return [NSString stringWithFormat:@"%ld小时前",(long)createDate.deltaWithNowDate.hour];
        }
        else if (createDate.deltaWithNowDate.minute >= 1) {
            return [NSString stringWithFormat:@"%ld分钟前",(long)createDate.deltaWithNowDate.minute];
        }
        else {
            return @"刚刚";
        }
    }
    else if(createDate.isYesterday) { // 昨天
        
        formatter.dateFormat = @"昨天 HH:mm:ss";
        return [formatter stringFromDate:createDate];
    }
    
    else if (createDate.isThisYear) { // 今天
        
        formatter.dateFormat = @"MM-dd HH:mm:ss";
        return [formatter stringFromDate:createDate];
        
    } else { // 非今天
        
        return _created_at;
    }
}

@end
