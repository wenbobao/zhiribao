//
//  HWBaseModel.h
//  值日报
//
//  Created by 黄伟 on 14/7/16.
//  Copyright (c) 2014年 黄伟. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HWBaseModel : NSObject
/**
 *  商品内容
 */
@property (copy, nonatomic) NSString *content;

/**
 *  文章发送时间
 */
@property (copy, nonatomic) NSString *created_at;

/**
 *  配图
 */
@property (copy, nonatomic) NSString *image;

/**
 *  商店名称
 */
@property (copy, nonatomic) NSString *name;

/**
 *  商品商店地址
 */
@property (copy, nonatomic) NSString *source_link;

/**
 *  商品标题
 */
@property (copy, nonatomic) NSString *title;

/**
 *  来源(谁发布的)
 */
@property (copy, nonatomic) NSString *source;

/**
 *  更新的时间
 */
@property (copy, nonatomic) NSString *updated_at;
@end
