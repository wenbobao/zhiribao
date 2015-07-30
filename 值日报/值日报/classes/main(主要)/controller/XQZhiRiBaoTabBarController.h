//
//  XQZhiRiBaoTabBarController.h
//  值日报
//
//  Created by 格式化油条 on 15/7/16.
//  Copyright (c) 2015年 格式化油条. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^domestic_block)() ;

typedef void (^foreign_block)() ;
@interface XQZhiRiBaoTabBarController : UITabBarController

@property (nonatomic,copy) domestic_block domestic_block;

@property (nonatomic,copy) foreign_block foregin_block;

@end
