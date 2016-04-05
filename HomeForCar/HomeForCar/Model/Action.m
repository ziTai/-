//
//  Action.m
//
//  Created by mac  on 16/3/4
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "Action.h"


NSString *const kActionContent = @"content";
NSString *const kActionInnerDataType = @"innerDataType";
NSString *const kActionLabelType = @"labelType";
NSString *const kActionType = @"type";


@interface Action ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation Action

@synthesize content = _content;
@synthesize innerDataType = _innerDataType;
@synthesize labelType = _labelType;
@synthesize type = _type;


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
            self.content = [self objectOrNilForKey:kActionContent fromDictionary:dict];
            self.innerDataType = [[self objectOrNilForKey:kActionInnerDataType fromDictionary:dict] doubleValue];
            self.labelType = [[self objectOrNilForKey:kActionLabelType fromDictionary:dict] doubleValue];
            self.type = [[self objectOrNilForKey:kActionType fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.content forKey:kActionContent];
    [mutableDict setValue:[NSNumber numberWithDouble:self.innerDataType] forKey:kActionInnerDataType];
    [mutableDict setValue:[NSNumber numberWithDouble:self.labelType] forKey:kActionLabelType];
    [mutableDict setValue:[NSNumber numberWithDouble:self.type] forKey:kActionType];

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

    self.content = [aDecoder decodeObjectForKey:kActionContent];
    self.innerDataType = [aDecoder decodeDoubleForKey:kActionInnerDataType];
    self.labelType = [aDecoder decodeDoubleForKey:kActionLabelType];
    self.type = [aDecoder decodeDoubleForKey:kActionType];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_content forKey:kActionContent];
    [aCoder encodeDouble:_innerDataType forKey:kActionInnerDataType];
    [aCoder encodeDouble:_labelType forKey:kActionLabelType];
    [aCoder encodeDouble:_type forKey:kActionType];
}

- (id)copyWithZone:(NSZone *)zone
{
    Action *copy = [[Action alloc] init];
    
    if (copy) {

        copy.content = [self.content copyWithZone:zone];
        copy.innerDataType = self.innerDataType;
        copy.labelType = self.labelType;
        copy.type = self.type;
    }
    
    return copy;
}


@end
