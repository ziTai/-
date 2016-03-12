//
//  CarTableViewController.m
//  HomeForCar
//
//  Created by _ziTai on 16/3/8.
//  Copyright © 2016年 _ziTai. All rights reserved.
//

#import "CarTableViewController.h"
#import "carDataModels.h"
#import "UIImageView+WebCache.h"
#import "Sec1TableViewCell.h"
#import "Sec2TableViewCell.h"
#import "MBProgressHUD.h"
#import "CarCollectionViewController.h"
#import "CarDetailViewController.h"
@interface CarTableViewController ()<MBProgressHUDDelegate,secDelegate>
{
    NSArray *Arr;
    NSInteger _rec;
}
@end

@implementation CarTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    Arr = [[NSArray alloc]initWithObjects:@"热",@" *",@"A",@"B",@"C",@"D",@"F",@"G",@"H",@"J",@"K",@"L",@"M",@"N",@"O",@"P",@"Q",@"R",@"S",@"T",@"W",@"X",@"Y",@"Z", nil];
    self.tableView.sectionHeaderHeight = 20;
    [self.tableView registerNib:[UINib nibWithNibName:@"Sec1TableViewCell" bundle:nil] forCellReuseIdentifier:@"cell1"];
    [self.tableView registerNib:[UINib nibWithNibName:@"Sec2TableViewCell" bundle:nil] forCellReuseIdentifier:@"cell2"];
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return _arr.count ;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 1;
    }
    else if (section == 1)
    {
        return 1;
    }
    else
    {
        carData *data = [_arr objectAtIndex:section - 2];
        return data.lists.count;
    }
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (indexPath.section == 0)
    {
        
        
        Sec1TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell1" forIndexPath:indexPath];
        if (_arr.count != 0)
        {
            carData *data1 = [_arr objectAtIndex:_a1];
            carLists *list1 = [data1.lists objectAtIndex:_b1];
            [cell.img1 sd_setImageWithURL:[NSURL URLWithString:list1.imgUrl] placeholderImage:[UIImage imageNamed:@"Icon"]];
            cell.label1.text = list1.name;
            
            carData *data2 = [_arr objectAtIndex:_a2];
            carLists *list2 = [data2.lists objectAtIndex:_b2];
            [cell.img2 sd_setImageWithURL:[NSURL URLWithString:list2.imgUrl] placeholderImage:[UIImage imageNamed:@"Icon"]];
            cell.label2.text = list2.name;
            
            carData *data3 = [_arr objectAtIndex:_a3];
            carLists *list3 = [data3.lists objectAtIndex:_b3];
            [cell.img3 sd_setImageWithURL:[NSURL URLWithString:list3.imgUrl] placeholderImage:[UIImage imageNamed:@"Icon"]];
            cell.label3.text = list3.name;
            
            carData *data4 = [_arr objectAtIndex:_a4];
            carLists *list4 = [data4.lists objectAtIndex:_b4];
            [cell.img4 sd_setImageWithURL:[NSURL URLWithString:list4.imgUrl] placeholderImage:[UIImage imageNamed:@"Icon"]];
            cell.label4.text = list4.name;
        }
        
        return cell;
    }
    else if (indexPath.section == 1)
    {

        NSArray *secArr = [[NSArray alloc]initWithObjects:@(0),@(1) ,@(2),@(3),@(4),@(5) ,@(6),@(7),nil];

        Sec2TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell2" forIndexPath:indexPath];
        cell.delegate = self;
        [cell.imgArr enumerateObjectsUsingBlock:^(UIImageView*  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop)
        {
            carData *data = [_arr objectAtIndex:((NSNumber*)secArr[idx]).integerValue];
            carLists *list = [data.lists objectAtIndex:0];
            [obj sd_setImageWithURL:[NSURL URLWithString:list.imgUrl] placeholderImage:[UIImage imageNamed:@"Icon"]];
        }];
        return cell;
    }
    else
    {
        carData *data = [_arr objectAtIndex:indexPath.section - 2];
        carLists *list = [data.lists objectAtIndex:indexPath.row];
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
        if (!cell) {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
            
        }
        [cell.imageView sd_setImageWithURL:[NSURL URLWithString:list.imgUrl] placeholderImage:[UIImage imageNamed:@"Icon"]];
        cell.textLabel.text = list.name;
        cell.detailTextLabel.text = list.country;
        
        
        return cell;
    }
    return nil;

}
- (nullable NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section;
{
    if (section == 0) {
        return @"";
    }
    else if (section == 1)
    {
        return @"热门品牌";
    }
    else
    {
        carData *data = [_arr objectAtIndex:section - 2];
        carLists *list = [data.lists objectAtIndex:0];
        return list.firstLetter;
    }

}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return 110;
    }
    else if (indexPath.section == 1)
    {
        return 200;
    }
    else
    {
        return 50;
    }
}
-(void)tableView:(UITableView*)tableView didSelectRowAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    if (indexPath.section < 2) {
        return;
    }
    carData *data = [_arr objectAtIndex:indexPath.section - 2];
    carLists *list = [data.lists objectAtIndex:indexPath.row];
    CarDetailViewController *detailVC = [[CarDetailViewController alloc]init];
    detailVC.imgUrl = list.imgUrl;
    detailVC.name = list.name;
    detailVC.brandID = (NSInteger)(list.listsIdentifier);
    [self.navigationController pushViewController:detailVC animated:YES];
}
-(void)carTableView
{
    UICollectionViewFlowLayout *layOut = [[UICollectionViewFlowLayout alloc]init];
    
    //单元格的大小
    layOut.itemSize = CGSizeMake((self.view.frame.size.width -2) / 3.0, (self.view.frame.size.width - 2) / 3.0);
    //间距
    layOut.minimumInteritemSpacing = 1;
    layOut.minimumLineSpacing = 1;
    
    //滚动方向
    layOut.scrollDirection = UICollectionViewScrollDirectionVertical;
    //边界距离
    layOut.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
    layOut.headerReferenceSize = CGSizeMake(self.view.frame.size.width, 40);
    
    CarCollectionViewController *vc = [[CarCollectionViewController alloc]initWithCollectionViewLayout:layOut];
    vc.arr = _arr;
    [vc.collectionView reloadData];
    [self.navigationController pushViewController:vc animated:YES];
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
