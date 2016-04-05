//
//  ChooseTableViewController.m
//  HomeForCar
//
//  Created by _ziTai on 16/3/10.
//  Copyright © 2016年 _ziTai. All rights reserved.
//

#import "ChooseTableViewController.h"
#import "ProgressTableViewCell.h"
#import "CarKindTableViewCell.h"
#import "CourceTableViewCell.h"
#import "FindCarViewController.h"
#import "MBProgressHUD.h"
@interface ChooseTableViewController ()<UITableViewDelegate,chooseDelgate>
{
    NSInteger       minPrice;
    NSInteger       maxPrice;
    NSInteger       minCenX;
    NSInteger       maxCeny;
}
@end

@implementation ChooseTableViewController
- (void)viewDidLoad
{
    [super viewDidLoad];
    minPrice = 5;
    maxPrice = 150;
    self.tableView.rowHeight = 200;
    [self.tableView registerNib:[UINib nibWithNibName:@"ProgressTableViewCell" bundle:nil] forCellReuseIdentifier:@"proCell"];
    [self.tableView registerNib:[UINib nibWithNibName:@"CarKindTableViewCell" bundle:nil] forCellReuseIdentifier:@"carCell"];
    [self.tableView registerNib:[UINib nibWithNibName:@"CourceTableViewCell" bundle:nil] forCellReuseIdentifier:@"couCell"];
    maxCeny = self.view.frame.size.width - 15;
    minCenX = 15;
    self.delegate = self;

}
-(void)goBackChoose
{
    ProgressTableViewCell *cell = [self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
    cell.minButton.frame = CGRectMake(15 - cell.minButton.frame.size.width/2.0, cell.minButton.frame.origin.y, cell.minButton.frame.size.width, cell.minButton.frame.size.height);
    cell.maxButton.frame = CGRectMake(self.view.frame.size.width - 15 - cell.maxButton.frame.size.width / 2.0 , cell.maxButton.frame.origin.y, cell.maxButton.frame.size.width, cell.maxButton.frame.size.height);
    minPrice = 5;
    maxPrice = 150;
    maxCeny = self.view.frame.size.width - 15;
    minCenX = 15;
    cell.lineView.frame = CGRectMake(cell.minButton.center.x, cell.lineView.frame.origin.y, cell.maxButton.center.x - cell.minButton.center.x, 4);
    cell.priceLabel.text = @"不限";
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.mode = MBProgressHUDModeText;
    hud.labelText = @"已重置";
    [hud hide:YES afterDelay:0.678];
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
    if (indexPath.section == 0)
    {
        ProgressTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"proCell" forIndexPath:indexPath];
        UIPanGestureRecognizer *minPan = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(panActive:)];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        [cell.minButton addGestureRecognizer:minPan];
        UIPanGestureRecognizer *maxPan = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(panActive:)];
        [cell.maxButton addGestureRecognizer:maxPan];
        return cell;
    }
    if (indexPath.section == 1) {
        CarKindTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"carCell" forIndexPath:indexPath];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        [cell.butArr enumerateObjectsUsingBlock:^(UIButton*  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            [obj addTarget:self action:@selector(butClick:) forControlEvents:UIControlEventTouchUpInside];
        }];
        return cell;
    }
    else
    {
        CourceTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"couCell" forIndexPath:indexPath];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        [cell.butArr enumerateObjectsUsingBlock:^(UIButton*  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            [obj addTarget:self action:@selector(butClick:) forControlEvents:UIControlEventTouchUpInside];
        }];
        return cell;
        
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return 0;
    }
    return 20;
}
//按钮点击方法
-(void)butClick:(UIButton*)but
{
    NSLog(@"%@",but.titleLabel.text);
}
//刷新所选的数据
-(void)reloadChooseData
{

}
-(void)panActive:(UIPanGestureRecognizer *)gesture
{
    gesture.enabled = YES;
    UIButton *but = (UIButton*)gesture.view;
    ProgressTableViewCell *cell = (ProgressTableViewCell*)gesture.view.superview.superview;
    switch (gesture.state)
    {
        case UIGestureRecognizerStateBegan:
//            NSLog(@"%f",gesture.view.center.x);
            break;
        case UIGestureRecognizerStateChanged:
        {

            CGPoint point = [gesture translationInView:gesture.view];
            gesture.view.frame = CGRectOffset(gesture.view.frame, point.x, 0);

            [gesture setTranslation:CGPointZero inView:gesture.view];
            
            if ([but.titleLabel.text isEqualToString:@"min"])
            {
                
                minPrice = (gesture.view.center.x - 20) / (cell.contentView.frame.size.width - 40) *145;
                minCenX = gesture.view.center.x;
                cell.lineView.frame = CGRectMake(minCenX, cell.lineView.frame.origin.y,maxCeny - minCenX, 4);
            }
            else
            {
                maxCeny = gesture.view.center.x;
                maxPrice = (gesture.view.center.x - 20) / (cell.contentView.frame.size.width - 40) *145;
                cell.lineView.frame = CGRectMake(minCenX, cell.lineView.frame.origin.y,  maxCeny - minCenX, 4);

            }

            if (gesture.view.center.x  < 15 || gesture.view.center.x > (self.view.frame.size.width - 15)|| minPrice >= maxPrice - 1)
            {
                gesture.enabled = NO;
            }

            if (minPrice <= 5)
            {
                if (maxPrice >= 150)
                {
                    cell.priceLabel.text = @"不限";
                }
                else
                {
                    cell.priceLabel.text = [NSString stringWithFormat:@"%ld万以下",maxPrice];
                }
            }
            else
            {
                if (maxPrice >= 150) {
                    cell.priceLabel.text = [NSString stringWithFormat:@"%ld万以上",minPrice];
                }
                else
                {
                    cell.priceLabel.text = [NSString stringWithFormat:@"%ld~%ld万元",minPrice,maxPrice];
                }
            }
            
        }
            break;
        case UIGestureRecognizerStateEnded:
        {
            [self reloadChooseData];
        }
            break;
            
        default:
            break;
    }

}
@end
