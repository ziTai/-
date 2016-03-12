//
//  hotData.h
//
//  Created by mac  on 16/3/7
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface hotData : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *cursor;
@property (nonatomic, strong) NSArray *itemList;
@property (nonatomic, assign) BOOL hasMore;
@property (nonatomic, assign) id location;
@property (nonatomic, assign) double pageCount;
@property (nonatomic, assign) BOOL needClean;
@property (nonatomic, assign) double limitId;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
