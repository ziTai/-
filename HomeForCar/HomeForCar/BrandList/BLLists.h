//
//  BLLists.h
//
//  Created by mac  on 16/3/11
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface BLLists : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double listsIdentifier;
@property (nonatomic, assign) double maxPrice;
@property (nonatomic, assign) BOOL hasUpcoming;
@property (nonatomic, strong) NSString *imgUrl;
@property (nonatomic, assign) double minPrice;
@property (nonatomic, assign) double factoryId;
@property (nonatomic, strong) NSString *level;
@property (nonatomic, assign) BOOL hasNewEnergy;
@property (nonatomic, assign) BOOL hasNewCar;
@property (nonatomic, strong) NSString *fullname;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *factoryName;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
