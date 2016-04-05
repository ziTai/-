//
//  DECarSerials.h
//
//  Created by mac  on 16/3/10
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface DECarSerials : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double carSerialsIdentifier;
@property (nonatomic, strong) NSString *levelCode;
@property (nonatomic, assign) double hotCarPrice;
@property (nonatomic, strong) NSString *levelName;
@property (nonatomic, assign) BOOL hasBitautoRelation;
@property (nonatomic, strong) NSString *imgUrl;
@property (nonatomic, assign) double minPrice;
@property (nonatomic, strong) NSString *carSerialUrl;
@property (nonatomic, strong) NSString *carSerialPicUrl;
@property (nonatomic, assign) double factoryId;
@property (nonatomic, strong) NSString *carSerialPriceUrl;
@property (nonatomic, assign) double brandId;
@property (nonatomic, strong) NSString *brandLogo;
@property (nonatomic, strong) NSString *brandName;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, assign) double maxPrice;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
