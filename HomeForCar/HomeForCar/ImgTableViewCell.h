//
//  ImgTableViewCell.h
//  HomeForCar
//
//  Created by _ziTai on 16/3/4.
//  Copyright © 2016年 _ziTai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ImgTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *img1View;
@property (weak, nonatomic) IBOutlet UIImageView *img2View;
@property (weak, nonatomic) IBOutlet UIImageView *img3;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@end
