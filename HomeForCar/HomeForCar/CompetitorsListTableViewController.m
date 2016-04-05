//
//  CompetitorsListTableViewController.m
//  HomeForCar
//
//  Created by _ziTai on 16/3/11.
//  Copyright © 2016年 _ziTai. All rights reserved.
//

#import "CompetitorsListTableViewController.h"
#import "CODataModels.h"
#import "CoListTableViewCell.h"
#import "UIImageView+WebCache.h"
#import "CarDetailViewController.h"
@interface CompetitorsListTableViewController ()

@end

@implementation CompetitorsListTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"CoListTableViewCell" bundle:nil] forCellReuseIdentifier:@"cell"];
    self.tableView.rowHeight = 60;
    self.tableView.sectionHeaderHeight = 20;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _arr.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    COData *data = [_arr objectAtIndex:indexPath.row];
    CoListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    if (indexPath.row == 0)
    {
        cell.numLabel.textColor = [UIColor redColor];
    }
    else if (indexPath.row == 1)
    {
        cell.numLabel.textColor = [UIColor magentaColor];
    }
    else if (indexPath.row == 2)
    {
        cell.numLabel.textColor = [UIColor yellowColor];
    }
    else
    {
        cell.numLabel.textColor = [UIColor blackColor];
    }
    
    [cell.headImg sd_setImageWithURL:[NSURL URLWithString:data.brandLogo]];
    cell.nameLabel.text = data.brandName;
    cell.courceLabel.text = data.country;
    cell.numLabel.text = [NSString stringWithFormat:@"%ld",indexPath.row + 1];
    cell.hotLabel.text = [NSString stringWithFormat:@"%.lf℃",data.heat];
    return cell;
}
- (nullable NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return @"竞争品牌";
}
-(void)tableView:(UITableView*)tableView didSelectRowAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    COData *data = [_arr objectAtIndex:indexPath.row];
    CarDetailViewController *VC = [[CarDetailViewController alloc]init];
    VC.imgUrl = data.brandLogo;
    VC.name = data.brandName;
    VC.brandID = data.brandId;
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
