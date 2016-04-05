//
//  comData.h
//
//  Created by mac  on 16/3/8
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface comData : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSArray *itemList;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
