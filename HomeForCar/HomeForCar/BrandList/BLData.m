//
//  BLData.m
//
//  Created by mac  on 16/3/11
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "BLData.h"
#import "BLLists.h"


NSString *const kBLDataFactoryId = @"factoryId";
NSString *const kBLDataFactoryName = @"factoryName";
NSString *const kBLDataLists = @"lists";


@interface BLData ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation BLData

@synthesize factoryId = _factoryId;
@synthesize factoryName = _factoryName;
@synthesize lists = _lists;


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
            self.factoryId = [[self objectOrNilForKey:kBLDataFactoryId fromDictionary:dict] doubleValue];
            self.factoryName = [self objectOrNilForKey:kBLDataFactoryName fromDictionary:dict];
    NSObject *receivedBLLists = [dict objectForKey:kBLDataLists];
    NSMutableArray *parsedBLLists = [NSMutableArray array];
    if ([receivedBLLists isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedBLLists) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedBLLists addObject:[BLLists modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedBLLists isKindOfClass:[NSDictionary class]]) {
       [parsedBLLists addObject:[BLLists modelObjectWithDictionary:(NSDictionary *)receivedBLLists]];
    }

    self.lists = [NSArray arrayWithArray:parsedBLLists];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.factoryId] forKey:kBLDataFactoryId];
    [mutableDict setValue:self.factoryName forKey:kBLDataFactoryName];
    NSMutableArray *tempArrayForLists = [NSMutableArray array];
    for (NSObject *subArrayObject in self.lists) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForLists addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForLists addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForLists] forKey:kBLDataLists];

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

    self.factoryId = [aDecoder decodeDoubleForKey:kBLDataFactoryId];
    self.factoryName = [aDecoder decodeObjectForKey:kBLDataFactoryName];
    self.lists = [aDecoder decodeObjectForKey:kBLDataLists];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_factoryId forKey:kBLDataFactoryId];
    [aCoder encodeObject:_factoryName forKey:kBLDataFactoryName];
    [aCoder encodeObject:_lists forKey:kBLDataLists];
}

- (id)copyWithZone:(NSZone *)zone
{
    BLData *copy = [[BLData alloc] init];
    
    if (copy) {

        copy.factoryId = self.factoryId;
        copy.factoryName = [self.factoryName copyWithZone:zone];
        copy.lists = [self.lists copyWithZone:zone];
    }
    
    return copy;
}


@end
