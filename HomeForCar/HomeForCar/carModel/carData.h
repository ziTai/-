//
//  carData.h
//
//  Created by mac  on 16/3/8
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface carData : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSArray *lists;
@property (nonatomic, strong) NSString *firstLetter;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
