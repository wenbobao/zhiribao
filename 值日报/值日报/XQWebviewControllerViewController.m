//
//  XQWebviewControllerViewController.m
//  值日报
//
//  Created by 崇庆旭 on 15/7/25.
//  Copyright (c) 2015年 格式化油条. All rights reserved.
//

#import "XQWebviewControllerViewController.h"
#import "XQBaseModel.h"

@interface XQWebviewControllerViewController () <UIWebViewDelegate>

@property (nonatomic,strong) UIWebView *webView;

@end

@implementation XQWebviewControllerViewController

- (void)loadView
{
    UIWebView *webview = [[UIWebView alloc] init];
    self.view = webview;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
   __weak UIWebView *webView = (UIWebView *)self.view;
    self.webView = webView;
  
    webView.frame = self.view.bounds;
    webView.delegate = self ;
    
    webView.backgroundColor = [UIColor whiteColor];
    
    NSURL *url = [NSURL URLWithString:self.model.source_link];
     XQLog(@"url %@",url);
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url];
    
    [webView loadRequest:urlRequest];
    
    
   
    
    __weak UIScrollView *scrollView = self.webView.scrollView;
    
    scrollView.bounces = NO;
    
    // 添加下拉刷新控件
    scrollView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [webView reload];
    }];
    
    [scrollView.header beginRefreshing];
    
    
    
}

- (void)viewWillAppear:(BOOL)animated
{
//    [super viewWillAppear:animated];
//    
//    UIWebView *webView = (UIWebView *)self.webView;
//    self.webView = webView;
//    webView.delegate = self ;
//    
//    
//    NSURL *url = [NSURL URLWithString:self.model.source_link];
//    
//    XQLog(@"url %@",url);
//    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url];
//    
//    [webView loadRequest:urlRequest];
    
    
}

- (void)webViewDidStartLoad:(UIWebView *)webView
{
    
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    [self.webView.scrollView.header endRefreshing];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
