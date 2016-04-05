//
//  CObaseClass.m
//
//  Created by mac  on 16/3/11
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "CObaseClass.h"
#import "COData.h"


NSString *const kCObaseClassSearchTime = @"searchTime";
NSString *const kCObaseClassCheckTime = @"checkTime";
NSString *const kCObaseClassData = @"data";
NSString *const kCObaseClassSuccess = @"success";
NSString *const kCObaseClassMessage = @"message";
NSString *const kCObaseClassRequestId = @"requestId";
NSString *const kCObaseClassCacheTime = @"cacheTime";
NSString *const kCObaseClassErrorCode = @"errorCode";


@interface CObaseClass ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation CObaseClass

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
            self.searchTime = [[self objectOrNilForKey:kCObaseClassSearchTime fromDictionary:dict] doubleValue];
            self.checkTime = [[self objectOrNilForKey:kCObaseClassCheckTime fromDictionary:dict] doubleValue];
    NSObject *receivedCOData = [dict objectForKey:kCObaseClassData];
    NSMutableArray *parsedCOData = [NSMutableArray array];
    if ([receivedCOData isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedCOData) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedCOData addObject:[COData modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedCOData isKindOfClass:[NSDictionary class]]) {
       [parsedCOData addObject:[COData modelObjectWithDictionary:(NSDictionary *)receivedCOData]];
    }

    self.data = [NSArray arrayWithArray:parsedCOData];
            self.success = [[self objectOrNilForKey:kCObaseClassSuccess fromDictionary:dict] boolValue];
            self.message = [self objectOrNilForKey:kCObaseClassMessage fromDictionary:dict];
            self.requestId = [self objectOrNilForKey:kCObaseClassRequestId fromDictionary:dict];
            self.cacheTime = [[self objectOrNilForKey:kCObaseClassCacheTime fromDictionary:dict] doubleValue];
            self.errorCode = [[self objectOrNilForKey:kCObaseClassErrorCode fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.searchTime] forKey:kCObaseClassSearchTime];
    [mutableDict setValue:[NSNumber numberWithDouble:self.checkTime] forKey:kCObaseClassCheckTime];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForData] forKey:kCObaseClassData];
    [mutableDict setValue:[NSNumber numberWithBool:self.success] forKey:kCObaseClassSuccess];
    [mutableDict setValue:self.message forKey:kCObaseClassMessage];
    [mutableDict setValue:self.requestId forKey:kCObaseClassRequestId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.cacheTime] forKey:kCObaseClassCacheTime];
    [mutableDict setValue:[NSNumber numberWithDouble:self.errorCode] forKey:kCObaseClassErrorCode];

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

    self.searchTime = [aDecoder decodeDoubleForKey:kCObaseClassSearchTime];
    self.checkTime = [aDecoder decodeDoubleForKey:kCObaseClassCheckTime];
    self.data = [aDecoder decodeObjectForKey:kCObaseClassData];
    self.success = [aDecoder decodeBoolForKey:kCObaseClassSuccess];
    self.message = [aDecoder decodeObjectForKey:kCObaseClassMessage];
    self.requestId = [aDecoder decodeObjectForKey:kCObaseClassRequestId];
    self.cacheTime = [aDecoder decodeDoubleForKey:kCObaseClassCacheTime];
    self.errorCode = [aDecoder decodeDoubleForKey:kCObaseClassErrorCode];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_searchTime forKey:kCObaseClassSearchTime];
    [aCoder encodeDouble:_checkTime forKey:kCObaseClassCheckTime];
    [aCoder encodeObject:_data forKey:kCObaseClassData];
    [aCoder encodeBool:_success forKey:kCObaseClassSuccess];
    [aCoder encodeObject:_message forKey:kCObaseClassMessage];
    [aCoder encodeObject:_requestId forKey:kCObaseClassRequestId];
    [aCoder encodeDouble:_cacheTime forKey:kCObaseClassCacheTime];
    [aCoder encodeDouble:_errorCode forKey:kCObaseClassErrorCode];
}

- (id)copyWithZone:(NSZone *)zone
{
    CObaseClass *copy = [[CObaseClass alloc] init];
    
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
