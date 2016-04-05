//
//  comItemList.h
//
//  Created by mac  on 16/3/8
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface comItemList : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double status;
@property (nonatomic, assign) double clubId;
@property (nonatomic, assign) double topicCount;
@property (nonatomic, strong) NSString *logoUrl;
@property (nonatomic, assign) double memberCount;
@property (nonatomic, assign) double lastPostTime;
@property (nonatomic, assign) BOOL joinable;
@property (nonatomic, assign) double todayTopicCount;
@property (nonatomic, strong) NSString *desc;
@property (nonatomic, strong) NSString *name;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
