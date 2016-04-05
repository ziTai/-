//
//  PersonalViewController.m
//  HomeForCar
//
//  Created by _ziTai on 16/3/1.
//  Copyright © 2016年 _ziTai. All rights reserved.
//

#import "PersonalViewController.h"
#import "TableHeadView.h"
#import "LoginViewController.h"
@interface PersonalViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    UITableView     *_tableView;
    NSArray         *_titleArr;
    NSArray         *_imgArr;
}
@end

@implementation PersonalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"我";
    _titleArr = [[NSArray alloc]initWithObjects:@[@"我的头条DNA"],@[@"我的新闻收藏",@"我的浏览记录"],@[@"新闻离线下载",@"设置"], nil];
    _imgArr = [[NSArray alloc]initWithObjects:@[[UIImage imageNamed:@"user_ic_dna"]],@[[UIImage imageNamed:@"user_icnews_collection"],[UIImage imageNamed:@"user_ic_browse"]],@[[UIImage imageNamed:@"user_ic_download"],[UIImage imageNamed:@"ic_settings"]], nil];
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - 49) style:UITableViewStylePlain];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [self.view addSubview:_tableView];
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    
    NSArray *nibContents = [[NSBundle mainBundle] loadNibNamed:@"TableHeadView" owner:nil options:nil];
    TableHeadView *headView = [nibContents firstObject];
    headView.frame = CGRectMake(0, 0, self.view.frame.size.width, 220);
    _tableView.tableHeaderView = headView;
    [headView.loginButton addTarget:self action:@selector(login:) forControlEvents:UIControlEventTouchUpInside];
    
}
-(void)login:(UIButton *)but
{
    LoginViewController *logVC = [[LoginViewController alloc]init];
    [self.navigationController pushViewController:logVC animated:YES];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return _titleArr.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return ((NSArray*)_titleArr[section]).count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.textLabel.text = [[_titleArr objectAtIndex:indexPath.section]objectAtIndex:indexPath.row];
    cell.imageView.image = [[_imgArr objectAtIndex:indexPath.section]objectAtIndex:indexPath.row];
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 20;
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
