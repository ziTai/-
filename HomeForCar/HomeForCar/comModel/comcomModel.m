//
//  comcomModel.m
//
//  Created by mac  on 16/3/8
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "comcomModel.h"
#import "comData.h"


NSString *const kcomcomModelSuccess = @"success";
NSString *const kcomcomModelData = @"data";
NSString *const kcomcomModelErrorCode = @"errorCode";
NSString *const kcomcomModelMessage = @"message";


@interface comcomModel ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation comcomModel

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
            self.success = [[self objectOrNilForKey:kcomcomModelSuccess fromDictionary:dict] boolValue];
            self.data = [comData modelObjectWithDictionary:[dict objectForKey:kcomcomModelData]];
            self.errorCode = [[self objectOrNilForKey:kcomcomModelErrorCode fromDictionary:dict] doubleValue];
            self.message = [self objectOrNilForKey:kcomcomModelMessage fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithBool:self.success] forKey:kcomcomModelSuccess];
    [mutableDict setValue:[self.data dictionaryRepresentation] forKey:kcomcomModelData];
    [mutableDict setValue:[NSNumber numberWithDouble:self.errorCode] forKey:kcomcomModelErrorCode];
    [mutableDict setValue:self.message forKey:kcomcomModelMessage];

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

    self.success = [aDecoder decodeBoolForKey:kcomcomModelSuccess];
    self.data = [aDecoder decodeObjectForKey:kcomcomModelData];
    self.errorCode = [aDecoder decodeDoubleForKey:kcomcomModelErrorCode];
    self.message = [aDecoder decodeObjectForKey:kcomcomModelMessage];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeBool:_success forKey:kcomcomModelSuccess];
    [aCoder encodeObject:_data forKey:kcomcomModelData];
    [aCoder encodeDouble:_errorCode forKey:kcomcomModelErrorCode];
    [aCoder encodeObject:_message forKey:kcomcomModelMessage];
}

- (id)copyWithZone:(NSZone *)zone
{
    comcomModel *copy = [[comcomModel alloc] init];
    
    if (copy) {

        copy.success = self.success;
        copy.data = [self.data copyWithZone:zone];
        copy.errorCode = self.errorCode;
        copy.message = [self.message copyWithZone:zone];
    }
    
    return copy;
}


@end
