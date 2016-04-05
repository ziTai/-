//
//  CoListTableViewCell.h
//  HomeForCar
//
//  Created by _ziTai on 16/3/11.
//  Copyright © 2016年 _ziTai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CoListTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *numLabel;
@property (weak, nonatomic) IBOutlet UIImageView *headImg;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *courceLabel;
@property (weak, nonatomic) IBOutlet UILabel *hotLabel;

@end
