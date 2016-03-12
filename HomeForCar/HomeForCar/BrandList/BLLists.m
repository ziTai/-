//
//  BLLists.m
//
//  Created by mac  on 16/3/11
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "BLLists.h"


NSString *const kBLListsId = @"id";
NSString *const kBLListsMaxPrice = @"maxPrice";
NSString *const kBLListsHasUpcoming = @"hasUpcoming";
NSString *const kBLListsImgUrl = @"imgUrl";
NSString *const kBLListsMinPrice = @"minPrice";
NSString *const kBLListsFactoryId = @"factoryId";
NSString *const kBLListsLevel = @"level";
NSString *const kBLListsHasNewEnergy = @"hasNewEnergy";
NSString *const kBLListsHasNewCar = @"hasNewCar";
NSString *const kBLListsFullname = @"fullname";
NSString *const kBLListsName = @"name";
NSString *const kBLListsFactoryName = @"factoryName";


@interface BLLists ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation BLLists

@synthesize listsIdentifier = _listsIdentifier;
@synthesize maxPrice = _maxPrice;
@synthesize hasUpcoming = _hasUpcoming;
@synthesize imgUrl = _imgUrl;
@synthesize minPrice = _minPrice;
@synthesize factoryId = _factoryId;
@synthesize level = _level;
@synthesize hasNewEnergy = _hasNewEnergy;
@synthesize hasNewCar = _hasNewCar;
@synthesize fullname = _fullname;
@synthesize name = _name;
@synthesize factoryName = _factoryName;


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
            self.listsIdentifier = [[self objectOrNilForKey:kBLListsId fromDictionary:dict] doubleValue];
            self.maxPrice = [[self objectOrNilForKey:kBLListsMaxPrice fromDictionary:dict] doubleValue];
            self.hasUpcoming = [[self objectOrNilForKey:kBLListsHasUpcoming fromDictionary:dict] boolValue];
            self.imgUrl = [self objectOrNilForKey:kBLListsImgUrl fromDictionary:dict];
            self.minPrice = [[self objectOrNilForKey:kBLListsMinPrice fromDictionary:dict] doubleValue];
            self.factoryId = [[self objectOrNilForKey:kBLListsFactoryId fromDictionary:dict] doubleValue];
            self.level = [self objectOrNilForKey:kBLListsLevel fromDictionary:dict];
            self.hasNewEnergy = [[self objectOrNilForKey:kBLListsHasNewEnergy fromDictionary:dict] boolValue];
            self.hasNewCar = [[self objectOrNilForKey:kBLListsHasNewCar fromDictionary:dict] boolValue];
            self.fullname = [self objectOrNilForKey:kBLListsFullname fromDictionary:dict];
            self.name = [self objectOrNilForKey:kBLListsName fromDictionary:dict];
            self.factoryName = [self objectOrNilForKey:kBLListsFactoryName fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.listsIdentifier] forKey:kBLListsId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.maxPrice] forKey:kBLListsMaxPrice];
    [mutableDict setValue:[NSNumber numberWithBool:self.hasUpcoming] forKey:kBLListsHasUpcoming];
    [mutableDict setValue:self.imgUrl forKey:kBLListsImgUrl];
    [mutableDict setValue:[NSNumber numberWithDouble:self.minPrice] forKey:kBLListsMinPrice];
    [mutableDict setValue:[NSNumber numberWithDouble:self.factoryId] forKey:kBLListsFactoryId];
    [mutableDict setValue:self.level forKey:kBLListsLevel];
    [mutableDict setValue:[NSNumber numberWithBool:self.hasNewEnergy] forKey:kBLListsHasNewEnergy];
    [mutableDict setValue:[NSNumber numberWithBool:self.hasNewCar] forKey:kBLListsHasNewCar];
    [mutableDict setValue:self.fullname forKey:kBLListsFullname];
    [mutableDict setValue:self.name forKey:kBLListsName];
    [mutableDict setValue:self.factoryName forKey:kBLListsFactoryName];

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

    self.listsIdentifier = [aDecoder decodeDoubleForKey:kBLListsId];
    self.maxPrice = [aDecoder decodeDoubleForKey:kBLListsMaxPrice];
    self.hasUpcoming = [aDecoder decodeBoolForKey:kBLListsHasUpcoming];
    self.imgUrl = [aDecoder decodeObjectForKey:kBLListsImgUrl];
    self.minPrice = [aDecoder decodeDoubleForKey:kBLListsMinPrice];
    self.factoryId = [aDecoder decodeDoubleForKey:kBLListsFactoryId];
    self.level = [aDecoder decodeObjectForKey:kBLListsLevel];
    self.hasNewEnergy = [aDecoder decodeBoolForKey:kBLListsHasNewEnergy];
    self.hasNewCar = [aDecoder decodeBoolForKey:kBLListsHasNewCar];
    self.fullname = [aDecoder decodeObjectForKey:kBLListsFullname];
    self.name = [aDecoder decodeObjectForKey:kBLListsName];
    self.factoryName = [aDecoder decodeObjectForKey:kBLListsFactoryName];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_listsIdentifier forKey:kBLListsId];
    [aCoder encodeDouble:_maxPrice forKey:kBLListsMaxPrice];
    [aCoder encodeBool:_hasUpcoming forKey:kBLListsHasUpcoming];
    [aCoder encodeObject:_imgUrl forKey:kBLListsImgUrl];
    [aCoder encodeDouble:_minPrice forKey:kBLListsMinPrice];
    [aCoder encodeDouble:_factoryId forKey:kBLListsFactoryId];
    [aCoder encodeObject:_level forKey:kBLListsLevel];
    [aCoder encodeBool:_hasNewEnergy forKey:kBLListsHasNewEnergy];
    [aCoder encodeBool:_hasNewCar forKey:kBLListsHasNewCar];
    [aCoder encodeObject:_fullname forKey:kBLListsFullname];
    [aCoder encodeObject:_name forKey:kBLListsName];
    [aCoder encodeObject:_factoryName forKey:kBLListsFactoryName];
}

- (id)copyWithZone:(NSZone *)zone
{
    BLLists *copy = [[BLLists alloc] init];
    
    if (copy) {

        copy.listsIdentifier = self.listsIdentifier;
        copy.maxPrice = self.maxPrice;
        copy.hasUpcoming = self.hasUpcoming;
        copy.imgUrl = [self.imgUrl copyWithZone:zone];
        copy.minPrice = self.minPrice;
        copy.factoryId = self.factoryId;
        copy.level = [self.level copyWithZone:zone];
        copy.hasNewEnergy = self.hasNewEnergy;
        copy.hasNewCar = self.hasNewCar;
        copy.fullname = [self.fullname copyWithZone:zone];
        copy.name = [self.name copyWithZone:zone];
        copy.factoryName = [self.factoryName copyWithZone:zone];
    }
    
    return copy;
}


@end
