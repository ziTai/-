//
//  hotItemList.h
//
//  Created by mac  on 16/3/7
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class hotAuthor,hotImageList;

@interface hotItemList : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double tagId;
@property (nonatomic, strong) NSString *location;
@property (nonatomic, strong) NSArray   *imageList;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *summary;
@property (nonatomic, assign) double zanCount;
@property (nonatomic, strong) NSString *clubName;
@property (nonatomic, assign) double limitId;
@property (nonatomic, assign) double topicId;
@property (nonatomic, assign) double lastReplyTime;
@property (nonatomic, assign) BOOL myself;
@property (nonatomic, assign) double jinghuaTime;
@property (nonatomic, assign) double type;
@property (nonatomic, assign) BOOL zanable;
@property (nonatomic, assign) id tagName;
@property (nonatomic, strong) NSDictionary* extraData;
@property (nonatomic, assign) double clubId;
@property (nonatomic, assign) double hotTime;
@property (nonatomic, assign) double commentCount;
@property (nonatomic, assign) double topicOperation;
@property (nonatomic, assign) double createTime;
@property (nonatomic, strong) NSString *webId;
@property (nonatomic, strong) hotAuthor *author;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
