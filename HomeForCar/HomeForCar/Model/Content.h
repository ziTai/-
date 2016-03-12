//
//  Content.h
//
//  Created by mac  on 16/3/4
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface Content : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double profileDisplayType;
@property (nonatomic, assign) double recommendHot;
@property (nonatomic, assign) BOOL cached;
@property (nonatomic, assign) double heatDegree;
@property (nonatomic, assign) double hitCount;
@property (nonatomic, strong) NSString *author;
@property (nonatomic, strong) NSString *tags;
@property (nonatomic, strong) NSString *source;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, assign) double commentCount;
@property (nonatomic, assign) double displayType;
@property (nonatomic, assign) double downCount;
@property (nonatomic, assign) double publishTime;
@property (nonatomic, strong) NSArray *thumbnails;
@property (nonatomic, assign) double upCount;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
