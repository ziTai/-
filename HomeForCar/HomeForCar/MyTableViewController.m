//
//  MyTableViewController.m
//  HomeForCar
//
//  Created by _ziTai on 16/3/4.
//  Copyright © 2016年 _ziTai. All rights reserved.
//

#import "MyTableViewController.h"
#import "DataModels.h"
#import "MyTableViewCell.h"
#import "UIImageView+WebCache.h"
#import "ImgTableViewCell.h"
#import "NewDetailTableViewController.h"
@interface MyTableViewController ()<UITableViewDelegate,UITableViewDataSource>
{

    BaseClass   *baseClass;
}
@end

@implementation MyTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
    self.tableView.rowHeight = 90;
    [self.tableView registerNib:[UINib nibWithNibName:@"MyTableViewCell" bundle:nil] forCellReuseIdentifier:@"cell"];
    [self.tableView registerNib:[UINib nibWithNibName:@"ImgTableViewCell" bundle:nil] forCellReuseIdentifier:@"cellimg"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    return _arr.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    Content *con = ((ItemList*)[_arr objectAtIndex:indexPath.row]).content;
    if (con.displayType < 3)
    {
        MyTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
        
        cell.titleLabel.text = con.title;
        cell.sourceLabel.text = [NSString stringWithFormat:@"%@  点击数:%.f",con.source,con.hitCount];
        [cell.imgView sd_setImageWithURL:[NSURL URLWithString:[con.thumbnails objectAtIndex:0]] placeholderImage:nil];
        return cell;
    }
    else if(con.displayType == 3)
    {
        ImgTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellimg" forIndexPath:indexPath];
        
        cell.titleLabel.text = con.title;
        
        [cell.img1View sd_setImageWithURL:[NSURL URLWithString:[con.thumbnails objectAtIndex:0]] placeholderImage:nil];
        [cell.img2View sd_setImageWithURL:[NSURL URLWithString:[con.thumbnails objectAtIndex:1]] placeholderImage:nil];
        [cell.img3 sd_setImageWithURL:[NSURL URLWithString:[con.thumbnails objectAtIndex:2]] placeholderImage:nil];
        
        return cell;
    }
    return nil;
}
- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (section == 0)
    {
        UIScrollView *scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 100)];
        scrollView.contentSize = CGSizeMake(self.view.frame.size.width * 6, 0);
        scrollView.pagingEnabled = YES;
//        scrollView.showsHorizontalScrollIndicator = NO;
        return scrollView;
    }
    else
    {
        return nil;
    }
    
}
-(void)tableView:(UITableView*)tableView didSelectRowAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    NewDetailTableViewController *VC = [[NewDetailTableViewController alloc]init];
    ItemList*item = [_arr objectAtIndex:indexPath.row];
    VC.artID = [NSString stringWithFormat:@"%lf",item.articleId];
    [self.navigationController pushViewController:VC animated:YES];
}
/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
