//
//  NewDetailTableViewController.m
//  HomeForCar
//
//  Created by _ziTai on 16/3/10.
//  Copyright © 2016年 _ziTai. All rights reserved.
//

#import "NewDetailTableViewController.h"
#import "ToolManager.h"
#import "DEDataModels.h"
@interface NewDetailTableViewController ()
{
    UIWebView *webView;
}
@end

@implementation NewDetailTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.navigationController.navigationBarHidden = NO;
    webView = [[UIWebView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height  - 49)];
    webView.allowsPictureInPictureMediaPlayback = YES;
    webView.dataDetectorTypes = UIDataDetectorTypeAll;
    [self.view addSubview:webView];
    ToolManager *manager = [[ToolManager alloc]init];
    [manager getNewsDetailWithartID:_artID];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(getNewDetailFinish:) name:@"getNewDetail" object:nil];
}
-(void)getNewDetailFinish:(NSNotification*)noti
{
    DEDataModel *model = [DEDataModel modelObjectWithDictionary:noti.userInfo];
    
    NSURL *url = [NSURL URLWithString:model.data.sourceUrl];
//    NSLog(@"%@",model.data.sourceUrl);
    NSURLRequest *request = [[NSURLRequest alloc]initWithURL:url];
    [webView loadRequest:request];
//    NSLog(@"%@",model.data.content);
//    [webView loadHTMLString:model.data.content baseURL:[NSURL URLWithString:model.data.sourceUrl]];
    

    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
