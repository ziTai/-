//
//  ItemList.m
//
//  Created by mac  on 16/3/4
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "ItemList.h"
#import "Content.h"
#import "Action.h"


NSString *const kItemListArticleId = @"articleId";
NSString *const kItemListContent = @"content";
NSString *const kItemListCategoryId = @"categoryId";
NSString *const kItemListAction = @"action";


@interface ItemList ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ItemList

@synthesize articleId = _articleId;
@synthesize content = _content;
@synthesize categoryId = _categoryId;
@synthesize action = _action;


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
            self.articleId = [[self objectOrNilForKey:kItemListArticleId fromDictionary:dict] doubleValue];
            self.content = [Content modelObjectWithDictionary:[dict objectForKey:kItemListContent]];
            self.categoryId = [[self objectOrNilForKey:kItemListCategoryId fromDictionary:dict] doubleValue];
            self.action = [Action modelObjectWithDictionary:[dict objectForKey:kItemListAction]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.articleId] forKey:kItemListArticleId];
    [mutableDict setValue:[self.content dictionaryRepresentation] forKey:kItemListContent];
    [mutableDict setValue:[NSNumber numberWithDouble:self.categoryId] forKey:kItemListCategoryId];
    [mutableDict setValue:[self.action dictionaryRepresentation] forKey:kItemListAction];

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

    self.articleId = [aDecoder decodeDoubleForKey:kItemListArticleId];
    self.content = [aDecoder decodeObjectForKey:kItemListContent];
    self.categoryId = [aDecoder decodeDoubleForKey:kItemListCategoryId];
    self.action = [aDecoder decodeObjectForKey:kItemListAction];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_articleId forKey:kItemListArticleId];
    [aCoder encodeObject:_content forKey:kItemListContent];
    [aCoder encodeDouble:_categoryId forKey:kItemListCategoryId];
    [aCoder encodeObject:_action forKey:kItemListAction];
}

- (id)copyWithZone:(NSZone *)zone
{
    ItemList *copy = [[ItemList alloc] init];
    
    if (copy) {

        copy.articleId = self.articleId;
        copy.content = [self.content copyWithZone:zone];
        copy.categoryId = self.categoryId;
        copy.action = [self.action copyWithZone:zone];
    }
    
    return copy;
}


@end
