//
//  HWBaseTableViewController.h
//  值日报
//
//  Created by 黄伟 on 14/7/16.
//  Copyright (c) 2014年 黄伟. All rights reserved.
//

#import "HWBaseTableViewController.h"

#import "HWWebviewControllerViewController.h"
#import "HWZhiRiBaoTabBarController.h"
#import "HWZhiRiBaoNavigationController.h"
#import "HWBaseCell.h"
#import "HWBaseModel.h"

static NSString *cellIdentifier = @"baseCell";
@interface HWBaseTableViewController ()

/**
 *  保存子控制器传来的urlString
 */
@property (strong, nonatomic) NSString *urlString;

@end

@implementation HWBaseTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 注册cellReuseIdentifier
    [self.tableView registerClass:[HWBaseCell class] forCellReuseIdentifier:cellIdentifier];

    [self setupHeaderRefreshing];
    
    HWZhiRiBaoTabBarController *tabbar = (HWZhiRiBaoTabBarController *)self.navigationController.tabBarController;
    __weak typeof(self) Wself = self;
//    tabbar.domestic_block = ^{
//    
//        [Wself.tableView.header beginRefreshing];
//    };
    
//    __weak typeof(self) Wself = self;
    tabbar.foregin_block = ^{
      
        [Wself.tableView.header beginRefreshing];
    };
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - 设置下拉刷新
- (void) setupHeaderRefreshing {
    
    __weak typeof(self) weakSelf = self;
    // 下拉刷新，重新加载网络请求
    self.tableView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        
        [weakSelf setupDataWithUrlString:self.urlString];
    }];
    // 立即开始刷新状态
    [self.tableView.header beginRefreshing];
}


#pragma mark - 将网络请求截取出来，当上拉刷新加载更多数据的时候将修改了的url传入重新加载数据
- (void) setupLoadMoreDataWithUrlString:(NSString *) urlString {
    
    NSRange range = [self.urlString rangeOfString:@"page="];
    
    NSUInteger loc = range.length + range.location;
    
    NSString *httpString = [self.urlString substringToIndex:loc];
    
    NSString *pageNsstring = [self.urlString substringFromIndex:loc];
    
    int pageInt = [pageNsstring intValue];
    
    NSString *url = [NSString stringWithFormat:@"%@%d",httpString,pageInt+1];
    
    [self setupDataWithUrlString:url];
}

#pragma mark - 懒加载数组
- (NSMutableArray *)data {
    
    if (!_data) {
        
        _data = [NSMutableArray array];
    }
    return _data;
}

#pragma mark - 根据传入的网络请求，在子线程解析并转为模型。并且返回主线程刷新
- (void)setupDataWithUrlString:(NSString *)urlString {
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        self.urlString = urlString;
        
        NSURL *url = [NSURL URLWithString:urlString];
        
        NSData *data = [NSData dataWithContentsOfURL:url];
        
        if (!data) {
            
            [self.tableView.header endRefreshing];
            return ;
        }
        
        NSError *error = nil;
        // 解析JSON数据，返回字典
        NSDictionary *commodityDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
        
//        XQLog(@"%@",commodityDictionary[@"data"]);
        NSArray *dataArray = [HWBaseModel objectArrayWithKeyValuesArray:commodityDictionary[@"data"]];
        
          [self.data addObjectsFromArray:dataArray];
        
        if (error) {
            XQLog(@"解析错误---%@",error);
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            // 结束刷新状态
            [self.tableView.header endRefreshing];
            
            [self.tableView reloadData];
            
            // 当数组中有值，就开启上拉刷新
            if (self.data.count) {
                // 上拉刷新
                self.tableView.footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
                    
                    [self setupLoadMoreDataWithUrlString:self.urlString];
                }];
            }
        });
    });
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.data.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    HWBaseCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    [self setupModelWithCell:cell indexPath:indexPath];
    
    return cell;
}

#pragma mark - 给对应indexPath的cell模型赋值
- (void) setupModelWithCell:(HWBaseCell *) cell indexPath:(NSIndexPath *) indexPath {
    
    cell.fd_enforceFrameLayout = NO;
    
    cell.baseModel = self.data[indexPath.row];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return [tableView fd_heightForCellWithIdentifier:cellIdentifier cacheByIndexPath:indexPath configuration:^(HWBaseCell *cell) {
        
        [self setupModelWithCell:cell indexPath:indexPath];
    }];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    HWWebviewControllerViewController *webVc = [[HWWebviewControllerViewController alloc] init];
    webVc.model = self.data[indexPath.row];
    
    [self.navigationController pushViewController:webVc animated:YES];
    
}



@end
