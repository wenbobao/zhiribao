//
//  XQDomesticViewController.m
//  值日报
//
//  Created by 格式化油条 on 15/7/16.
//  Copyright (c) 2015年 格式化油条. All rights reserved.
//

#import "XQDomesticViewController.h"
#import "XQZhiRiBaoTabBarController.h"
#import "XQWebviewControllerViewController.h"

@interface XQDomesticViewController ()

@end

@implementation XQDomesticViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setupDataWithUrlString:@"http://www.zhiribao.com/api/v1/products?offset=10&page=1"];
    
    XQZhiRiBaoTabBarController *tabbar = (XQZhiRiBaoTabBarController *)self.navigationController.tabBarController;
    __weak typeof(self) Wself = self;
    tabbar.domestic_block = ^{
        
        [Wself.tableView.header beginRefreshing];
    };
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}





@end
