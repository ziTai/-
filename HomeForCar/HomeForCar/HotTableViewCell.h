//
//  HotTableViewCell.h
//  HomeForCar
//
//  Created by _ziTai on 16/3/7.
//  Copyright © 2016年 _ziTai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HotTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *headImgView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UILabel *titltLabel;
@property (strong, nonatomic) IBOutletCollection(UIImageView) NSArray *imgArr;
@property (weak, nonatomic) IBOutlet UILabel *sourceLabel;
@property (weak, nonatomic) IBOutlet UIButton *upButton;
@property (weak, nonatomic) IBOutlet UIButton *sayButton;



@end
