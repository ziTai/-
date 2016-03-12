//
//  hotAuthor.m
//
//  Created by mac  on 16/3/7
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "hotAuthor.h"


NSString *const khotAuthorManager = @"manager";
NSString *const khotAuthorIdentity = @"identity";
NSString *const khotAuthorInternal = @"internal";
NSString *const khotAuthorName = @"name";
NSString *const khotAuthorUserId = @"userId";
NSString *const khotAuthorAvatar = @"avatar";


@interface hotAuthor ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation hotAuthor

@synthesize manager = _manager;
@synthesize identity = _identity;
@synthesize internal = _internal;
@synthesize name = _name;
@synthesize userId = _userId;
@synthesize avatar = _avatar;


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
            self.manager = [[self objectOrNilForKey:khotAuthorManager fromDictionary:dict] boolValue];
            self.identity = [[self objectOrNilForKey:khotAuthorIdentity fromDictionary:dict] doubleValue];
            self.internal = [[self objectOrNilForKey:khotAuthorInternal fromDictionary:dict] boolValue];
            self.name = [self objectOrNilForKey:khotAuthorName fromDictionary:dict];
            self.userId = [self objectOrNilForKey:khotAuthorUserId fromDictionary:dict];
            self.avatar = [self objectOrNilForKey:khotAuthorAvatar fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithBool:self.manager] forKey:khotAuthorManager];
    [mutableDict setValue:[NSNumber numberWithDouble:self.identity] forKey:khotAuthorIdentity];
    [mutableDict setValue:[NSNumber numberWithBool:self.internal] forKey:khotAuthorInternal];
    [mutableDict setValue:self.name forKey:khotAuthorName];
    [mutableDict setValue:self.userId forKey:khotAuthorUserId];
    [mutableDict setValue:self.avatar forKey:khotAuthorAvatar];

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

    self.manager = [aDecoder decodeBoolForKey:khotAuthorManager];
    self.identity = [aDecoder decodeDoubleForKey:khotAuthorIdentity];
    self.internal = [aDecoder decodeBoolForKey:khotAuthorInternal];
    self.name = [aDecoder decodeObjectForKey:khotAuthorName];
    self.userId = [aDecoder decodeObjectForKey:khotAuthorUserId];
    self.avatar = [aDecoder decodeObjectForKey:khotAuthorAvatar];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeBool:_manager forKey:khotAuthorManager];
    [aCoder encodeDouble:_identity forKey:khotAuthorIdentity];
    [aCoder encodeBool:_internal forKey:khotAuthorInternal];
    [aCoder encodeObject:_name forKey:khotAuthorName];
    [aCoder encodeObject:_userId forKey:khotAuthorUserId];
    [aCoder encodeObject:_avatar forKey:khotAuthorAvatar];
}

- (id)copyWithZone:(NSZone *)zone
{
    hotAuthor *copy = [[hotAuthor alloc] init];
    
    if (copy) {

        copy.manager = self.manager;
        copy.identity = self.identity;
        copy.internal = self.internal;
        copy.name = [self.name copyWithZone:zone];
        copy.userId = [self.userId copyWithZone:zone];
        copy.avatar = [self.avatar copyWithZone:zone];
    }
    
    return copy;
}


@end
