//
//  BaseClass.m
//
//  Created by mac  on 16/3/4
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "BaseClass.h"
#import "Data.h"


NSString *const kBaseClassSuccess = @"success";
NSString *const kBaseClassData = @"data";
NSString *const kBaseClassErrorCode = @"errorCode";
NSString *const kBaseClassMessage = @"message";


@interface BaseClass ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation BaseClass

@synthesize success = _success;
@synthesize data = _data;
@synthesize errorCode = _errorCode;
@synthesize message = _message;


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
            self.success = [[self objectOrNilForKey:kBaseClassSuccess fromDictionary:dict] boolValue];
            self.data = [Data modelObjectWithDictionary:[dict objectForKey:kBaseClassData]];
            self.errorCode = [[self objectOrNilForKey:kBaseClassErrorCode fromDictionary:dict] doubleValue];
            self.message = [self objectOrNilForKey:kBaseClassMessage fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithBool:self.success] forKey:kBaseClassSuccess];
    [mutableDict setValue:[self.data dictionaryRepresentation] forKey:kBaseClassData];
    [mutableDict setValue:[NSNumber numberWithDouble:self.errorCode] forKey:kBaseClassErrorCode];
    [mutableDict setValue:self.message forKey:kBaseClassMessage];

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

    self.success = [aDecoder decodeBoolForKey:kBaseClassSuccess];
    self.data = [aDecoder decodeObjectForKey:kBaseClassData];
    self.errorCode = [aDecoder decodeDoubleForKey:kBaseClassErrorCode];
    self.message = [aDecoder decodeObjectForKey:kBaseClassMessage];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeBool:_success forKey:kBaseClassSuccess];
    [aCoder encodeObject:_data forKey:kBaseClassData];
    [aCoder encodeDouble:_errorCode forKey:kBaseClassErrorCode];
    [aCoder encodeObject:_message forKey:kBaseClassMessage];
}

- (id)copyWithZone:(NSZone *)zone
{
    BaseClass *copy = [[BaseClass alloc] init];
    
    if (copy) {

        copy.success = self.success;
        copy.data = [self.data copyWithZone:zone];
        copy.errorCode = self.errorCode;
        copy.message = [self.message copyWithZone:zone];
    }
    
    return copy;
}


@end
