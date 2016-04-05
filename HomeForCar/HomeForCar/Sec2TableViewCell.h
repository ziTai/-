//
//  Sec2TableViewCell.h
//  HomeForCar
//
//  Created by _ziTai on 16/3/8.
//  Copyright © 2016年 _ziTai. All rights reserved.
//

#import <UIKit/UIKit.h>



@protocol secDelegate <NSObject>

-(void)carTableView;

@end
@interface Sec2TableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutletCollection(UIImageView) NSArray *imgArr;
@property (assign, nonatomic) id <secDelegate> delegate;
@end

