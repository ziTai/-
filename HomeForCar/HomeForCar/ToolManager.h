//
//  ToolManager.h
//  HomeForCar
//
//  Created by _ziTai on 16/3/4.
//  Copyright © 2016年 _ziTai. All rights reserved.
//

#import <Foundation/Foundation.h>
@protocol toolDelgate <NSObject>

-(void)didGetDetailCar:(NSDictionary*)dic;
-(void)didGetCompetitorsList:(NSDictionary *)dic;
-(void)didGetBrandStory:(NSDictionary *)dic;

@end


@interface ToolManager : NSObject
@property (assign, nonatomic) id <toolDelgate> delegate;
//获得新闻列表
-(void)getNewListWith:(NSString*)url;
//获得热门列表
-(void)getHotListWithTag:(NSInteger)tag;
//获得社区列表
-(void)getCommunityList;
//获得详细的社区列表
-(void)getDetailCommunityListWithUrl:(NSString*)url;
//获得汽车列表
-(void)getCarList;
//得到新闻列表
-(void)getNewsDetailWithartID:(NSString*)artID;
//获取品牌详细内容
-(void)getDetailCarWithName:(NSInteger )count;
//获取竞争对手列表
-(void)getCompetitorsList;
//品牌故事
-(void)brandStory:(NSInteger)brandID;
@end
