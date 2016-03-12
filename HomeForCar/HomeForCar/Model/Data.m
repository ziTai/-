//
//  Data.m
//
//  Created by mac  on 16/3/4
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "Data.h"
#import "ItemList.h"


NSString *const kDataClearUp = @"clearUp";
NSString *const kDataItemList = @"itemList";


@interface Data ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation Data

@synthesize clearUp = _clearUp;
@synthesize itemList = _itemList;


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
            self.clearUp = [[self objectOrNilForKey:kDataClearUp fromDictionary:dict] boolValue];
    NSObject *receivedItemList = [dict objectForKey:kDataItemList];
    NSMutableArray *parsedItemList = [NSMutableArray array];
    if ([receivedItemList isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedItemList) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedItemList addObject:[ItemList modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedItemList isKindOfClass:[NSDictionary class]]) {
       [parsedItemList addObject:[ItemList modelObjectWithDictionary:(NSDictionary *)receivedItemList]];
    }

    self.itemList = [NSArray arrayWithArray:parsedItemList];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithBool:self.clearUp] forKey:kDataClearUp];
    NSMutableArray *tempArrayForItemList = [NSMutableArray array];
    for (NSObject *subArrayObject in self.itemList) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForItemList addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForItemList addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForItemList] forKey:kDataItemList];

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

    self.clearUp = [aDecoder decodeBoolForKey:kDataClearUp];
    self.itemList = [aDecoder decodeObjectForKey:kDataItemList];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeBool:_clearUp forKey:kDataClearUp];
    [aCoder encodeObject:_itemList forKey:kDataItemList];
}

- (id)copyWithZone:(NSZone *)zone
{
    Data *copy = [[Data alloc] init];
    
    if (copy) {

        copy.clearUp = self.clearUp;
        copy.itemList = [self.itemList copyWithZone:zone];
    }
    
    return copy;
}


@end
