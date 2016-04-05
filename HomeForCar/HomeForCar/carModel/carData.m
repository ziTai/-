//
//  carData.m
//
//  Created by mac  on 16/3/8
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "carData.h"
#import "carLists.h"


NSString *const kcarDataLists = @"lists";
NSString *const kcarDataFirstLetter = @"firstLetter";


@interface carData ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation carData

@synthesize lists = _lists;
@synthesize firstLetter = _firstLetter;


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
    NSObject *receivedcarLists = [dict objectForKey:kcarDataLists];
    NSMutableArray *parsedcarLists = [NSMutableArray array];
    if ([receivedcarLists isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedcarLists) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedcarLists addObject:[carLists modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedcarLists isKindOfClass:[NSDictionary class]]) {
       [parsedcarLists addObject:[carLists modelObjectWithDictionary:(NSDictionary *)receivedcarLists]];
    }

    self.lists = [NSArray arrayWithArray:parsedcarLists];
            self.firstLetter = [self objectOrNilForKey:kcarDataFirstLetter fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForLists] forKey:kcarDataLists];
    [mutableDict setValue:self.firstLetter forKey:kcarDataFirstLetter];

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

    self.lists = [aDecoder decodeObjectForKey:kcarDataLists];
    self.firstLetter = [aDecoder decodeObjectForKey:kcarDataFirstLetter];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_lists forKey:kcarDataLists];
    [aCoder encodeObject:_firstLetter forKey:kcarDataFirstLetter];
}

- (id)copyWithZone:(NSZone *)zone
{
    carData *copy = [[carData alloc] init];
    
    if (copy) {

        copy.lists = [self.lists copyWithZone:zone];
        copy.firstLetter = [self.firstLetter copyWithZone:zone];
    }
    
    return copy;
}


@end
