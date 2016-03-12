//
//  CarDetailViewController.m
//  HomeForCar
//
//  Created by _ziTai on 16/3/11.
//  Copyright © 2016年 _ziTai. All rights reserved.
//

#import "CarDetailViewController.h"
#import "DetailCarListTableViewController.h"
#import "MJRefresh.h"
#import "ToolManager.h"
#import "BLDataModels.h"
#import "HeadView.h"
#import "UIImageView+WebCache.h"
#import "CompetitorsListTableViewController.h"
#import "CODataModels.h"
#import "BrandStoryViewController.h"
@interface CarDetailViewController ()<UIScrollViewDelegate,toolDelgate>
{
    UIScrollView    *tabScrollView;
    BOOL            _isLeft;
    NSMutableArray  *_ctrArr;
    HeadView        *headV;
    ToolManager     *manager;
    UIBarButtonItem *hotBut;
    UIBarButtonItem *communityBut;
}
@end

@implementation CarDetailViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    _ctrArr = [[NSMutableArray alloc]init];
    self.automaticallyAdjustsScrollViewInsets = NO;
    tabScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height - 49 - 64)];
    tabScrollView.backgroundColor = [UIColor whiteColor];
    tabScrollView.contentSize = CGSizeMake(self.view.frame.size.width * 2, 0);
    tabScrollView.delegate = self;
    tabScrollView.pagingEnabled = YES;
    [self.view addSubview:tabScrollView];
    

    hotBut = [[UIBarButtonItem alloc]initWithTitle:@"车系列表" style:UIBarButtonItemStylePlain target:self action:@selector(butSelected:)];
    hotBut.tintColor = [UIColor redColor];
    
    communityBut = [[UIBarButtonItem alloc]initWithTitle:@"竞争品牌" style:UIBarButtonItemStylePlain target:self action:@selector(butSelected:)];
    communityBut.tintColor = [UIColor blackColor];
    self.navigationItem.rightBarButtonItem = communityBut;
    self.navigationItem.leftBarButtonItem = hotBut;
    self.navigationItem.leftItemsSupplementBackButton = YES;

    _isLeft = YES;
    
    manager = [[ToolManager alloc]init];
    manager.delegate = self;
    [manager getDetailCarWithName:0];
    
    
    
    DetailCarListTableViewController *ctr = [[DetailCarListTableViewController alloc]initWithStyle:UITableViewStylePlain];
    ctr.tableView.frame = CGRectMake(CGRectGetMaxX(self.view.frame) * 0, 60, CGRectGetMaxX(self.view.frame), CGRectGetMaxY(self.view.frame)  - 49 - 64 - 60);
    [self addChildViewController:ctr];
    [tabScrollView addSubview:ctr.tableView];
    [_ctrArr addObject:ctr];
    
    CompetitorsListTableViewController *comCtr = [[CompetitorsListTableViewController alloc]initWithStyle:UITableViewStylePlain];
    comCtr.tableView.frame = CGRectMake(CGRectGetMaxX(self.view.frame) * 1, 0, CGRectGetMaxX(self.view.frame), CGRectGetMaxY(self.view.frame)  - 49 - 64);
    [self addChildViewController:comCtr];
    [tabScrollView addSubview:comCtr.tableView];
    [_ctrArr addObject:comCtr];
    
    NSArray *nibContents = [[NSBundle mainBundle] loadNibNamed:@"HeadView" owner:nil options:nil];
    headV = [nibContents firstObject];
    headV.frame = CGRectMake(CGRectGetMaxX(self.view.frame) * 0, 0, CGRectGetMaxX(self.view.frame), 60);
    [headV.brandImg sd_setImageWithURL:[NSURL URLWithString:_imgUrl]];
    [headV.stotyButton setTitle:[NSString stringWithFormat:@"%@ 品牌故事",_name] forState:UIControlStateNormal];
    [headV.stotyButton addTarget:self action:@selector(brandStory) forControlEvents:UIControlEventTouchUpInside];
    [headV.mySeg addTarget:self action:@selector(changeInt:) forControlEvents:UIControlEventValueChanged];
    [tabScrollView addSubview:headV];

    
}
-(void)brandStory
{
    [manager brandStory:_brandID];
    
}
-(void)didGetBrandStory:(NSDictionary *)dic
{
    BrandStoryViewController *bsVC = [[BrandStoryViewController alloc]init];
    bsVC.story = [dic objectForKey:@"data"];
    [self.navigationController pushViewController:bsVC animated:YES];
}
-(void)butSelected:(UIBarButtonItem*)but
{
    if (but.tintColor == [UIColor blackColor])
    {
        _isLeft = !_isLeft;
        if (_isLeft) {
            [tabScrollView setContentOffset:CGPointMake(self.view.frame.size.width * 0, 0) animated:YES];
            hotBut.tintColor = [UIColor redColor];
            communityBut.tintColor = [UIColor blackColor];
        }
        else
        {
            [tabScrollView setContentOffset:CGPointMake(self.view.frame.size.width * 1, 0) animated:YES];
            hotBut.tintColor = [UIColor blackColor];
            communityBut.tintColor = [UIColor redColor];
        }

        if (but.tag == 1)
        {
            [manager getDetailCarWithName:0];
        }
        else
        {
            [manager getCompetitorsList];
        }
        
        
        UIButton *but1 = (UIButton*)[self.navigationController.navigationBar viewWithTag:1];
        UIButton *but2 = (UIButton*)[self.navigationController.navigationBar viewWithTag:2];
        but1.selected = !but1.selected;
        but2.selected = !but2.selected;
    }

}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    int page = scrollView.contentOffset.x/scrollView.frame.size.width;
    if ((_isLeft && page ==1) ||(!_isLeft && page == 0))
    {
        _isLeft = !_isLeft;
        UIButton *but1 = (UIButton*)[self.navigationController.navigationBar viewWithTag:1];
        UIButton *but2 = (UIButton*)[self.navigationController.navigationBar viewWithTag:2];
        but1.selected = !but1.selected;
        but2.selected = !but2.selected;

        if (_isLeft)
        {
            hotBut.tintColor = [UIColor redColor];
            communityBut.tintColor = [UIColor blackColor];
            [manager getDetailCarWithName:0];
        }
        else
        {
            hotBut.tintColor = [UIColor blackColor];
            communityBut.tintColor = [UIColor redColor];
            [manager getCompetitorsList];
        }
    }
    
    
}
-(void)didGetDetailCar:(NSDictionary*)dic
{
    BLbaseClass *baseClass = [BLbaseClass modelObjectWithDictionary:dic];
    DetailCarListTableViewController *vc = [_ctrArr objectAtIndex:0];
    vc.arr = baseClass.data;
    [vc.tableView reloadData];
}
-(void)didGetCompetitorsList:(NSDictionary *)dic
{
    CompetitorsListTableViewController *vc = [_ctrArr objectAtIndex:1];
    CObaseClass *baseclass = [CObaseClass modelObjectWithDictionary:dic];
    vc.arr = baseclass.data;
    [vc.tableView reloadData];
}
-(void)changeInt:(UISegmentedControl*)seg
{

    DetailCarListTableViewController *vc = [_ctrArr objectAtIndex:0];
    vc.segIndex = seg.selectedSegmentIndex;
    [manager getDetailCarWithName:seg.selectedSegmentIndex];
    
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
