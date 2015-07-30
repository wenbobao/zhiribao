//
//  XQBaseTableViewController.h
//  值日报
//
//  Created by 格式化油条 on 15/7/16.
//  Copyright (c) 2015年 格式化油条. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XQBaseTableViewController : UITableViewController
@property (strong, nonatomic) NSMutableArray *data;
/**
 *  根据传入的网络请求，加载数据
 *
 *  @param urlString 网络请求
 */
- (void) setupDataWithUrlString:(NSString *) urlString;

@end
