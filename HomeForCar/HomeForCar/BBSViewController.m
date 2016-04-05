//
//  BBSViewController.m
//  HomeForCar
//
//  Created by _ziTai on 16/3/1.
//  Copyright © 2016年 _ziTai. All rights reserved.
//

#import "BBSViewController.h"
#import "HotTableViewController.h"
#import "ToolManager.h"
#import "hotDataModels.h"
#import "CommunityTableViewController.h"
#import "comDataModels.h"
#import "MJRefresh.h"
@interface BBSViewController ()<UIScrollViewDelegate>
{
    NSMutableArray      *_butArr;
    BOOL                _isLeft;
    UIScrollView        *_scrollView;
    NSMutableArray      *_ctrArr;
}

@end

@implementation BBSViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    _butArr = [[NSMutableArray alloc]init];
    _ctrArr = [[NSMutableArray alloc]init];
    _isLeft = YES;
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    UIButton *hotBut = [UIButton buttonWithType:UIButtonTypeCustom];
    [hotBut setTitle:@"热门" forState:UIControlStateNormal];
    [hotBut setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [hotBut setTitleColor:[UIColor blueColor] forState:UIControlStateSelected];
    hotBut.frame = CGRectMake(self.view.frame.size.width / 2.0 - 60, 5, 60, 30);
    [hotBut addTarget:self action:@selector(hotSelected:) forControlEvents:UIControlEventTouchUpInside];
    hotBut.tag = 1;
    [self.navigationController.navigationBar addSubview:hotBut];
    
    UIButton *communityBut = [UIButton buttonWithType:UIButtonTypeCustom];
    [communityBut setTitle:@"社区" forState:UIControlStateNormal];
    [communityBut setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [communityBut setTitleColor:[UIColor blueColor] forState:UIControlStateSelected];
    communityBut.frame = CGRectMake(self.view.frame.size.width / 2.0 + 0, 5, 60, 30);
    [communityBut addTarget:self action:@selector(hotSelected:) forControlEvents:UIControlEventTouchUpInside];
    communityBut.tag = 2;
    communityBut.selected = !communityBut.selected;
    communityBut.transform = CGAffineTransformMakeScale(0.6, 0.6);
    [self.navigationController.navigationBar addSubview:communityBut];
    [_butArr addObject:hotBut];
    [_butArr addObject:communityBut];
    
    
    _scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    _scrollView.backgroundColor = [UIColor whiteColor];
    _scrollView.contentSize = CGSizeMake(2 * self.view.frame.size.width, 0);
    _scrollView.pagingEnabled = YES;
    _scrollView.delegate = self;
    [self.view addSubview:_scrollView];
    
    //热门---表
    HotTableViewController *ctr = [[HotTableViewController alloc]initWithStyle:UITableViewStylePlain];
    ctr.tableView.frame = CGRectMake(CGRectGetMaxX(self.view.frame) * 0, 64, CGRectGetMaxX(self.view.frame), CGRectGetMaxY(self.view.frame) - 64 - 49);
    [self addChildViewController:ctr];
    [_scrollView addSubview:ctr.tableView];
    [_ctrArr addObject:ctr];
    ctr.tableView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        ToolManager *manager = [[ToolManager alloc]init];
        [manager getHotListWithTag:1];}];
    ToolManager *manager = [[ToolManager alloc]init];
    [manager getHotListWithTag:1];
    
    //社区---表
    CommunityTableViewController *ctr1 = [[CommunityTableViewController alloc]initWithStyle:UITableViewStylePlain];
    ctr1.tableView.frame = CGRectMake(CGRectGetMaxX(self.view.frame) * 1, 64, CGRectGetMaxX(self.view.frame), CGRectGetMaxY(self.view.frame) - 64 - 49);
    [self addChildViewController:ctr1];
    [_scrollView addSubview:ctr1.tableView];
    [_ctrArr addObject:ctr1];
    ctr1.tableView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^
    {
        ToolManager *manager = [[ToolManager alloc]init];
        [manager getCommunityList];
    }];

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(getHotListFinish:) name:@"getHotList" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(getCommunityListFinish:) name:@"getCommunityList" object:nil];
    
}
-(void)hotSelected:(UIButton *)but
{
    if (but.selected)
    {
        [self butAnimation];
        if (_isLeft) {
            [_scrollView setContentOffset:CGPointMake(self.view.frame.size.width * 0, 0) animated:YES];
        }
        else
        {
            [_scrollView setContentOffset:CGPointMake(self.view.frame.size.width * 1, 0) animated:YES];
        }
        ToolManager *manager = [[ToolManager alloc]init];
        if (but.tag == 1) {
            [manager getHotListWithTag:0];
        }
        else
        {
            [manager getCommunityList];
        }
        

       

    }

    
}
//得到数据
-(void)getHotListFinish:(NSNotification*)noti
{
    hotHotModel *model = [hotHotModel modelObjectWithDictionary:noti.userInfo];
    HotTableViewController *ctr = [_ctrArr objectAtIndex:0];
    [ctr.tableView.header endRefreshing];
    ctr.arr = model.data.itemList;
    [ctr.tableView reloadData];
}
-(void)getCommunityListFinish:(NSNotification*)noti
{
    comcomModel *model = [comcomModel modelObjectWithDictionary:noti.userInfo];
    CommunityTableViewController *ctr = [_ctrArr objectAtIndex:1];
    [ctr.tableView.header endRefreshing];
    ctr.arr = model.data.itemList;
    [ctr.tableView reloadData];
}
-(void)butAnimation
{
    for (UIButton *view in _butArr)
    {
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:0.2];
        if (!view.selected)
        {
            
            view.transform = CGAffineTransformMakeScale(0.6, 0.6);
        }
        else
        {
            view.transform = CGAffineTransformMakeScale(1.0,1.0);
        }
        [UIView commitAnimations];
        view.selected = !view.selected;
        
    }
    _isLeft = !_isLeft;

}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    int page = scrollView.contentOffset.x/scrollView.frame.size.width;
    if ((_isLeft && page ==1) ||(!_isLeft && page == 0))
    {
        [self butAnimation];
        ToolManager *manager = [[ToolManager alloc]init];
        if (_isLeft)
        {
            [manager getHotListWithTag:0];
        }
        else
        {
            [manager getCommunityList];
        }
    }
    

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
