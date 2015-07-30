//
//  HWWebviewControllerViewController.h
//  值日报
//
//  Created by 黄伟 on 14/7/25.
//  Copyright (c) 2014年 黄伟. All rights reserved.
//

#import "HWDomesticViewController.h"
#import "HWZhiRiBaoTabBarController.h"
#import "HWWebviewControllerViewController.h"

@interface HWDomesticViewController ()

@end

@implementation HWDomesticViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setupDataWithUrlString:@"http://www.zhiribao.com/api/v1/products?offset=10&page=1"];
    
    HWZhiRiBaoTabBarController *tabbar = (HWZhiRiBaoTabBarController *)self.navigationController.tabBarController;
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
