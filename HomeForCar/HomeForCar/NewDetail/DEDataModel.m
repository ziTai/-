//
//  DEDataModel.m
//
//  Created by mac  on 16/3/10
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "DEDataModel.h"
#import "DEData.h"


NSString *const kDEDataModelSuccess = @"success";
NSString *const kDEDataModelData = @"data";
NSString *const kDEDataModelErrorCode = @"errorCode";
NSString *const kDEDataModelMessage = @"message";


@interface DEDataModel ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation DEDataModel

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
            self.success = [[self objectOrNilForKey:kDEDataModelSuccess fromDictionary:dict] boolValue];
            self.data = [DEData modelObjectWithDictionary:[dict objectForKey:kDEDataModelData]];
            self.errorCode = [[self objectOrNilForKey:kDEDataModelErrorCode fromDictionary:dict] doubleValue];
            self.message = [self objectOrNilForKey:kDEDataModelMessage fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithBool:self.success] forKey:kDEDataModelSuccess];
    [mutableDict setValue:[self.data dictionaryRepresentation] forKey:kDEDataModelData];
    [mutableDict setValue:[NSNumber numberWithDouble:self.errorCode] forKey:kDEDataModelErrorCode];
    [mutableDict setValue:self.message forKey:kDEDataModelMessage];

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

    self.success = [aDecoder decodeBoolForKey:kDEDataModelSuccess];
    self.data = [aDecoder decodeObjectForKey:kDEDataModelData];
    self.errorCode = [aDecoder decodeDoubleForKey:kDEDataModelErrorCode];
    self.message = [aDecoder decodeObjectForKey:kDEDataModelMessage];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeBool:_success forKey:kDEDataModelSuccess];
    [aCoder encodeObject:_data forKey:kDEDataModelData];
    [aCoder encodeDouble:_errorCode forKey:kDEDataModelErrorCode];
    [aCoder encodeObject:_message forKey:kDEDataModelMessage];
}

- (id)copyWithZone:(NSZone *)zone
{
    DEDataModel *copy = [[DEDataModel alloc] init];
    
    if (copy) {

        copy.success = self.success;
        copy.data = [self.data copyWithZone:zone];
        copy.errorCode = self.errorCode;
        copy.message = [self.message copyWithZone:zone];
    }
    
    return copy;
}


@end
