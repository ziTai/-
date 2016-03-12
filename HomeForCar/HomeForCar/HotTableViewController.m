
//
//  HotTableViewController.m
//  HomeForCar
//
//  Created by _ziTai on 16/3/7.
//  Copyright © 2016年 _ziTai. All rights reserved.
//

#import "HotTableViewController.h"
#import "hotDataModels.h"
#import "HotTableViewCell.h"
#import "UIImageView+WebCache.h"
@interface HotTableViewController ()
{
    NSMutableArray      *_heightArr;
}

@end

@implementation HotTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _heightArr = [[NSMutableArray alloc]init];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(getDetailCommunityListFinish:) name:@"getDetailCommunityList" object:nil];
    [self.tableView registerNib:[UINib nibWithNibName:@"HotTableViewCell" bundle:nil] forCellReuseIdentifier:@"cell"];

}
-(void)getDetailCommunityListFinish:(NSNotification*)noti
{
    hotHotModel *model = [hotHotModel modelObjectWithDictionary:noti.userInfo];
    self.arr = model.data.itemList;
    [self.tableView reloadData];
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
    HotTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    hotItemList *model = [_arr objectAtIndex:indexPath.row];
    for (UIImageView*img in cell.imgArr) {
        img.image = nil;
        img.frame = CGRectZero;
    }
    
    cell.headImgView.layer.masksToBounds = YES;
    cell.headImgView.layer.cornerRadius = 25;
    [cell.headImgView sd_setImageWithURL:[NSURL URLWithString:model.author.avatar] placeholderImage:nil];
    cell.nameLabel.text = model.author.name;
    NSDate *date = [[NSDate alloc]initWithTimeIntervalSinceNow:model.createTime - model.lastReplyTime];
    NSDateFormatter *format = [[NSDateFormatter alloc]init];
    format.dateFormat = @"M月d日H:m";
    NSString *str = [format stringFromDate:date];
    cell.timeLabel.text = [NSString stringWithFormat:@"%@  来自:%@",str,model.clubName];
    cell.sourceLabel.text = model.location;
    [cell.upButton setTitle:[NSString stringWithFormat:@"赞(%.lf)",model.zanCount] forState:UIControlStateNormal];
    [cell.sayButton setTitle:[NSString stringWithFormat:@"评论(%.lf)",model.commentCount] forState:UIControlStateNormal];
    if (NO)
    {
        NSDictionary *OBJ = model.extraData;
        NSLog(@"%@",OBJ);
        CGRect rect = [model.summary boundingRectWithSize:CGSizeMake(self.view.frame.size.width - 100, 0) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15]} context:nil];
        cell.titltLabel.frame = CGRectMake(68, 66, self.view.frame.size.width - 100,rect.size.height);
        cell.titltLabel.text = model.summary;
        
//        NSArray *arr = [((NSDictionary*)model.extraData) objectForKey:@"carVoteOptionList"];
//        NSLog(@"%@",arr);
        
//        for (int i = 0; i < arr.count; i ++)
//        {
//            [[cell.imgArr objectAtIndex:i] sd_setImageWithURL:[NSURL URLWithString:(NSString*)[arr[i] objectForKey:@"carLogo"]] placeholderImage:[UIImage imageNamed:@"iTunesArtWork.png"]];
//            NSInteger  column = i%3;
//            //        行数
//            NSInteger  row = i/3;
//            ((UIImageView*)[cell.imgArr objectAtIndex:i]).frame= CGRectMake(CGRectGetMinX(cell.titltLabel.frame) + column * (50 + 5) ,CGRectGetMaxY(cell.titltLabel.frame) + 20 + row * (50 + 5), 50, 50);
//            
//            
//            
//        }

        
    }
    else
    {
        CGRect rect = [model.title boundingRectWithSize:CGSizeMake(self.view.frame.size.width - 100, 0) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15]} context:nil];
        cell.titltLabel.frame = CGRectMake(68, 66, self.view.frame.size.width - 100,rect.size.height);
        cell.titltLabel.text = model.title;
        
        
        
        
        for (int i = 0; i < model.imageList.count; i ++)
        {
            hotImageList *imgModel = [model.imageList objectAtIndex:i];
            [[cell.imgArr objectAtIndex:i] sd_setImageWithURL:[NSURL URLWithString:imgModel.list.url] placeholderImage:[UIImage imageNamed:@"iTunesArtWork.png"]];
            NSInteger  column = i%3;
            //        行数
            NSInteger  row = i/3;
            float beishu = 0;
            if (model.imageList.count < 2)
            {
                beishu = (self.view.frame.size.width - CGRectGetMinX(cell.titltLabel.frame) - 20)/((model.imageList.count%3  ) *imgModel.list.width);
            }
            else
            {
                beishu = (self.view.frame.size.width - CGRectGetMinX(cell.titltLabel.frame) - 20)/(3  *imgModel.list.width);
            }
            ((UIImageView*)[cell.imgArr objectAtIndex:i]).frame= CGRectMake(CGRectGetMinX(cell.titltLabel.frame) + column * (imgModel.list.width + 5)*beishu ,CGRectGetMaxY(cell.titltLabel.frame) + 20 + row * (imgModel.list.height + 5)*beishu, imgModel.list.width*beishu  , imgModel.list.height*beishu);
            
            
            
        }

        
    }
    
    

    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    hotItemList *model = [_arr objectAtIndex:indexPath.row];
    CGRect textRect = CGRectZero;
    if (NO)
    {
//        textRect = [model.summary boundingRectWithSize:CGSizeMake(320, 0) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15]} context:nil];
    }
    else
    {
        textRect = [model.title boundingRectWithSize:CGSizeMake(320, 0) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15]} context:nil];
    }
    CGFloat imgHeight = 0;
    NSInteger  row = model.imageList.count /3;
    
    if (model.imageList.count > 0)
    {
        hotImageList *imgModel = [model.imageList objectAtIndex:row];
        imgHeight += imgModel.list.height * 0.58;

    }
    CGFloat h = textRect.size.height + 120 + (row +1) * imgHeight;
    return h;
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
