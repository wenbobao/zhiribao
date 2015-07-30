//
//  HWZhiRiBaoTabBarController.h
//  值日报
//
//  Created by 黄伟 on 14/7/16.
//  Copyright (c) 2014年 黄伟. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^domestic_block)() ;

typedef void (^foreign_block)() ;
@interface HWZhiRiBaoTabBarController : UITabBarController

@property (nonatomic,copy) domestic_block domestic_block;

@property (nonatomic,copy) foreign_block foregin_block;

@end
