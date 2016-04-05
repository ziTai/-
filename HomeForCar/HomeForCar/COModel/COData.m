//
//  COData.m
//
//  Created by mac  on 16/3/11
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "COData.h"


NSString *const kCODataBrandName = @"brandName";
NSString *const kCODataBrandId = @"brandId";
NSString *const kCODataCountry = @"country";
NSString *const kCODataBrandLogo = @"brandLogo";
NSString *const kCODataHeat = @"heat";


@interface COData ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation COData

@synthesize brandName = _brandName;
@synthesize brandId = _brandId;
@synthesize country = _country;
@synthesize brandLogo = _brandLogo;
@synthesize heat = _heat;


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
            self.brandName = [self objectOrNilForKey:kCODataBrandName fromDictionary:dict];
            self.brandId = [[self objectOrNilForKey:kCODataBrandId fromDictionary:dict] doubleValue];
            self.country = [self objectOrNilForKey:kCODataCountry fromDictionary:dict];
            self.brandLogo = [self objectOrNilForKey:kCODataBrandLogo fromDictionary:dict];
            self.heat = [[self objectOrNilForKey:kCODataHeat fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.brandName forKey:kCODataBrandName];
    [mutableDict setValue:[NSNumber numberWithDouble:self.brandId] forKey:kCODataBrandId];
    [mutableDict setValue:self.country forKey:kCODataCountry];
    [mutableDict setValue:self.brandLogo forKey:kCODataBrandLogo];
    [mutableDict setValue:[NSNumber numberWithDouble:self.heat] forKey:kCODataHeat];

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

    self.brandName = [aDecoder decodeObjectForKey:kCODataBrandName];
    self.brandId = [aDecoder decodeDoubleForKey:kCODataBrandId];
    self.country = [aDecoder decodeObjectForKey:kCODataCountry];
    self.brandLogo = [aDecoder decodeObjectForKey:kCODataBrandLogo];
    self.heat = [aDecoder decodeDoubleForKey:kCODataHeat];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_brandName forKey:kCODataBrandName];
    [aCoder encodeDouble:_brandId forKey:kCODataBrandId];
    [aCoder encodeObject:_country forKey:kCODataCountry];
    [aCoder encodeObject:_brandLogo forKey:kCODataBrandLogo];
    [aCoder encodeDouble:_heat forKey:kCODataHeat];
}

- (id)copyWithZone:(NSZone *)zone
{
    COData *copy = [[COData alloc] init];
    
    if (copy) {

        copy.brandName = [self.brandName copyWithZone:zone];
        copy.brandId = self.brandId;
        copy.country = [self.country copyWithZone:zone];
        copy.brandLogo = [self.brandLogo copyWithZone:zone];
        copy.heat = self.heat;
    }
    
    return copy;
}


@end
