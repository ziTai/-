//
//  hotItemList.m
//
//  Created by mac  on 16/3/7
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "hotItemList.h"
#import "hotAuthor.h"
#import "hotImageList.h"


NSString *const khotItemListTagId = @"tagId";
NSString *const khotItemListLocation = @"location";
NSString *const khotItemListImageList = @"imageList";
NSString *const khotItemListTitle = @"title";
NSString *const khotItemListSummary = @"summary";
NSString *const khotItemListZanCount = @"zanCount";
NSString *const khotItemListClubName = @"clubName";
NSString *const khotItemListLimitId = @"limitId";
NSString *const khotItemListTopicId = @"topicId";
NSString *const khotItemListLastReplyTime = @"lastReplyTime";
NSString *const khotItemListMyself = @"myself";
NSString *const khotItemListJinghuaTime = @"jinghuaTime";
NSString *const khotItemListType = @"type";
NSString *const khotItemListZanable = @"zanable";
NSString *const khotItemListTagName = @"tagName";
NSString *const khotItemListExtraData = @"extraData";
NSString *const khotItemListClubId = @"clubId";
NSString *const khotItemListHotTime = @"hotTime";
NSString *const khotItemListCommentCount = @"commentCount";
NSString *const khotItemListTopicOperation = @"topicOperation";
NSString *const khotItemListCreateTime = @"createTime";
NSString *const khotItemListWebId = @"webId";
NSString *const khotItemListAuthor = @"author";


@interface hotItemList ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation hotItemList

@synthesize tagId = _tagId;
@synthesize location = _location;
@synthesize imageList = _imageList;
@synthesize title = _title;
@synthesize summary = _summary;
@synthesize zanCount = _zanCount;
@synthesize clubName = _clubName;
@synthesize limitId = _limitId;
@synthesize topicId = _topicId;
@synthesize lastReplyTime = _lastReplyTime;
@synthesize myself = _myself;
@synthesize jinghuaTime = _jinghuaTime;
@synthesize type = _type;
@synthesize zanable = _zanable;
@synthesize tagName = _tagName;
@synthesize extraData = _extraData;
@synthesize clubId = _clubId;
@synthesize hotTime = _hotTime;
@synthesize commentCount = _commentCount;
@synthesize topicOperation = _topicOperation;
@synthesize createTime = _createTime;
@synthesize webId = _webId;
@synthesize author = _author;


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
            self.tagId = [[self objectOrNilForKey:khotItemListTagId fromDictionary:dict] doubleValue];
            self.location = [self objectOrNilForKey:khotItemListLocation fromDictionary:dict];
        
        NSMutableArray *arr = [[NSMutableArray alloc]init];
        NSObject *obj = [self objectOrNilForKey:khotItemListImageList fromDictionary:dict];
        if ([obj isKindOfClass:[NSArray class]])
        {
            for (NSObject *dic in (NSArray*)obj)
            {
                if ([dic isKindOfClass:[NSDictionary class]]) {
                    hotImageList *imgModel = [hotImageList modelObjectWithDictionary:(NSDictionary*)dic];
                    [arr addObject:imgModel];
                }
            }
            
        }
        self.imageList = arr;
            self.title = [self objectOrNilForKey:khotItemListTitle fromDictionary:dict];
            self.summary = [self objectOrNilForKey:khotItemListSummary fromDictionary:dict];
            self.zanCount = [[self objectOrNilForKey:khotItemListZanCount fromDictionary:dict] doubleValue];
            self.clubName = [self objectOrNilForKey:khotItemListClubName fromDictionary:dict];
            self.limitId = [[self objectOrNilForKey:khotItemListLimitId fromDictionary:dict] doubleValue];
            self.topicId = [[self objectOrNilForKey:khotItemListTopicId fromDictionary:dict] doubleValue];
            self.lastReplyTime = [[self objectOrNilForKey:khotItemListLastReplyTime fromDictionary:dict] doubleValue];
            self.myself = [[self objectOrNilForKey:khotItemListMyself fromDictionary:dict] boolValue];
            self.jinghuaTime = [[self objectOrNilForKey:khotItemListJinghuaTime fromDictionary:dict] doubleValue];
            self.type = [[self objectOrNilForKey:khotItemListType fromDictionary:dict] doubleValue];
            self.zanable = [[self objectOrNilForKey:khotItemListZanable fromDictionary:dict] boolValue];
            self.tagName = [self objectOrNilForKey:khotItemListTagName fromDictionary:dict];
        
        
        
        NSMutableDictionary *dic = [[NSMutableDictionary alloc]init];
        NSObject *obj1 = [self objectOrNilForKey:khotItemListExtraData fromDictionary:dict];
        if ([obj1 isKindOfClass:[NSDictionary class]])
        {
//            for (NSObject *dic in (NSArray*)obj)
//            {
//                if ([dic isKindOfClass:[NSDictionary class]]) {
//                    hotImageList *imgModel = [hotImageList modelObjectWithDictionary:(NSDictionary*)dic];
//                    [arr addObject:imgModel];
//                }
//            }
        }
        self.extraData = dic;
            self.clubId = [[self objectOrNilForKey:khotItemListClubId fromDictionary:dict] doubleValue];
            self.hotTime = [[self objectOrNilForKey:khotItemListHotTime fromDictionary:dict] doubleValue];
            self.commentCount = [[self objectOrNilForKey:khotItemListCommentCount fromDictionary:dict] doubleValue];
            self.topicOperation = [[self objectOrNilForKey:khotItemListTopicOperation fromDictionary:dict] doubleValue];
            self.createTime = [[self objectOrNilForKey:khotItemListCreateTime fromDictionary:dict] doubleValue];
            self.webId = [self objectOrNilForKey:khotItemListWebId fromDictionary:dict];
            self.author = [hotAuthor modelObjectWithDictionary:[dict objectForKey:khotItemListAuthor]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.tagId] forKey:khotItemListTagId];
    [mutableDict setValue:self.location forKey:khotItemListLocation];
    [mutableDict setValue:self.imageList forKey:khotItemListImageList];
    [mutableDict setValue:self.title forKey:khotItemListTitle];
    [mutableDict setValue:self.summary forKey:khotItemListSummary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.zanCount] forKey:khotItemListZanCount];
    [mutableDict setValue:self.clubName forKey:khotItemListClubName];
    [mutableDict setValue:[NSNumber numberWithDouble:self.limitId] forKey:khotItemListLimitId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.topicId] forKey:khotItemListTopicId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.lastReplyTime] forKey:khotItemListLastReplyTime];
    [mutableDict setValue:[NSNumber numberWithBool:self.myself] forKey:khotItemListMyself];
    [mutableDict setValue:[NSNumber numberWithDouble:self.jinghuaTime] forKey:khotItemListJinghuaTime];
    [mutableDict setValue:[NSNumber numberWithDouble:self.type] forKey:khotItemListType];
    [mutableDict setValue:[NSNumber numberWithBool:self.zanable] forKey:khotItemListZanable];
    [mutableDict setValue:self.tagName forKey:khotItemListTagName];
    [mutableDict setValue:self.extraData forKey:khotItemListExtraData];
    [mutableDict setValue:[NSNumber numberWithDouble:self.clubId] forKey:khotItemListClubId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.hotTime] forKey:khotItemListHotTime];
    [mutableDict setValue:[NSNumber numberWithDouble:self.commentCount] forKey:khotItemListCommentCount];
    [mutableDict setValue:[NSNumber numberWithDouble:self.topicOperation] forKey:khotItemListTopicOperation];
    [mutableDict setValue:[NSNumber numberWithDouble:self.createTime] forKey:khotItemListCreateTime];
    [mutableDict setValue:self.webId forKey:khotItemListWebId];
    [mutableDict setValue:[self.author dictionaryRepresentation] forKey:khotItemListAuthor];

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

    self.tagId = [aDecoder decodeDoubleForKey:khotItemListTagId];
    self.location = [aDecoder decodeObjectForKey:khotItemListLocation];
    self.imageList = [aDecoder decodeObjectForKey:khotItemListImageList];
    self.title = [aDecoder decodeObjectForKey:khotItemListTitle];
    self.summary = [aDecoder decodeObjectForKey:khotItemListSummary];
    self.zanCount = [aDecoder decodeDoubleForKey:khotItemListZanCount];
    self.clubName = [aDecoder decodeObjectForKey:khotItemListClubName];
    self.limitId = [aDecoder decodeDoubleForKey:khotItemListLimitId];
    self.topicId = [aDecoder decodeDoubleForKey:khotItemListTopicId];
    self.lastReplyTime = [aDecoder decodeDoubleForKey:khotItemListLastReplyTime];
    self.myself = [aDecoder decodeBoolForKey:khotItemListMyself];
    self.jinghuaTime = [aDecoder decodeDoubleForKey:khotItemListJinghuaTime];
    self.type = [aDecoder decodeDoubleForKey:khotItemListType];
    self.zanable = [aDecoder decodeBoolForKey:khotItemListZanable];
    self.tagName = [aDecoder decodeObjectForKey:khotItemListTagName];
    self.extraData = [aDecoder decodeObjectForKey:khotItemListExtraData];
    self.clubId = [aDecoder decodeDoubleForKey:khotItemListClubId];
    self.hotTime = [aDecoder decodeDoubleForKey:khotItemListHotTime];
    self.commentCount = [aDecoder decodeDoubleForKey:khotItemListCommentCount];
    self.topicOperation = [aDecoder decodeDoubleForKey:khotItemListTopicOperation];
    self.createTime = [aDecoder decodeDoubleForKey:khotItemListCreateTime];
    self.webId = [aDecoder decodeObjectForKey:khotItemListWebId];
    self.author = [aDecoder decodeObjectForKey:khotItemListAuthor];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_tagId forKey:khotItemListTagId];
    [aCoder encodeObject:_location forKey:khotItemListLocation];
    [aCoder encodeObject:_imageList forKey:khotItemListImageList];
    [aCoder encodeObject:_title forKey:khotItemListTitle];
    [aCoder encodeObject:_summary forKey:khotItemListSummary];
    [aCoder encodeDouble:_zanCount forKey:khotItemListZanCount];
    [aCoder encodeObject:_clubName forKey:khotItemListClubName];
    [aCoder encodeDouble:_limitId forKey:khotItemListLimitId];
    [aCoder encodeDouble:_topicId forKey:khotItemListTopicId];
    [aCoder encodeDouble:_lastReplyTime forKey:khotItemListLastReplyTime];
    [aCoder encodeBool:_myself forKey:khotItemListMyself];
    [aCoder encodeDouble:_jinghuaTime forKey:khotItemListJinghuaTime];
    [aCoder encodeDouble:_type forKey:khotItemListType];
    [aCoder encodeBool:_zanable forKey:khotItemListZanable];
    [aCoder encodeObject:_tagName forKey:khotItemListTagName];
    [aCoder encodeObject:_extraData forKey:khotItemListExtraData];
    [aCoder encodeDouble:_clubId forKey:khotItemListClubId];
    [aCoder encodeDouble:_hotTime forKey:khotItemListHotTime];
    [aCoder encodeDouble:_commentCount forKey:khotItemListCommentCount];
    [aCoder encodeDouble:_topicOperation forKey:khotItemListTopicOperation];
    [aCoder encodeDouble:_createTime forKey:khotItemListCreateTime];
    [aCoder encodeObject:_webId forKey:khotItemListWebId];
    [aCoder encodeObject:_author forKey:khotItemListAuthor];
}

- (id)copyWithZone:(NSZone *)zone
{
    hotItemList *copy = [[hotItemList alloc] init];
    
    if (copy) {

        copy.tagId = self.tagId;
        copy.location = [self.location copyWithZone:zone];
        copy.imageList = [self.imageList copyWithZone:zone];
        copy.title = [self.title copyWithZone:zone];
        copy.summary = [self.summary copyWithZone:zone];
        copy.zanCount = self.zanCount;
        copy.clubName = [self.clubName copyWithZone:zone];
        copy.limitId = self.limitId;
        copy.topicId = self.topicId;
        copy.lastReplyTime = self.lastReplyTime;
        copy.myself = self.myself;
        copy.jinghuaTime = self.jinghuaTime;
        copy.type = self.type;
        copy.zanable = self.zanable;
        copy.tagName = [self.tagName copyWithZone:zone];
        copy.extraData = [self.extraData copyWithZone:zone];
        copy.clubId = self.clubId;
        copy.hotTime = self.hotTime;
        copy.commentCount = self.commentCount;
        copy.topicOperation = self.topicOperation;
        copy.createTime = self.createTime;
        copy.webId = [self.webId copyWithZone:zone];
        copy.author = [self.author copyWithZone:zone];
    }
    
    return copy;
}


@end
