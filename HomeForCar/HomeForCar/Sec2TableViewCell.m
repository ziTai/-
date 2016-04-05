//
//  Sec2TableViewCell.m
//  HomeForCar
//
//  Created by _ziTai on 16/3/8.
//  Copyright © 2016年 _ziTai. All rights reserved.
//

#import "Sec2TableViewCell.h"
#import "CarCollectionViewController.h"
@implementation Sec2TableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (IBAction)buttonClick:(id)sender
{
    [self.delegate carTableView];
}

@end
