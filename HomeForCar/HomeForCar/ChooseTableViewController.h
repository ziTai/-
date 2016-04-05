//
//  ChooseTableViewController.h
//  HomeForCar
//
//  Created by _ziTai on 16/3/10.
//  Copyright © 2016年 _ziTai. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol chooseDelgate <NSObject>

-(void)goBackChoose;

@end
@interface ChooseTableViewController : UITableViewController
@property(nonatomic,assign)id<chooseDelgate>delegate;
@end
