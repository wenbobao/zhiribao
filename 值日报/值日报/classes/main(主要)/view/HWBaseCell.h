//
//  HWBaseCell.h
//  值日报
//
//  Created by 黄伟 on 14/7/16.
//  Copyright (c) 2014年 黄伟. All rights reserved.
//

#import <UIKit/UIKit.h>
@class HWBaseModel;
@interface HWBaseCell : UITableViewCell
/**
 *  数据模型
 */
@property (strong, nonatomic) HWBaseModel *baseModel;
@end
