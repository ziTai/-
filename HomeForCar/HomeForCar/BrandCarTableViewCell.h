//
//  BrandCarTableViewCell.h
//  HomeForCar
//
//  Created by _ziTai on 16/3/11.
//  Copyright © 2016年 _ziTai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BrandCarTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *carImg;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property (weak, nonatomic) IBOutlet UILabel *kindLabel;

@end
