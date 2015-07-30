//
//  XQZhiRiBaoTabBarController.m
//  值日报
//
//  Created by 格式化油条 on 15/7/16.
//  Copyright (c) 2015年 格式化油条. All rights reserved.
//

#import "XQZhiRiBaoTabBarController.h"
#import "XQSearchViewController.h"
#import "XQDomesticViewController.h"
#import "XQForeignViewController.h"
#import "XQZhiRiBaoNavigationController.h"

@interface XQZhiRiBaoTabBarController ()

/**
 *  当前选中的item
 */
@property (nonatomic,strong) UITabBarItem *selectTabBarItem;

@end

@implementation XQZhiRiBaoTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 创建子控制器
    [self setupViewController];
    
    self.tabBar.backgroundColor = [UIColor whiteColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 创建子控制器
- (void) setupViewController {
    
    XQDomesticViewController *domesticViewController = [[XQDomesticViewController alloc] init];
    //默认选择
    self.selectTabBarItem = domesticViewController.navigationController.tabBarItem;
    [self setupChildViewController:domesticViewController title:@"首页" imageName:@"home"];
    
    XQForeignViewController *foreignViewController = [[XQForeignViewController alloc] init];
    
    [self setupChildViewController:foreignViewController title:@"国外" imageName:@"foreign"];
    
    XQSearchViewController *searchViewController = [[XQSearchViewController alloc] initWithStyle:UITableViewStyleGrouped];
    
    [self setupChildViewController:searchViewController title:@"搜索" imageName:@"search"];
    
}

#pragma mark - 设置子控制器属性
- (void) setupChildViewController:(UIViewController *) viewController title:(NSString *) title imageName:(NSString *) imageName {
    
    viewController.title = title;
    
    viewController.tabBarItem.image = [UIImage imageNamed:imageName];
    
    XQZhiRiBaoNavigationController *zhiRiBaoNavigationController = [[XQZhiRiBaoNavigationController alloc] initWithRootViewController:viewController];
    
    [self addChildViewController:zhiRiBaoNavigationController];
    
}

- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item
{
//    XQLog(@"item %@",item.title);
//    XQLog(@"itemselect %zd",self.selectTabBarItem == item);
    if (self.selectTabBarItem == item && [item.title isEqualToString:@"首页"]) {
        
       
        if (self.domestic_block) {
             XQLog(@"国内");
            self.domestic_block();
        }
    }else if (self.selectTabBarItem == item && [item.title isEqualToString:@"国外"])
    {
//        XQLog(@"国外");
        if (self.foregin_block) {
            
            self.foregin_block();
        }
    }
    self.selectTabBarItem = item;
}

@end
