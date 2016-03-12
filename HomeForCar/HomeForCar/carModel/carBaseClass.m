//
//  carBaseClass.m
//
//  Created by mac  on 16/3/8
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "carBaseClass.h"
#import "carData.h"


NSString *const kcarBaseClassSearchTime = @"searchTime";
NSString *const kcarBaseClassCheckTime = @"checkTime";
NSString *const kcarBaseClassData = @"data";
NSString *const kcarBaseClassSuccess = @"success";
NSString *const kcarBaseClassMessage = @"message";
NSString *const kcarBaseClassRequestId = @"requestId";
NSString *const kcarBaseClassCacheTime = @"cacheTime";
NSString *const kcarBaseClassErrorCode = @"errorCode";


@interface carBaseClass ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation carBaseClass

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
            self.searchTime = [[self objectOrNilForKey:kcarBaseClassSearchTime fromDictionary:dict] doubleValue];
            self.checkTime = [[self objectOrNilForKey:kcarBaseClassCheckTime fromDictionary:dict] doubleValue];
    NSObject *receivedcarData = [dict objectForKey:kcarBaseClassData];
    NSMutableArray *parsedcarData = [NSMutableArray array];
    if ([receivedcarData isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedcarData) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedcarData addObject:[carData modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedcarData isKindOfClass:[NSDictionary class]]) {
       [parsedcarData addObject:[carData modelObjectWithDictionary:(NSDictionary *)receivedcarData]];
    }

    self.data = [NSArray arrayWithArray:parsedcarData];
            self.success = [[self objectOrNilForKey:kcarBaseClassSuccess fromDictionary:dict] boolValue];
            self.message = [self objectOrNilForKey:kcarBaseClassMessage fromDictionary:dict];
            self.requestId = [self objectOrNilForKey:kcarBaseClassRequestId fromDictionary:dict];
            self.cacheTime = [[self objectOrNilForKey:kcarBaseClassCacheTime fromDictionary:dict] doubleValue];
            self.errorCode = [[self objectOrNilForKey:kcarBaseClassErrorCode fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.searchTime] forKey:kcarBaseClassSearchTime];
    [mutableDict setValue:[NSNumber numberWithDouble:self.checkTime] forKey:kcarBaseClassCheckTime];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForData] forKey:kcarBaseClassData];
    [mutableDict setValue:[NSNumber numberWithBool:self.success] forKey:kcarBaseClassSuccess];
    [mutableDict setValue:self.message forKey:kcarBaseClassMessage];
    [mutableDict setValue:self.requestId forKey:kcarBaseClassRequestId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.cacheTime] forKey:kcarBaseClassCacheTime];
    [mutableDict setValue:[NSNumber numberWithDouble:self.errorCode] forKey:kcarBaseClassErrorCode];

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

    self.searchTime = [aDecoder decodeDoubleForKey:kcarBaseClassSearchTime];
    self.checkTime = [aDecoder decodeDoubleForKey:kcarBaseClassCheckTime];
    self.data = [aDecoder decodeObjectForKey:kcarBaseClassData];
    self.success = [aDecoder decodeBoolForKey:kcarBaseClassSuccess];
    self.message = [aDecoder decodeObjectForKey:kcarBaseClassMessage];
    self.requestId = [aDecoder decodeObjectForKey:kcarBaseClassRequestId];
    self.cacheTime = [aDecoder decodeDoubleForKey:kcarBaseClassCacheTime];
    self.errorCode = [aDecoder decodeDoubleForKey:kcarBaseClassErrorCode];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_searchTime forKey:kcarBaseClassSearchTime];
    [aCoder encodeDouble:_checkTime forKey:kcarBaseClassCheckTime];
    [aCoder encodeObject:_data forKey:kcarBaseClassData];
    [aCoder encodeBool:_success forKey:kcarBaseClassSuccess];
    [aCoder encodeObject:_message forKey:kcarBaseClassMessage];
    [aCoder encodeObject:_requestId forKey:kcarBaseClassRequestId];
    [aCoder encodeDouble:_cacheTime forKey:kcarBaseClassCacheTime];
    [aCoder encodeDouble:_errorCode forKey:kcarBaseClassErrorCode];
}

- (id)copyWithZone:(NSZone *)zone
{
    carBaseClass *copy = [[carBaseClass alloc] init];
    
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
