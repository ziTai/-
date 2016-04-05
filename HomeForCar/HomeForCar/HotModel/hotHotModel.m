//
//  hotHotModel.m
//
//  Created by mac  on 16/3/7
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "hotHotModel.h"
#import "hotData.h"


NSString *const khotHotModelSuccess = @"success";
NSString *const khotHotModelData = @"data";
NSString *const khotHotModelErrorCode = @"errorCode";
NSString *const khotHotModelMessage = @"message";


@interface hotHotModel ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation hotHotModel

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
            self.success = [[self objectOrNilForKey:khotHotModelSuccess fromDictionary:dict] boolValue];
            self.data = [hotData modelObjectWithDictionary:[dict objectForKey:khotHotModelData]];
            self.errorCode = [[self objectOrNilForKey:khotHotModelErrorCode fromDictionary:dict] doubleValue];
            self.message = [self objectOrNilForKey:khotHotModelMessage fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithBool:self.success] forKey:khotHotModelSuccess];
    [mutableDict setValue:[self.data dictionaryRepresentation] forKey:khotHotModelData];
    [mutableDict setValue:[NSNumber numberWithDouble:self.errorCode] forKey:khotHotModelErrorCode];
    [mutableDict setValue:self.message forKey:khotHotModelMessage];

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

    self.success = [aDecoder decodeBoolForKey:khotHotModelSuccess];
    self.data = [aDecoder decodeObjectForKey:khotHotModelData];
    self.errorCode = [aDecoder decodeDoubleForKey:khotHotModelErrorCode];
    self.message = [aDecoder decodeObjectForKey:khotHotModelMessage];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeBool:_success forKey:khotHotModelSuccess];
    [aCoder encodeObject:_data forKey:khotHotModelData];
    [aCoder encodeDouble:_errorCode forKey:khotHotModelErrorCode];
    [aCoder encodeObject:_message forKey:khotHotModelMessage];
}

- (id)copyWithZone:(NSZone *)zone
{
    hotHotModel *copy = [[hotHotModel alloc] init];
    
    if (copy) {

        copy.success = self.success;
        copy.data = [self.data copyWithZone:zone];
        copy.errorCode = self.errorCode;
        copy.message = [self.message copyWithZone:zone];
    }
    
    return copy;
}


@end
