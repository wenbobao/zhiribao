//
//  HWBaseTableViewController.h
//  值日报
//
//  Created by 黄伟 on 14/7/16.
//  Copyright (c) 2014年 黄伟. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HWBaseTableViewController : UITableViewController
@property (strong, nonatomic) NSMutableArray *data;
/**
 *  根据传入的网络请求，加载数据
 *
 *  @param urlString 网络请求
 */
- (void) setupDataWithUrlString:(NSString *) urlString;

@end
