//
//  NSString+XQ.h
//  值日报
//
//  Created by 格式化油条 on 15/7/18.
//  Copyright (c) 2015年 格式化油条. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (XQ)
/**
 *  将字符串本身转为UTF8格式的字符串
 *
 *  @return 返回转化好的字符串
 */
- (NSString *)stringToUTF8Encoding;
@end
