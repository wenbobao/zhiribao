//
//  XQSearchViewController.m
//  值日报
//
//  Created by 格式化油条 on 15/7/17.
//  Copyright (c) 2015年 格式化油条. All rights reserved.
//

#import "XQSearchViewController.h"

#import "XQWebviewControllerViewController.h"

@interface XQSearchViewController () <UISearchBarDelegate>

/**
 *  搜索的内容
 */
@property (copy, nonatomic) NSString *searchText;

@property (copy, nonatomic) NSMutableString *urlString;

@property (strong, nonatomic) UISearchBar *searchBar;
@end

@implementation XQSearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [self.searchBar becomeFirstResponder];
    
    [self setupSearchBarHeaderView];
    
//    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapRecognizer:)];
//    // 延时调用TouchesBegan方法，YES:表示手势识别成功，就不会调用TouchesBegan方法
//    // NO:不管手势是否成功识别，马上调用TouchesBegan方法
//    tap.delaysTouchesBegan = NO;
//    // 设置单击次数
//    tap.numberOfTapsRequired = 1;
//    // 设置手指个数
//    tap.numberOfTouchesRequired = 1;
//    // 添加点击手势
//    [self.view addGestureRecognizer:tap];

    
    
}

- (void) tapRecognizer:(UITapGestureRecognizer *)recognizer
{
    [self.searchBar endEditing:YES];
}

#pragma mark - 设置搜索栏
- (void) setupSearchBarHeaderView {
    
    UISearchBar *searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(10, 0, [UIScreen mainScreen].bounds.size.width - 20, 44)];
    
    searchBar.placeholder = @"搜索全网折扣";
    
    searchBar.delegate = self;
    
    self.tableView.tableHeaderView = searchBar;
    
    self.searchBar = searchBar;
    
    [searchBar becomeFirstResponder];
    
    [self.tableView.header endRefreshing];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 当按下键盘的搜索按钮的时候调用
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    
    [self search];
    
    [searchBar resignFirstResponder];
    self.tableView.footer.hidden = NO;
}

#pragma mark - 监听搜索栏输入的内容
-(BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar{
    [self.data removeAllObjects];
    [self.tableView reloadData];
    return YES;
}
- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
    
   NSString *text = [searchText stringToUTF8Encoding];
    self.searchText = text;
    
    if(text.length == 0)
    {
        [self.data removeAllObjects];
        
        [self.tableView reloadData];
    } else
    {
        [self search];
    }
    
    
}


- (void) search
{
    // 搜索产品的接口
    NSMutableString *urlString = [NSMutableString stringWithFormat:@"http://www.zhiribao.com/api/v1/products?keywords=&offset=10&page=1"];
//    if (self.searchText) {
//        NSString *subWord = @"keywords=";
//        NSString *keyWord = [NSString stringWithFormat:@"%@%@",subWord,self.searchText];
//        [urlString stringByReplacingOccurrencesOfString:subWord withString:keyWord];
//        // 将用户输入的字符串拼接到接口中
//        //    [urlString insertString:self.searchText atIndex:loc];
//        
//        // 将数据传递给父控制器，刷新数据
//        [self setupDataWithUrlString:urlString];
//        
//        [self.data removeAllObjects];
//        
//        self.tableView.footer.hidden = YES;
//    }

    // 获取字符串的范围
    NSRange range = [urlString rangeOfString:@"keywords="];
    
    NSUInteger loc = range.length + range.location;
    
    if (range.length) {
        
        // 将用户输入的字符串拼接到接口中
        [urlString insertString:self.searchText atIndex:loc];
        
        // 将数据传递给父控制器，刷新数据
        [self setupDataWithUrlString:urlString];
        
        [self.data removeAllObjects];
        
        self.tableView.footer.hidden = YES;
    }
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [self.searchBar endEditing:YES];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    XQWebviewControllerViewController *webVc = [[XQWebviewControllerViewController alloc] init];
    webVc.model = self.data[indexPath.row];
    
    [self.navigationController pushViewController:webVc animated:YES];
    
    [self.searchBar endEditing:YES];
}

@end
