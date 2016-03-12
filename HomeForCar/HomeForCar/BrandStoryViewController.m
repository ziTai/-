//
//  BrandStoryViewController.m
//  HomeForCar
//
//  Created by _ziTai on 16/3/12.
//  Copyright © 2016年 _ziTai. All rights reserved.
//

#import "BrandStoryViewController.h"

@interface BrandStoryViewController ()<UIWebViewDelegate>

@end

@implementation BrandStoryViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    UIWebView *webView = [[UIWebView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    webView.delegate = self;

//    webView.scalesPageToFit = YES;
    [webView loadHTMLString:_story baseURL:nil];
    [self.view addSubview:webView];
}
-(void)webViewDidFinishLoad:(UIWebView *)webView
{
    NSString *meta = [NSString stringWithFormat:@"document.getElementsByName(\"viewport\")[0].content = \"width=%f, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no\"", webView.frame.size.width];
    [webView stringByEvaluatingJavaScriptFromString:meta];
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
