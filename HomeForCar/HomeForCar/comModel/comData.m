//
//  comData.m
//
//  Created by mac  on 16/3/8
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "comData.h"
#import "comItemList.h"


NSString *const kcomDataItemList = @"itemList";


@interface comData ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation comData

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
    NSObject *receivedcomItemList = [dict objectForKey:kcomDataItemList];
    NSMutableArray *parsedcomItemList = [NSMutableArray array];
    if ([receivedcomItemList isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedcomItemList) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedcomItemList addObject:[comItemList modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedcomItemList isKindOfClass:[NSDictionary class]]) {
       [parsedcomItemList addObject:[comItemList modelObjectWithDictionary:(NSDictionary *)receivedcomItemList]];
    }

    self.itemList = [NSArray arrayWithArray:parsedcomItemList];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForItemList] forKey:kcomDataItemList];

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

    self.itemList = [aDecoder decodeObjectForKey:kcomDataItemList];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_itemList forKey:kcomDataItemList];
}

- (id)copyWithZone:(NSZone *)zone
{
    comData *copy = [[comData alloc] init];
    
    if (copy) {

        copy.itemList = [self.itemList copyWithZone:zone];
    }
    
    return copy;
}


@end
