//
//  DEData.h
//
//  Created by mac  on 16/3/10
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface DEData : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSArray *carSerials;
@property (nonatomic, assign) double recommendHot;
@property (nonatomic, strong) NSString *content;
@property (nonatomic, assign) double status;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *author;
@property (nonatomic, strong) NSString *mediaContent;
@property (nonatomic, strong) NSString *tags;
@property (nonatomic, assign) id relatedText;
@property (nonatomic, assign) double updateTime;
@property (nonatomic, strong) NSArray *images;
@property (nonatomic, assign) double hitCount;
@property (nonatomic, assign) double type;
@property (nonatomic, strong) NSString *sourceUrl;
@property (nonatomic, strong) NSArray *votes;
@property (nonatomic, assign) double upCount;
@property (nonatomic, assign) double articleId;
@property (nonatomic, assign) double downCount;
@property (nonatomic, assign) double mediaId;
@property (nonatomic, assign) double heatDegree;
@property (nonatomic, assign) double commentCount;
@property (nonatomic, assign) double publishTime;
@property (nonatomic, assign) double displayType;
@property (nonatomic, assign) id typeContent;
@property (nonatomic, strong) NSString *mediaName;
@property (nonatomic, assign) id relatedContent;
@property (nonatomic, strong) NSArray *thumbnails;
@property (nonatomic, assign) double categoryId;
@property (nonatomic, assign) BOOL cached;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
