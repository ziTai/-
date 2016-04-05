//
//  comItemList.m
//
//  Created by mac  on 16/3/8
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "comItemList.h"


NSString *const kcomItemListStatus = @"status";
NSString *const kcomItemListClubId = @"clubId";
NSString *const kcomItemListTopicCount = @"topicCount";
NSString *const kcomItemListLogoUrl = @"logoUrl";
NSString *const kcomItemListMemberCount = @"memberCount";
NSString *const kcomItemListLastPostTime = @"lastPostTime";
NSString *const kcomItemListJoinable = @"joinable";
NSString *const kcomItemListTodayTopicCount = @"todayTopicCount";
NSString *const kcomItemListDesc = @"desc";
NSString *const kcomItemListName = @"name";


@interface comItemList ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation comItemList

@synthesize status = _status;
@synthesize clubId = _clubId;
@synthesize topicCount = _topicCount;
@synthesize logoUrl = _logoUrl;
@synthesize memberCount = _memberCount;
@synthesize lastPostTime = _lastPostTime;
@synthesize joinable = _joinable;
@synthesize todayTopicCount = _todayTopicCount;
@synthesize desc = _desc;
@synthesize name = _name;


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
            self.status = [[self objectOrNilForKey:kcomItemListStatus fromDictionary:dict] doubleValue];
            self.clubId = [[self objectOrNilForKey:kcomItemListClubId fromDictionary:dict] doubleValue];
            self.topicCount = [[self objectOrNilForKey:kcomItemListTopicCount fromDictionary:dict] doubleValue];
            self.logoUrl = [self objectOrNilForKey:kcomItemListLogoUrl fromDictionary:dict];
            self.memberCount = [[self objectOrNilForKey:kcomItemListMemberCount fromDictionary:dict] doubleValue];
            self.lastPostTime = [[self objectOrNilForKey:kcomItemListLastPostTime fromDictionary:dict] doubleValue];
            self.joinable = [[self objectOrNilForKey:kcomItemListJoinable fromDictionary:dict] boolValue];
            self.todayTopicCount = [[self objectOrNilForKey:kcomItemListTodayTopicCount fromDictionary:dict] doubleValue];
            self.desc = [self objectOrNilForKey:kcomItemListDesc fromDictionary:dict];
            self.name = [self objectOrNilForKey:kcomItemListName fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.status] forKey:kcomItemListStatus];
    [mutableDict setValue:[NSNumber numberWithDouble:self.clubId] forKey:kcomItemListClubId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.topicCount] forKey:kcomItemListTopicCount];
    [mutableDict setValue:self.logoUrl forKey:kcomItemListLogoUrl];
    [mutableDict setValue:[NSNumber numberWithDouble:self.memberCount] forKey:kcomItemListMemberCount];
    [mutableDict setValue:[NSNumber numberWithDouble:self.lastPostTime] forKey:kcomItemListLastPostTime];
    [mutableDict setValue:[NSNumber numberWithBool:self.joinable] forKey:kcomItemListJoinable];
    [mutableDict setValue:[NSNumber numberWithDouble:self.todayTopicCount] forKey:kcomItemListTodayTopicCount];
    [mutableDict setValue:self.desc forKey:kcomItemListDesc];
    [mutableDict setValue:self.name forKey:kcomItemListName];

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

    self.status = [aDecoder decodeDoubleForKey:kcomItemListStatus];
    self.clubId = [aDecoder decodeDoubleForKey:kcomItemListClubId];
    self.topicCount = [aDecoder decodeDoubleForKey:kcomItemListTopicCount];
    self.logoUrl = [aDecoder decodeObjectForKey:kcomItemListLogoUrl];
    self.memberCount = [aDecoder decodeDoubleForKey:kcomItemListMemberCount];
    self.lastPostTime = [aDecoder decodeDoubleForKey:kcomItemListLastPostTime];
    self.joinable = [aDecoder decodeBoolForKey:kcomItemListJoinable];
    self.todayTopicCount = [aDecoder decodeDoubleForKey:kcomItemListTodayTopicCount];
    self.desc = [aDecoder decodeObjectForKey:kcomItemListDesc];
    self.name = [aDecoder decodeObjectForKey:kcomItemListName];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_status forKey:kcomItemListStatus];
    [aCoder encodeDouble:_clubId forKey:kcomItemListClubId];
    [aCoder encodeDouble:_topicCount forKey:kcomItemListTopicCount];
    [aCoder encodeObject:_logoUrl forKey:kcomItemListLogoUrl];
    [aCoder encodeDouble:_memberCount forKey:kcomItemListMemberCount];
    [aCoder encodeDouble:_lastPostTime forKey:kcomItemListLastPostTime];
    [aCoder encodeBool:_joinable forKey:kcomItemListJoinable];
    [aCoder encodeDouble:_todayTopicCount forKey:kcomItemListTodayTopicCount];
    [aCoder encodeObject:_desc forKey:kcomItemListDesc];
    [aCoder encodeObject:_name forKey:kcomItemListName];
}

- (id)copyWithZone:(NSZone *)zone
{
    comItemList *copy = [[comItemList alloc] init];
    
    if (copy) {

        copy.status = self.status;
        copy.clubId = self.clubId;
        copy.topicCount = self.topicCount;
        copy.logoUrl = [self.logoUrl copyWithZone:zone];
        copy.memberCount = self.memberCount;
        copy.lastPostTime = self.lastPostTime;
        copy.joinable = self.joinable;
        copy.todayTopicCount = self.todayTopicCount;
        copy.desc = [self.desc copyWithZone:zone];
        copy.name = [self.name copyWithZone:zone];
    }
    
    return copy;
}


@end
