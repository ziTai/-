//
//  BLbaseClass.m
//
//  Created by mac  on 16/3/11
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "BLbaseClass.h"
#import "BLData.h"


NSString *const kBLbaseClassSearchTime = @"searchTime";
NSString *const kBLbaseClassCheckTime = @"checkTime";
NSString *const kBLbaseClassData = @"data";
NSString *const kBLbaseClassSuccess = @"success";
NSString *const kBLbaseClassMessage = @"message";
NSString *const kBLbaseClassRequestId = @"requestId";
NSString *const kBLbaseClassCacheTime = @"cacheTime";
NSString *const kBLbaseClassErrorCode = @"errorCode";


@interface BLbaseClass ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation BLbaseClass

@synthesize searchTime = _searchTime;
@synthesize checkTime = _checkTime;
@synthesize data = _data;
@synthesize success = _success;
@synthesize message = _message;
@synthesize requestId = _requestId;
@synthesize cacheTime = _cacheTime;
@synthesize errorCode = _errorCode;


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
            self.searchTime = [[self objectOrNilForKey:kBLbaseClassSearchTime fromDictionary:dict] doubleValue];
            self.checkTime = [[self objectOrNilForKey:kBLbaseClassCheckTime fromDictionary:dict] doubleValue];
    NSObject *receivedBLData = [dict objectForKey:kBLbaseClassData];
    NSMutableArray *parsedBLData = [NSMutableArray array];
    if ([receivedBLData isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedBLData) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedBLData addObject:[BLData modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedBLData isKindOfClass:[NSDictionary class]]) {
       [parsedBLData addObject:[BLData modelObjectWithDictionary:(NSDictionary *)receivedBLData]];
    }

    self.data = [NSArray arrayWithArray:parsedBLData];
            self.success = [[self objectOrNilForKey:kBLbaseClassSuccess fromDictionary:dict] boolValue];
            self.message = [self objectOrNilForKey:kBLbaseClassMessage fromDictionary:dict];
            self.requestId = [self objectOrNilForKey:kBLbaseClassRequestId fromDictionary:dict];
            self.cacheTime = [[self objectOrNilForKey:kBLbaseClassCacheTime fromDictionary:dict] doubleValue];
            self.errorCode = [[self objectOrNilForKey:kBLbaseClassErrorCode fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.searchTime] forKey:kBLbaseClassSearchTime];
    [mutableDict setValue:[NSNumber numberWithDouble:self.checkTime] forKey:kBLbaseClassCheckTime];
    NSMutableArray *tempArrayForData = [NSMutableArray array];
    for (NSObject *subArrayObject in self.data) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForData addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForData addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForData] forKey:kBLbaseClassData];
    [mutableDict setValue:[NSNumber numberWithBool:self.success] forKey:kBLbaseClassSuccess];
    [mutableDict setValue:self.message forKey:kBLbaseClassMessage];
    [mutableDict setValue:self.requestId forKey:kBLbaseClassRequestId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.cacheTime] forKey:kBLbaseClassCacheTime];
    [mutableDict setValue:[NSNumber numberWithDouble:self.errorCode] forKey:kBLbaseClassErrorCode];

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

    self.searchTime = [aDecoder decodeDoubleForKey:kBLbaseClassSearchTime];
    self.checkTime = [aDecoder decodeDoubleForKey:kBLbaseClassCheckTime];
    self.data = [aDecoder decodeObjectForKey:kBLbaseClassData];
    self.success = [aDecoder decodeBoolForKey:kBLbaseClassSuccess];
    self.message = [aDecoder decodeObjectForKey:kBLbaseClassMessage];
    self.requestId = [aDecoder decodeObjectForKey:kBLbaseClassRequestId];
    self.cacheTime = [aDecoder decodeDoubleForKey:kBLbaseClassCacheTime];
    self.errorCode = [aDecoder decodeDoubleForKey:kBLbaseClassErrorCode];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_searchTime forKey:kBLbaseClassSearchTime];
    [aCoder encodeDouble:_checkTime forKey:kBLbaseClassCheckTime];
    [aCoder encodeObject:_data forKey:kBLbaseClassData];
    [aCoder encodeBool:_success forKey:kBLbaseClassSuccess];
    [aCoder encodeObject:_message forKey:kBLbaseClassMessage];
    [aCoder encodeObject:_requestId forKey:kBLbaseClassRequestId];
    [aCoder encodeDouble:_cacheTime forKey:kBLbaseClassCacheTime];
    [aCoder encodeDouble:_errorCode forKey:kBLbaseClassErrorCode];
}

- (id)copyWithZone:(NSZone *)zone
{
    BLbaseClass *copy = [[BLbaseClass alloc] init];
    
    if (copy) {

        copy.searchTime = self.searchTime;
        copy.checkTime = self.checkTime;
        copy.data = [self.data copyWithZone:zone];
        copy.success = self.success;
        copy.message = [self.message copyWithZone:zone];
        copy.requestId = [self.requestId copyWithZone:zone];
        copy.cacheTime = self.cacheTime;
        copy.errorCode = self.errorCode;
    }
    
    return copy;
}


@end
