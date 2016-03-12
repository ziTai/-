//
//  COData.h
//
//  Created by mac  on 16/3/11
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface COData : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *brandName;
@property (nonatomic, assign) double brandId;
@property (nonatomic, strong) NSString *country;
@property (nonatomic, strong) NSString *brandLogo;
@property (nonatomic, assign) double heat;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
