//
//  BLData.h
//
//  Created by mac  on 16/3/11
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface BLData : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double factoryId;
@property (nonatomic, strong) NSString *factoryName;
@property (nonatomic, strong) NSArray *lists;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
