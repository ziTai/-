//
//  DEData.m
//
//  Created by mac  on 16/3/10
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "DEData.h"
#import "DECarSerials.h"


NSString *const kDEDataCarSerials = @"carSerials";
NSString *const kDEDataRecommendHot = @"recommendHot";
NSString *const kDEDataContent = @"content";
NSString *const kDEDataStatus = @"status";
NSString *const kDEDataTitle = @"title";
NSString *const kDEDataAuthor = @"author";
NSString *const kDEDataMediaContent = @"mediaContent";
NSString *const kDEDataTags = @"tags";
NSString *const kDEDataRelatedText = @"relatedText";
NSString *const kDEDataUpdateTime = @"updateTime";
NSString *const kDEDataImages = @"images";
NSString *const kDEDataHitCount = @"hitCount";
NSString *const kDEDataType = @"type";
NSString *const kDEDataSourceUrl = @"sourceUrl";
NSString *const kDEDataVotes = @"votes";
NSString *const kDEDataUpCount = @"upCount";
NSString *const kDEDataArticleId = @"articleId";
NSString *const kDEDataDownCount = @"downCount";
NSString *const kDEDataMediaId = @"mediaId";
NSString *const kDEDataHeatDegree = @"heatDegree";
NSString *const kDEDataCommentCount = @"commentCount";
NSString *const kDEDataPublishTime = @"publishTime";
NSString *const kDEDataDisplayType = @"displayType";
NSString *const kDEDataTypeContent = @"typeContent";
NSString *const kDEDataMediaName = @"mediaName";
NSString *const kDEDataRelatedContent = @"relatedContent";
NSString *const kDEDataThumbnails = @"thumbnails";
NSString *const kDEDataCategoryId = @"categoryId";
NSString *const kDEDataCached = @"cached";


@interface DEData ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation DEData

@synthesize carSerials = _carSerials;
@synthesize recommendHot = _recommendHot;
@synthesize content = _content;
@synthesize status = _status;
@synthesize title = _title;
@synthesize author = _author;
@synthesize mediaContent = _mediaContent;
@synthesize tags = _tags;
@synthesize relatedText = _relatedText;
@synthesize updateTime = _updateTime;
@synthesize images = _images;
@synthesize hitCount = _hitCount;
@synthesize type = _type;
@synthesize sourceUrl = _sourceUrl;
@synthesize votes = _votes;
@synthesize upCount = _upCount;
@synthesize articleId = _articleId;
@synthesize downCount = _downCount;
@synthesize mediaId = _mediaId;
@synthesize heatDegree = _heatDegree;
@synthesize commentCount = _commentCount;
@synthesize publishTime = _publishTime;
@synthesize displayType = _displayType;
@synthesize typeContent = _typeContent;
@synthesize mediaName = _mediaName;
@synthesize relatedContent = _relatedContent;
@synthesize thumbnails = _thumbnails;
@synthesize categoryId = _categoryId;
@synthesize cached = _cached;


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
    NSObject *receivedDECarSerials = [dict objectForKey:kDEDataCarSerials];
    NSMutableArray *parsedDECarSerials = [NSMutableArray array];
    if ([receivedDECarSerials isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedDECarSerials) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedDECarSerials addObject:[DECarSerials modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedDECarSerials isKindOfClass:[NSDictionary class]]) {
       [parsedDECarSerials addObject:[DECarSerials modelObjectWithDictionary:(NSDictionary *)receivedDECarSerials]];
    }

    self.carSerials = [NSArray arrayWithArray:parsedDECarSerials];
            self.recommendHot = [[self objectOrNilForKey:kDEDataRecommendHot fromDictionary:dict] doubleValue];
            self.content = [self objectOrNilForKey:kDEDataContent fromDictionary:dict];
            self.status = [[self objectOrNilForKey:kDEDataStatus fromDictionary:dict] doubleValue];
            self.title = [self objectOrNilForKey:kDEDataTitle fromDictionary:dict];
            self.author = [self objectOrNilForKey:kDEDataAuthor fromDictionary:dict];
            self.mediaContent = [self objectOrNilForKey:kDEDataMediaContent fromDictionary:dict];
            self.tags = [self objectOrNilForKey:kDEDataTags fromDictionary:dict];
            self.relatedText = [self objectOrNilForKey:kDEDataRelatedText fromDictionary:dict];
            self.updateTime = [[self objectOrNilForKey:kDEDataUpdateTime fromDictionary:dict] doubleValue];
            self.images = [self objectOrNilForKey:kDEDataImages fromDictionary:dict];
            self.hitCount = [[self objectOrNilForKey:kDEDataHitCount fromDictionary:dict] doubleValue];
            self.type = [[self objectOrNilForKey:kDEDataType fromDictionary:dict] doubleValue];
            self.sourceUrl = [self objectOrNilForKey:kDEDataSourceUrl fromDictionary:dict];
            self.votes = [self objectOrNilForKey:kDEDataVotes fromDictionary:dict];
            self.upCount = [[self objectOrNilForKey:kDEDataUpCount fromDictionary:dict] doubleValue];
            self.articleId = [[self objectOrNilForKey:kDEDataArticleId fromDictionary:dict] doubleValue];
            self.downCount = [[self objectOrNilForKey:kDEDataDownCount fromDictionary:dict] doubleValue];
            self.mediaId = [[self objectOrNilForKey:kDEDataMediaId fromDictionary:dict] doubleValue];
            self.heatDegree = [[self objectOrNilForKey:kDEDataHeatDegree fromDictionary:dict] doubleValue];
            self.commentCount = [[self objectOrNilForKey:kDEDataCommentCount fromDictionary:dict] doubleValue];
            self.publishTime = [[self objectOrNilForKey:kDEDataPublishTime fromDictionary:dict] doubleValue];
            self.displayType = [[self objectOrNilForKey:kDEDataDisplayType fromDictionary:dict] doubleValue];
            self.typeContent = [self objectOrNilForKey:kDEDataTypeContent fromDictionary:dict];
            self.mediaName = [self objectOrNilForKey:kDEDataMediaName fromDictionary:dict];
            self.relatedContent = [self objectOrNilForKey:kDEDataRelatedContent fromDictionary:dict];
            self.thumbnails = [self objectOrNilForKey:kDEDataThumbnails fromDictionary:dict];
            self.categoryId = [[self objectOrNilForKey:kDEDataCategoryId fromDictionary:dict] doubleValue];
            self.cached = [[self objectOrNilForKey:kDEDataCached fromDictionary:dict] boolValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    NSMutableArray *tempArrayForCarSerials = [NSMutableArray array];
    for (NSObject *subArrayObject in self.carSerials) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForCarSerials addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForCarSerials addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForCarSerials] forKey:kDEDataCarSerials];
    [mutableDict setValue:[NSNumber numberWithDouble:self.recommendHot] forKey:kDEDataRecommendHot];
    [mutableDict setValue:self.content forKey:kDEDataContent];
    [mutableDict setValue:[NSNumber numberWithDouble:self.status] forKey:kDEDataStatus];
    [mutableDict setValue:self.title forKey:kDEDataTitle];
    [mutableDict setValue:self.author forKey:kDEDataAuthor];
    [mutableDict setValue:self.mediaContent forKey:kDEDataMediaContent];
    [mutableDict setValue:self.tags forKey:kDEDataTags];
    [mutableDict setValue:self.relatedText forKey:kDEDataRelatedText];
    [mutableDict setValue:[NSNumber numberWithDouble:self.updateTime] forKey:kDEDataUpdateTime];
    NSMutableArray *tempArrayForImages = [NSMutableArray array];
    for (NSObject *subArrayObject in self.images) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForImages addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForImages addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForImages] forKey:kDEDataImages];
    [mutableDict setValue:[NSNumber numberWithDouble:self.hitCount] forKey:kDEDataHitCount];
    [mutableDict setValue:[NSNumber numberWithDouble:self.type] forKey:kDEDataType];
    [mutableDict setValue:self.sourceUrl forKey:kDEDataSourceUrl];
    NSMutableArray *tempArrayForVotes = [NSMutableArray array];
    for (NSObject *subArrayObject in self.votes) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForVotes addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForVotes addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForVotes] forKey:kDEDataVotes];
    [mutableDict setValue:[NSNumber numberWithDouble:self.upCount] forKey:kDEDataUpCount];
    [mutableDict setValue:[NSNumber numberWithDouble:self.articleId] forKey:kDEDataArticleId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.downCount] forKey:kDEDataDownCount];
    [mutableDict setValue:[NSNumber numberWithDouble:self.mediaId] forKey:kDEDataMediaId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.heatDegree] forKey:kDEDataHeatDegree];
    [mutableDict setValue:[NSNumber numberWithDouble:self.commentCount] forKey:kDEDataCommentCount];
    [mutableDict setValue:[NSNumber numberWithDouble:self.publishTime] forKey:kDEDataPublishTime];
    [mutableDict setValue:[NSNumber numberWithDouble:self.displayType] forKey:kDEDataDisplayType];
    [mutableDict setValue:self.typeContent forKey:kDEDataTypeContent];
    [mutableDict setValue:self.mediaName forKey:kDEDataMediaName];
    [mutableDict setValue:self.relatedContent forKey:kDEDataRelatedContent];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForThumbnails] forKey:kDEDataThumbnails];
    [mutableDict setValue:[NSNumber numberWithDouble:self.categoryId] forKey:kDEDataCategoryId];
    [mutableDict setValue:[NSNumber numberWithBool:self.cached] forKey:kDEDataCached];

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

    self.carSerials = [aDecoder decodeObjectForKey:kDEDataCarSerials];
    self.recommendHot = [aDecoder decodeDoubleForKey:kDEDataRecommendHot];
    self.content = [aDecoder decodeObjectForKey:kDEDataContent];
    self.status = [aDecoder decodeDoubleForKey:kDEDataStatus];
    self.title = [aDecoder decodeObjectForKey:kDEDataTitle];
    self.author = [aDecoder decodeObjectForKey:kDEDataAuthor];
    self.mediaContent = [aDecoder decodeObjectForKey:kDEDataMediaContent];
    self.tags = [aDecoder decodeObjectForKey:kDEDataTags];
    self.relatedText = [aDecoder decodeObjectForKey:kDEDataRelatedText];
    self.updateTime = [aDecoder decodeDoubleForKey:kDEDataUpdateTime];
    self.images = [aDecoder decodeObjectForKey:kDEDataImages];
    self.hitCount = [aDecoder decodeDoubleForKey:kDEDataHitCount];
    self.type = [aDecoder decodeDoubleForKey:kDEDataType];
    self.sourceUrl = [aDecoder decodeObjectForKey:kDEDataSourceUrl];
    self.votes = [aDecoder decodeObjectForKey:kDEDataVotes];
    self.upCount = [aDecoder decodeDoubleForKey:kDEDataUpCount];
    self.articleId = [aDecoder decodeDoubleForKey:kDEDataArticleId];
    self.downCount = [aDecoder decodeDoubleForKey:kDEDataDownCount];
    self.mediaId = [aDecoder decodeDoubleForKey:kDEDataMediaId];
    self.heatDegree = [aDecoder decodeDoubleForKey:kDEDataHeatDegree];
    self.commentCount = [aDecoder decodeDoubleForKey:kDEDataCommentCount];
    self.publishTime = [aDecoder decodeDoubleForKey:kDEDataPublishTime];
    self.displayType = [aDecoder decodeDoubleForKey:kDEDataDisplayType];
    self.typeContent = [aDecoder decodeObjectForKey:kDEDataTypeContent];
    self.mediaName = [aDecoder decodeObjectForKey:kDEDataMediaName];
    self.relatedContent = [aDecoder decodeObjectForKey:kDEDataRelatedContent];
    self.thumbnails = [aDecoder decodeObjectForKey:kDEDataThumbnails];
    self.categoryId = [aDecoder decodeDoubleForKey:kDEDataCategoryId];
    self.cached = [aDecoder decodeBoolForKey:kDEDataCached];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_carSerials forKey:kDEDataCarSerials];
    [aCoder encodeDouble:_recommendHot forKey:kDEDataRecommendHot];
    [aCoder encodeObject:_content forKey:kDEDataContent];
    [aCoder encodeDouble:_status forKey:kDEDataStatus];
    [aCoder encodeObject:_title forKey:kDEDataTitle];
    [aCoder encodeObject:_author forKey:kDEDataAuthor];
    [aCoder encodeObject:_mediaContent forKey:kDEDataMediaContent];
    [aCoder encodeObject:_tags forKey:kDEDataTags];
    [aCoder encodeObject:_relatedText forKey:kDEDataRelatedText];
    [aCoder encodeDouble:_updateTime forKey:kDEDataUpdateTime];
    [aCoder encodeObject:_images forKey:kDEDataImages];
    [aCoder encodeDouble:_hitCount forKey:kDEDataHitCount];
    [aCoder encodeDouble:_type forKey:kDEDataType];
    [aCoder encodeObject:_sourceUrl forKey:kDEDataSourceUrl];
    [aCoder encodeObject:_votes forKey:kDEDataVotes];
    [aCoder encodeDouble:_upCount forKey:kDEDataUpCount];
    [aCoder encodeDouble:_articleId forKey:kDEDataArticleId];
    [aCoder encodeDouble:_downCount forKey:kDEDataDownCount];
    [aCoder encodeDouble:_mediaId forKey:kDEDataMediaId];
    [aCoder encodeDouble:_heatDegree forKey:kDEDataHeatDegree];
    [aCoder encodeDouble:_commentCount forKey:kDEDataCommentCount];
    [aCoder encodeDouble:_publishTime forKey:kDEDataPublishTime];
    [aCoder encodeDouble:_displayType forKey:kDEDataDisplayType];
    [aCoder encodeObject:_typeContent forKey:kDEDataTypeContent];
    [aCoder encodeObject:_mediaName forKey:kDEDataMediaName];
    [aCoder encodeObject:_relatedContent forKey:kDEDataRelatedContent];
    [aCoder encodeObject:_thumbnails forKey:kDEDataThumbnails];
    [aCoder encodeDouble:_categoryId forKey:kDEDataCategoryId];
    [aCoder encodeBool:_cached forKey:kDEDataCached];
}

- (id)copyWithZone:(NSZone *)zone
{
    DEData *copy = [[DEData alloc] init];
    
    if (copy) {

        copy.carSerials = [self.carSerials copyWithZone:zone];
        copy.recommendHot = self.recommendHot;
        copy.content = [self.content copyWithZone:zone];
        copy.status = self.status;
        copy.title = [self.title copyWithZone:zone];
        copy.author = [self.author copyWithZone:zone];
        copy.mediaContent = [self.mediaContent copyWithZone:zone];
        copy.tags = [self.tags copyWithZone:zone];
        copy.relatedText = [self.relatedText copyWithZone:zone];
        copy.updateTime = self.updateTime;
        copy.images = [self.images copyWithZone:zone];
        copy.hitCount = self.hitCount;
        copy.type = self.type;
        copy.sourceUrl = [self.sourceUrl copyWithZone:zone];
        copy.votes = [self.votes copyWithZone:zone];
        copy.upCount = self.upCount;
        copy.articleId = self.articleId;
        copy.downCount = self.downCount;
        copy.mediaId = self.mediaId;
        copy.heatDegree = self.heatDegree;
        copy.commentCount = self.commentCount;
        copy.publishTime = self.publishTime;
        copy.displayType = self.displayType;
        copy.typeContent = [self.typeContent copyWithZone:zone];
        copy.mediaName = [self.mediaName copyWithZone:zone];
        copy.relatedContent = [self.relatedContent copyWithZone:zone];
        copy.thumbnails = [self.thumbnails copyWithZone:zone];
        copy.categoryId = self.categoryId;
        copy.cached = self.cached;
    }
    
    return copy;
}


@end
