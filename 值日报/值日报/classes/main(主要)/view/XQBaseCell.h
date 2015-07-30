//
//  XQBaseCell.h
//  值日报
//
//  Created by 格式化油条 on 15/7/16.
//  Copyright (c) 2015年 格式化油条. All rights reserved.
//

#import <UIKit/UIKit.h>
@class XQBaseModel;
@interface XQBaseCell : UITableViewCell
/**
 *  数据模型
 */
@property (strong, nonatomic) XQBaseModel *baseModel;
@end
