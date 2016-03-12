//
//  ChooseTableViewController.m
//  HomeForCar
//
//  Created by _ziTai on 16/3/10.
//  Copyright © 2016年 _ziTai. All rights reserved.
//

#import "ChooseTableViewController.h"
@interface ChooseTableViewController ()<UITableViewDelegate>

@end

@implementation ChooseTableViewController
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.tableView.rowHeight = 200;
}
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return 0;
    }
    return 20;
}
@end
