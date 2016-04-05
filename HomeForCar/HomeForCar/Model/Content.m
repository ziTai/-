//
//  Content.m
//
//  Created by mac  on 16/3/4
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "Content.h"


NSString *const kContentProfileDisplayType = @"profileDisplayType";
NSString *const kContentRecommendHot = @"recommendHot";
NSString *const kContentCached = @"cached";
NSString *const kContentHeatDegree = @"heatDegree";
NSString *const kContentHitCount = @"hitCount";
NSString *const kContentAuthor = @"author";
NSString *const kContentTags = @"tags";
NSString *const kContentSource = @"source";
NSString *const kContentTitle = @"title";
NSString *const kContentCommentCount = @"commentCount";
NSString *const kContentDisplayType = @"displayType";
NSString *const kContentDownCount = @"downCount";
NSString *const kContentPublishTime = @"publishTime";
NSString *const kContentThumbnails = @"thumbnails";
NSString *const kContentUpCount = @"upCount";


@interface Content ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation Content

@synthesize profileDisplayType = _profileDisplayType;
@synthesize recommendHot = _recommendHot;
@synthesize cached = _cached;
@synthesize heatDegree = _heatDegree;
@synthesize hitCount = _hitCount;
@synthesize author = _author;
@synthesize tags = _tags;
@synthesize source = _source;
@synthesize title = _title;
@synthesize commentCount = _commentCount;
@synthesize displayType = _displayType;
@synthesize downCount = _downCount;
@synthesize publishTime = _publishTime;
@synthesize thumbnails = _thumbnails;
@synthesize upCount = _upCount;


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
            self.profileDisplayType = [[self objectOrNilForKey:kContentProfileDisplayType fromDictionary:dict] doubleValue];
            self.recommendHot = [[self objectOrNilForKey:kContentRecommendHot fromDictionary:dict] doubleValue];
            self.cached = [[self objectOrNilForKey:kContentCached fromDictionary:dict] boolValue];
            self.heatDegree = [[self objectOrNilForKey:kContentHeatDegree fromDictionary:dict] doubleValue];
            self.hitCount = [[self objectOrNilForKey:kContentHitCount fromDictionary:dict] doubleValue];
            self.author = [self objectOrNilForKey:kContentAuthor fromDictionary:dict];
            self.tags = [self objectOrNilForKey:kContentTags fromDictionary:dict];
            self.source = [self objectOrNilForKey:kContentSource fromDictionary:dict];
            self.title = [self objectOrNilForKey:kContentTitle fromDictionary:dict];
            self.commentCount = [[self objectOrNilForKey:kContentCommentCount fromDictionary:dict] doubleValue];
            self.displayType = [[self objectOrNilForKey:kContentDisplayType fromDictionary:dict] doubleValue];
            self.downCount = [[self objectOrNilForKey:kContentDownCount fromDictionary:dict] doubleValue];
            self.publishTime = [[self objectOrNilForKey:kContentPublishTime fromDictionary:dict] doubleValue];
            self.thumbnails = [self objectOrNilForKey:kContentThumbnails fromDictionary:dict];
            self.upCount = [[self objectOrNilForKey:kContentUpCount fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.profileDisplayType] forKey:kContentProfileDisplayType];
    [mutableDict setValue:[NSNumber numberWithDouble:self.recommendHot] forKey:kContentRecommendHot];
    [mutableDict setValue:[NSNumber numberWithBool:self.cached] forKey:kContentCached];
    [mutableDict setValue:[NSNumber numberWithDouble:self.heatDegree] forKey:kContentHeatDegree];
    [mutableDict setValue:[NSNumber numberWithDouble:self.hitCount] forKey:kContentHitCount];
    [mutableDict setValue:self.author forKey:kContentAuthor];
    [mutableDict setValue:self.tags forKey:kContentTags];
    [mutableDict setValue:self.source forKey:kContentSource];
    [mutableDict setValue:self.title forKey:kContentTitle];
    [mutableDict setValue:[NSNumber numberWithDouble:self.commentCount] forKey:kContentCommentCount];
    [mutableDict setValue:[NSNumber numberWithDouble:self.displayType] forKey:kContentDisplayType];
    [mutableDict setValue:[NSNumber numberWithDouble:self.downCount] forKey:kContentDownCount];
    [mutableDict setValue:[NSNumber numberWithDouble:self.publishTime] forKey:kContentPublishTime];
    NSMutableArray *tempArrayForThumbnails = [NSMutableArray array];
    for (NSObject *subArrayObject in self.thumbnails) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForThumbnails addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForThumbnails addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForThumbnails] forKey:kContentThumbnails];
    [mutableDict setValue:[NSNumber numberWithDouble:self.upCount] forKey:kContentUpCount];

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

    self.profileDisplayType = [aDecoder decodeDoubleForKey:kContentProfileDisplayType];
    self.recommendHot = [aDecoder decodeDoubleForKey:kContentRecommendHot];
    self.cached = [aDecoder decodeBoolForKey:kContentCached];
    self.heatDegree = [aDecoder decodeDoubleForKey:kContentHeatDegree];
    self.hitCount = [aDecoder decodeDoubleForKey:kContentHitCount];
    self.author = [aDecoder decodeObjectForKey:kContentAuthor];
    self.tags = [aDecoder decodeObjectForKey:kContentTags];
    self.source = [aDecoder decodeObjectForKey:kContentSource];
    self.title = [aDecoder decodeObjectForKey:kContentTitle];
    self.commentCount = [aDecoder decodeDoubleForKey:kContentCommentCount];
    self.displayType = [aDecoder decodeDoubleForKey:kContentDisplayType];
    self.downCount = [aDecoder decodeDoubleForKey:kContentDownCount];
    self.publishTime = [aDecoder decodeDoubleForKey:kContentPublishTime];
    self.thumbnails = [aDecoder decodeObjectForKey:kContentThumbnails];
    self.upCount = [aDecoder decodeDoubleForKey:kContentUpCount];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_profileDisplayType forKey:kContentProfileDisplayType];
    [aCoder encodeDouble:_recommendHot forKey:kContentRecommendHot];
    [aCoder encodeBool:_cached forKey:kContentCached];
    [aCoder encodeDouble:_heatDegree forKey:kContentHeatDegree];
    [aCoder encodeDouble:_hitCount forKey:kContentHitCount];
    [aCoder encodeObject:_author forKey:kContentAuthor];
    [aCoder encodeObject:_tags forKey:kContentTags];
    [aCoder encodeObject:_source forKey:kContentSource];
    [aCoder encodeObject:_title forKey:kContentTitle];
    [aCoder encodeDouble:_commentCount forKey:kContentCommentCount];
    [aCoder encodeDouble:_displayType forKey:kContentDisplayType];
    [aCoder encodeDouble:_downCount forKey:kContentDownCount];
    [aCoder encodeDouble:_publishTime forKey:kContentPublishTime];
    [aCoder encodeObject:_thumbnails forKey:kContentThumbnails];
    [aCoder encodeDouble:_upCount forKey:kContentUpCount];
}

- (id)copyWithZone:(NSZone *)zone
{
    Content *copy = [[Content alloc] init];
    
    if (copy) {

        copy.profileDisplayType = self.profileDisplayType;
        copy.recommendHot = self.recommendHot;
        copy.cached = self.cached;
        copy.heatDegree = self.heatDegree;
        copy.hitCount = self.hitCount;
        copy.author = [self.author copyWithZone:zone];
        copy.tags = [self.tags copyWithZone:zone];
        copy.source = [self.source copyWithZone:zone];
        copy.title = [self.title copyWithZone:zone];
        copy.commentCount = self.commentCount;
        copy.displayType = self.displayType;
        copy.downCount = self.downCount;
        copy.publishTime = self.publishTime;
        copy.thumbnails = [self.thumbnails copyWithZone:zone];
        copy.upCount = self.upCount;
    }
    
    return copy;
}


@end
