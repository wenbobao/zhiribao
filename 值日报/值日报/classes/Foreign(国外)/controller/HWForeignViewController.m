//
//  HWForeignViewController.m
//  值日报
//
//  Created by 黄伟 on 14/7/16.
//  Copyright (c) 2014年 黄伟. All rights reserved.
//

#import "HWForeignViewController.h"

@interface HWForeignViewController ()

@end

@implementation HWForeignViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setupDataWithUrlString:@"http://www.zhiribao.com/api/v1/products?foreign=us&offset=10&page=1"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
