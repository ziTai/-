//
//  DECarSerials.m
//
//  Created by mac  on 16/3/10
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "DECarSerials.h"


NSString *const kDECarSerialsId = @"id";
NSString *const kDECarSerialsLevelCode = @"levelCode";
NSString *const kDECarSerialsHotCarPrice = @"hotCarPrice";
NSString *const kDECarSerialsLevelName = @"levelName";
NSString *const kDECarSerialsHasBitautoRelation = @"hasBitautoRelation";
NSString *const kDECarSerialsImgUrl = @"imgUrl";
NSString *const kDECarSerialsMinPrice = @"minPrice";
NSString *const kDECarSerialsCarSerialUrl = @"carSerialUrl";
NSString *const kDECarSerialsCarSerialPicUrl = @"carSerialPicUrl";
NSString *const kDECarSerialsFactoryId = @"factoryId";
NSString *const kDECarSerialsCarSerialPriceUrl = @"carSerialPriceUrl";
NSString *const kDECarSerialsBrandId = @"brandId";
NSString *const kDECarSerialsBrandLogo = @"brandLogo";
NSString *const kDECarSerialsBrandName = @"brandName";
NSString *const kDECarSerialsName = @"name";
NSString *const kDECarSerialsMaxPrice = @"maxPrice";


@interface DECarSerials ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation DECarSerials

@synthesize carSerialsIdentifier = _carSerialsIdentifier;
@synthesize levelCode = _levelCode;
@synthesize hotCarPrice = _hotCarPrice;
@synthesize levelName = _levelName;
@synthesize hasBitautoRelation = _hasBitautoRelation;
@synthesize imgUrl = _imgUrl;
@synthesize minPrice = _minPrice;
@synthesize carSerialUrl = _carSerialUrl;
@synthesize carSerialPicUrl = _carSerialPicUrl;
@synthesize factoryId = _factoryId;
@synthesize carSerialPriceUrl = _carSerialPriceUrl;
@synthesize brandId = _brandId;
@synthesize brandLogo = _brandLogo;
@synthesize brandName = _brandName;
@synthesize name = _name;
@synthesize maxPrice = _maxPrice;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict
{
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
            self.carSerialsIdentifier = [[self objectOrNilForKey:kDECarSerialsId fromDictionary:dict] doubleValue];
            self.levelCode = [self objectOrNilForKey:kDECarSerialsLevelCode fromDictionary:dict];
            self.hotCarPrice = [[self objectOrNilForKey:kDECarSerialsHotCarPrice fromDictionary:dict] doubleValue];
            self.levelName = [self objectOrNilForKey:kDECarSerialsLevelName fromDictionary:dict];
            self.hasBitautoRelation = [[self objectOrNilForKey:kDECarSerialsHasBitautoRelation fromDictionary:dict] boolValue];
            self.imgUrl = [self objectOrNilForKey:kDECarSerialsImgUrl fromDictionary:dict];
            self.minPrice = [[self objectOrNilForKey:kDECarSerialsMinPrice fromDictionary:dict] doubleValue];
            self.carSerialUrl = [self objectOrNilForKey:kDECarSerialsCarSerialUrl fromDictionary:dict];
            self.carSerialPicUrl = [self objectOrNilForKey:kDECarSerialsCarSerialPicUrl fromDictionary:dict];
            self.factoryId = [[self objectOrNilForKey:kDECarSerialsFactoryId fromDictionary:dict] doubleValue];
            self.carSerialPriceUrl = [self objectOrNilForKey:kDECarSerialsCarSerialPriceUrl fromDictionary:dict];
            self.brandId = [[self objectOrNilForKey:kDECarSerialsBrandId fromDictionary:dict] doubleValue];
            self.brandLogo = [self objectOrNilForKey:kDECarSerialsBrandLogo fromDictionary:dict];
            self.brandName = [self objectOrNilForKey:kDECarSerialsBrandName fromDictionary:dict];
            self.name = [self objectOrNilForKey:kDECarSerialsName fromDictionary:dict];
            self.maxPrice = [[self objectOrNilForKey:kDECarSerialsMaxPrice fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.carSerialsIdentifier] forKey:kDECarSerialsId];
    [mutableDict setValue:self.levelCode forKey:kDECarSerialsLevelCode];
    [mutableDict setValue:[NSNumber numberWithDouble:self.hotCarPrice] forKey:kDECarSerialsHotCarPrice];
    [mutableDict setValue:self.levelName forKey:kDECarSerialsLevelName];
    [mutableDict setValue:[NSNumber numberWithBool:self.hasBitautoRelation] forKey:kDECarSerialsHasBitautoRelation];
    [mutableDict setValue:self.imgUrl forKey:kDECarSerialsImgUrl];
    [mutableDict setValue:[NSNumber numberWithDouble:self.minPrice] forKey:kDECarSerialsMinPrice];
    [mutableDict setValue:self.carSerialUrl forKey:kDECarSerialsCarSerialUrl];
    [mutableDict setValue:self.carSerialPicUrl forKey:kDECarSerialsCarSerialPicUrl];
    [mutableDict setValue:[NSNumber numberWithDouble:self.factoryId] forKey:kDECarSerialsFactoryId];
    [mutableDict setValue:self.carSerialPriceUrl forKey:kDECarSerialsCarSerialPriceUrl];
    [mutableDict setValue:[NSNumber numberWithDouble:self.brandId] forKey:kDECarSerialsBrandId];
    [mutableDict setValue:self.brandLogo forKey:kDECarSerialsBrandLogo];
    [mutableDict setValue:self.brandName forKey:kDECarSerialsBrandName];
    [mutableDict setValue:self.name forKey:kDECarSerialsName];
    [mutableDict setValue:[NSNumber numberWithDouble:self.maxPrice] forKey:kDECarSerialsMaxPrice];

    return [NSDictionary dictionaryWithDictionary:mutableDict];
}

- (NSString *)description 
{
    return [NSString stringWithFormat:@"%@", [self dictionaryRepresentation]];
}

#pragma mark - Helper Method
- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict
{
    id object = [dict objectForKey:aKey];
    return [object isEqual:[NSNull null]] ? nil : object;
}


#pragma mark - NSCoding Methods

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];

    self.carSerialsIdentifier = [aDecoder decodeDoubleForKey:kDECarSerialsId];
    self.levelCode = [aDecoder decodeObjectForKey:kDECarSerialsLevelCode];
    self.hotCarPrice = [aDecoder decodeDoubleForKey:kDECarSerialsHotCarPrice];
    self.levelName = [aDecoder decodeObjectForKey:kDECarSerialsLevelName];
    self.hasBitautoRelation = [aDecoder decodeBoolForKey:kDECarSerialsHasBitautoRelation];
    self.imgUrl = [aDecoder decodeObjectForKey:kDECarSerialsImgUrl];
    self.minPrice = [aDecoder decodeDoubleForKey:kDECarSerialsMinPrice];
    self.carSerialUrl = [aDecoder decodeObjectForKey:kDECarSerialsCarSerialUrl];
    self.carSerialPicUrl = [aDecoder decodeObjectForKey:kDECarSerialsCarSerialPicUrl];
    self.factoryId = [aDecoder decodeDoubleForKey:kDECarSerialsFactoryId];
    self.carSerialPriceUrl = [aDecoder decodeObjectForKey:kDECarSerialsCarSerialPriceUrl];
    self.brandId = [aDecoder decodeDoubleForKey:kDECarSerialsBrandId];
    self.brandLogo = [aDecoder decodeObjectForKey:kDECarSerialsBrandLogo];
    self.brandName = [aDecoder decodeObjectForKey:kDECarSerialsBrandName];
    self.name = [aDecoder decodeObjectForKey:kDECarSerialsName];
    self.maxPrice = [aDecoder decodeDoubleForKey:kDECarSerialsMaxPrice];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_carSerialsIdentifier forKey:kDECarSerialsId];
    [aCoder encodeObject:_levelCode forKey:kDECarSerialsLevelCode];
    [aCoder encodeDouble:_hotCarPrice forKey:kDECarSerialsHotCarPrice];
    [aCoder encodeObject:_levelName forKey:kDECarSerialsLevelName];
    [aCoder encodeBool:_hasBitautoRelation forKey:kDECarSerialsHasBitautoRelation];
    [aCoder encodeObject:_imgUrl forKey:kDECarSerialsImgUrl];
    [aCoder encodeDouble:_minPrice forKey:kDECarSerialsMinPrice];
    [aCoder encodeObject:_carSerialUrl forKey:kDECarSerialsCarSerialUrl];
    [aCoder encodeObject:_carSerialPicUrl forKey:kDECarSerialsCarSerialPicUrl];
    [aCoder encodeDouble:_factoryId forKey:kDECarSerialsFactoryId];
    [aCoder encodeObject:_carSerialPriceUrl forKey:kDECarSerialsCarSerialPriceUrl];
    [aCoder encodeDouble:_brandId forKey:kDECarSerialsBrandId];
    [aCoder encodeObject:_brandLogo forKey:kDECarSerialsBrandLogo];
    [aCoder encodeObject:_brandName forKey:kDECarSerialsBrandName];
    [aCoder encodeObject:_name forKey:kDECarSerialsName];
    [aCoder encodeDouble:_maxPrice forKey:kDECarSerialsMaxPrice];
}

- (id)copyWithZone:(NSZone *)zone
{
    DECarSerials *copy = [[DECarSerials alloc] init];
    
    if (copy) {

        copy.carSerialsIdentifier = self.carSerialsIdentifier;
        copy.levelCode = [self.levelCode copyWithZone:zone];
        copy.hotCarPrice = self.hotCarPrice;
        copy.levelName = [self.levelName copyWithZone:zone];
        copy.hasBitautoRelation = self.hasBitautoRelation;
        copy.imgUrl = [self.imgUrl copyWithZone:zone];
        copy.minPrice = self.minPrice;
        copy.carSerialUrl = [self.carSerialUrl copyWithZone:zone];
        copy.carSerialPicUrl = [self.carSerialPicUrl copyWithZone:zone];
        copy.factoryId = self.factoryId;
        copy.carSerialPriceUrl = [self.carSerialPriceUrl copyWithZone:zone];
        copy.brandId = self.brandId;
        copy.brandLogo = [self.brandLogo copyWithZone:zone];
        copy.brandName = [self.brandName copyWithZone:zone];
        copy.name = [self.name copyWithZone:zone];
        copy.maxPrice = self.maxPrice;
    }
    
    return copy;
}


@end
