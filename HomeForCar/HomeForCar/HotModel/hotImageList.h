//
//  hotImageList.h
//
//  Created by mac  on 16/3/7
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class hotDetail, hotList;

@interface hotImageList : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) hotDetail *detail;
@property (nonatomic, strong) hotList *list;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
