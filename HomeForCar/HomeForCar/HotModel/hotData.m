//
//  hotData.m
//
//  Created by mac  on 16/3/7
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "hotData.h"
#import "hotItemList.h"


NSString *const khotDataCursor = @"cursor";
NSString *const khotDataItemList = @"itemList";
NSString *const khotDataHasMore = @"hasMore";
NSString *const khotDataLocation = @"location";
NSString *const khotDataPageCount = @"pageCount";
NSString *const khotDataNeedClean = @"needClean";
NSString *const khotDataLimitId = @"limitId";


@interface hotData ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation hotData

@synthesize cursor = _cursor;
@synthesize itemList = _itemList;
@synthesize hasMore = _hasMore;
@synthesize location = _location;
@synthesize pageCount = _pageCount;
@synthesize needClean = _needClean;
@synthesize limitId = _limitId;


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
            self.cursor = [self objectOrNilForKey:khotDataCursor fromDictionary:dict];
    NSObject *receivedhotItemList = [dict objectForKey:khotDataItemList];
    NSMutableArray *parsedhotItemList = [NSMutableArray array];
    if ([receivedhotItemList isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedhotItemList) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedhotItemList addObject:[hotItemList modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedhotItemList isKindOfClass:[NSDictionary class]]) {
       [parsedhotItemList addObject:[hotItemList modelObjectWithDictionary:(NSDictionary *)receivedhotItemList]];
    }

    self.itemList = [NSArray arrayWithArray:parsedhotItemList];
            self.hasMore = [[self objectOrNilForKey:khotDataHasMore fromDictionary:dict] boolValue];
            self.location = [self objectOrNilForKey:khotDataLocation fromDictionary:dict];
            self.pageCount = [[self objectOrNilForKey:khotDataPageCount fromDictionary:dict] doubleValue];
            self.needClean = [[self objectOrNilForKey:khotDataNeedClean fromDictionary:dict] boolValue];
            self.limitId = [[self objectOrNilForKey:khotDataLimitId fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.cursor forKey:khotDataCursor];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForItemList] forKey:khotDataItemList];
    [mutableDict setValue:[NSNumber numberWithBool:self.hasMore] forKey:khotDataHasMore];
    [mutableDict setValue:self.location forKey:khotDataLocation];
    [mutableDict setValue:[NSNumber numberWithDouble:self.pageCount] forKey:khotDataPageCount];
    [mutableDict setValue:[NSNumber numberWithBool:self.needClean] forKey:khotDataNeedClean];
    [mutableDict setValue:[NSNumber numberWithDouble:self.limitId] forKey:khotDataLimitId];

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

    self.cursor = [aDecoder decodeObjectForKey:khotDataCursor];
    self.itemList = [aDecoder decodeObjectForKey:khotDataItemList];
    self.hasMore = [aDecoder decodeBoolForKey:khotDataHasMore];
    self.location = [aDecoder decodeObjectForKey:khotDataLocation];
    self.pageCount = [aDecoder decodeDoubleForKey:khotDataPageCount];
    self.needClean = [aDecoder decodeBoolForKey:khotDataNeedClean];
    self.limitId = [aDecoder decodeDoubleForKey:khotDataLimitId];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_cursor forKey:khotDataCursor];
    [aCoder encodeObject:_itemList forKey:khotDataItemList];
    [aCoder encodeBool:_hasMore forKey:khotDataHasMore];
    [aCoder encodeObject:_location forKey:khotDataLocation];
    [aCoder encodeDouble:_pageCount forKey:khotDataPageCount];
    [aCoder encodeBool:_needClean forKey:khotDataNeedClean];
    [aCoder encodeDouble:_limitId forKey:khotDataLimitId];
}

- (id)copyWithZone:(NSZone *)zone
{
    hotData *copy = [[hotData alloc] init];
    
    if (copy) {

        copy.cursor = [self.cursor copyWithZone:zone];
        copy.itemList = [self.itemList copyWithZone:zone];
        copy.hasMore = self.hasMore;
        copy.location = [self.location copyWithZone:zone];
        copy.pageCount = self.pageCount;
        copy.needClean = self.needClean;
        copy.limitId = self.limitId;
    }
    
    return copy;
}


@end
