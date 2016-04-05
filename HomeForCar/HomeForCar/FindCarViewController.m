//
//  FindCarViewController.m
//  HomeForCar
//
//  Created by _ziTai on 16/3/1.
//  Copyright © 2016年 _ziTai. All rights reserved.
//

#import "FindCarViewController.h"
#import "CarTableViewController.h"
#import "ToolManager.h"
#import "carDataModels.h"
#import "AIMTableViewIndexBar.h"
#import "MJRefresh.h"
#import "ChooseTableViewController.h"
@interface FindCarViewController ()<UITableViewDelegate,AIMTableViewIndexBarDelegate>
{
    UIScrollView        *_butScrollView;
    UIScrollView        *_tabScrollView;
    BOOL                 _isLeft;
    NSMutableArray      *_tabArr;
    AIMTableViewIndexBar*indexBar;
}
@end

@implementation FindCarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _isLeft = YES;
    _tabArr = [[NSMutableArray alloc]init];
    self.automaticallyAdjustsScrollViewInsets = NO;
    UIBarButtonItem *lfteItem = [[UIBarButtonItem alloc]initWithTitle:@"DNA" style:UIBarButtonItemStylePlain target:self action:@selector(DNA)];
    lfteItem.tintColor = [UIColor redColor];
    self.navigationItem.leftBarButtonItem = lfteItem;
    
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemSearch target:self action:@selector(find)];
    rightItem.tintColor = [UIColor redColor];
    self.navigationItem.rightBarButtonItem = rightItem;
    
    _butScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, 40)];
    _butScrollView.backgroundColor = [UIColor whiteColor];
    _butScrollView.contentSize = CGSizeMake(self.view.frame.size.width, 0);
    [self.view addSubview:_butScrollView];
   
    UIButton *but1 = [UIButton buttonWithType:UIButtonTypeCustom];
    [but1 setTitle:@"车型" forState:UIControlStateNormal];
    but1.tag = 1;
    [but1 setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
    [but1 setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    but1.selected = YES;
    but1.frame = CGRectMake(0, 0, self.view.frame.size.width / 2.0 , 40);
    [but1 addTarget:self action:@selector(change:) forControlEvents:UIControlEventTouchUpInside];
    [_butScrollView addSubview:but1];
    
    UIButton *but2 = [UIButton buttonWithType:UIButtonTypeCustom];
    [but2 setTitle:@"筛选" forState:UIControlStateNormal];
    but2.tag = 2;
    [but2 setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [but2 setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
    but2.frame = CGRectMake(self.view.frame.size.width / 2.0, 0, self.view.frame.size.width / 2.0 , 40);
    [but2 addTarget:self action:@selector(change:) forControlEvents:UIControlEventTouchUpInside];
    [_butScrollView addSubview:but2];
    
    
    
    _tabScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(_butScrollView.frame), self.view.frame.size.width, self.view.frame.size.height - 49 - CGRectGetMaxY(_butScrollView.frame))];
    _tabScrollView.contentSize = CGSizeMake(2 * self.view.frame.size.width, 0);
    _tabScrollView.delegate = self;
    _tabScrollView.pagingEnabled = YES;
    [self.view addSubview:_tabScrollView];
    
    CarTableViewController *carCtr = [[CarTableViewController alloc]initWithStyle:UITableViewStylePlain];
    carCtr.tableView.frame = CGRectMake(CGRectGetMaxX(self.view.frame) * 0, 0, CGRectGetMaxX(self.view.frame) , CGRectGetMaxY(self.view.frame) - 49 -CGRectGetMaxY(_butScrollView.frame) );
    carCtr.tableView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self beginRequestWith:1];
    }];
    [self addChildViewController:carCtr];
    [_tabScrollView addSubview:carCtr.tableView];
    [_tabArr addObject:carCtr];
    
    ChooseTableViewController *chooseCtr = [[ChooseTableViewController alloc]initWithStyle:UITableViewStylePlain];
    chooseCtr.tableView.frame = CGRectMake(CGRectGetMaxX(self.view.frame) * 1, 0, CGRectGetMaxX(self.view.frame) , CGRectGetMaxY(self.view.frame) - 49 -CGRectGetMaxY(_butScrollView.frame) );
    [_tabArr addObject:chooseCtr];
    [self addChildViewController:chooseCtr];
    [_tabScrollView addSubview:chooseCtr.tableView];
    
    UIButton *but = [UIButton buttonWithType:UIButtonTypeCustom];
    [but setBackgroundColor:[UIColor grayColor]];
    [but setTitle:@"重置" forState:UIControlStateNormal];
    [but addTarget:self action:@selector(newChoose) forControlEvents:UIControlEventTouchUpInside];
    [but setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    but.frame = CGRectMake(CGRectGetMaxX(self.view.frame) * 1 + 10, self.view.frame.size.height - 200, 80, 40);
    but.alpha = 0.6;
    [_tabScrollView addSubview:but];
    
    
    UIButton *countBut = [UIButton buttonWithType:UIButtonTypeCustom];
    [countBut setBackgroundColor:[UIColor redColor]];
    [countBut setTitle:[NSString stringWithFormat:@"共有1024款车系符合要求>"] forState:UIControlStateNormal];
    countBut.titleLabel.font = [UIFont systemFontOfSize:15];
    [countBut setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    countBut.frame = CGRectMake(CGRectGetMaxX(self.view.frame) * 1 + 100, self.view.frame.size.height - 200, 200, 40);
    countBut.alpha = 0.6;
    [_tabScrollView addSubview:countBut];
    
    NSArray *Arr = [[NSArray alloc]initWithObjects:@"热",@" *",@"A",@"B",@"C",@"D",@"F",@"G",@"H",@"J",@"K",@"L",@"M",@"N",@"O",@"P",@"Q",@"R",@"S",@"T",@"W",@"X",@"Y",@"Z", nil];
    indexBar = [[AIMTableViewIndexBar alloc]initWithFrame:CGRectMake(CGRectGetMaxX(carCtr.tableView.frame) - 20,(_tabScrollView.frame.size.height - Arr.count * 15)/2.0, 20, Arr.count * 15)];
    indexBar.delegate = self;
    [indexBar setIndexes:Arr];
    [_tabScrollView addSubview:indexBar];
    [_tabScrollView bringSubviewToFront:indexBar];
    
    
    [self beginRequestWith:1];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(getCarListFinish:) name:@"getCarList" object:nil];

}
-(void)DNA
{
    
}
-(void)find
{
    
}
-(void)newChoose
{
    ChooseTableViewController *chooseCtr = [_tabArr objectAtIndex:1];
    [chooseCtr.delegate goBackChoose];
}
-(void)change:(UIButton*)but
{
    if (!but.selected)
    {
        [_tabScrollView setContentOffset:CGPointMake(self.view.frame.size.width *(but.tag - 1), 0) animated:YES];
        [self butAnimation];
        [self beginRequestWith:but.tag];
    }
}
-(void)butAnimation
{
    _isLeft = !_isLeft;
    UIButton *but1 = [_butScrollView viewWithTag:1];
    UIButton *but2 = [_butScrollView viewWithTag:2];
    but1.selected = !but1.selected;
    but2.selected = !but2.selected;

}
-(void)beginRequestWith:(NSInteger)tag
{
    ToolManager *manager= [[ToolManager alloc]init];
    if (tag == 1)
    {
        [manager getCarList];
    }
    else
    {
        
    }
}
-(void)getCarListFinish:(NSNotification*)noti
{
    CarTableViewController *ctr = [_tabArr objectAtIndex:0];
    carBaseClass *model = [carBaseClass modelObjectWithDictionary:noti.userInfo];
    ctr.arr = model.data;
    [ctr.tableView.header endRefreshing];
    NSInteger a1 = arc4random()%(model.data.count - 2);
    carData *data1 = [model.data objectAtIndex:a1];
    NSInteger b1 = arc4random()%(data1.lists.count);
    ctr.a1 = a1;
    ctr.b1 = b1;
    
    NSInteger a2 = arc4random()%(model.data.count - 2);
    carData *data2 = [model.data objectAtIndex:a2];
    NSInteger b2 = arc4random()%(data2.lists.count);
    ctr.a2 = a2;
    ctr.b2 = b2;
    
    NSInteger a3 = arc4random()%(model.data.count - 2);
    carData *data3 = [model.data objectAtIndex:a3];
    NSInteger b3 = arc4random()%(data3.lists.count);
    ctr.a3 = a3;
    ctr.b3 = b3;
    
    NSInteger a4 = arc4random()%(model.data.count - 2);
    carData *data4 = [model.data objectAtIndex:a4];
    NSInteger b4 = arc4random()%(data4.lists.count);
    ctr.a4 = a4;
    ctr.b4 = b4;
    
    
    [ctr.tableView reloadData];
}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    int page = scrollView.contentOffset.x/scrollView.frame.size.width;
    if ((_isLeft && page == 1)||(!_isLeft && page == 0))
    {
        [self butAnimation];
    }
}
- (void)tableViewIndexBar:(AIMTableViewIndexBar *)indexBar didSelectSectionAtIndex:(NSInteger)index
{
    CarTableViewController *ctr = [_tabArr objectAtIndex:0];
    if ([ctr.tableView numberOfSections] > index && index > -1){   // for safety, should always be YES
        [ctr.tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:index]
                              atScrollPosition:UITableViewScrollPositionTop
                                      animated:YES];
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
