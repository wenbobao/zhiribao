//
//  NSString+HW.h
//  值日报
//
//  Created by 黄伟 on 14/7/18.
//  Copyright (c) 2014年 黄伟. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (HW)
/**
 *  将字符串本身转为UTF8格式的字符串
 *
 *  @return 返回转化好的字符串
 */
- (NSString *)stringToUTF8Encoding;
@end
