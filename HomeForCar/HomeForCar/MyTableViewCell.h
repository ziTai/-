//
//  MyTableViewCell.h
//  HomeForCar
//
//  Created by _ziTai on 16/3/4.
//  Copyright © 2016年 _ziTai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *sourceLabel;
@property (weak, nonatomic) IBOutlet UIImageView *imgView;

@end
