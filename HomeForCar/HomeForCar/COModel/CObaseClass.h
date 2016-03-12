//
//  CObaseClass.h
//
//  Created by mac  on 16/3/11
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface CObaseClass : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double searchTime;
@property (nonatomic, assign) double checkTime;
@property (nonatomic, strong) NSArray *data;
@property (nonatomic, assign) BOOL success;
@property (nonatomic, assign) id message;
@property (nonatomic, strong) NSString *requestId;
@property (nonatomic, assign) double cacheTime;
@property (nonatomic, assign) double errorCode;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
