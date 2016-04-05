//
//  carLists.m
//
//  Created by mac  on 16/3/8
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "carLists.h"


NSString *const kcarListsImgUrl = @"imgUrl";
NSString *const kcarListsId = @"id";
NSString *const kcarListsCountry = @"country";
NSString *const kcarListsFirstLetter = @"firstLetter";
NSString *const kcarListsName = @"name";
NSString *const kcarListsArticleId = @"articleId";


@interface carLists ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation carLists

@synthesize imgUrl = _imgUrl;
@synthesize listsIdentifier = _listsIdentifier;
@synthesize country = _country;
@synthesize firstLetter = _firstLetter;
@synthesize name = _name;
@synthesize articleId = _articleId;


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
            self.imgUrl = [self objectOrNilForKey:kcarListsImgUrl fromDictionary:dict];
            self.listsIdentifier = [[self objectOrNilForKey:kcarListsId fromDictionary:dict] doubleValue];
            self.country = [self objectOrNilForKey:kcarListsCountry fromDictionary:dict];
            self.firstLetter = [self objectOrNilForKey:kcarListsFirstLetter fromDictionary:dict];
            self.name = [self objectOrNilForKey:kcarListsName fromDictionary:dict];
            self.articleId = [[self objectOrNilForKey:kcarListsArticleId fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.imgUrl forKey:kcarListsImgUrl];
    [mutableDict setValue:[NSNumber numberWithDouble:self.listsIdentifier] forKey:kcarListsId];
    [mutableDict setValue:self.country forKey:kcarListsCountry];
    [mutableDict setValue:self.firstLetter forKey:kcarListsFirstLetter];
    [mutableDict setValue:self.name forKey:kcarListsName];
    [mutableDict setValue:[NSNumber numberWithDouble:self.articleId] forKey:kcarListsArticleId];

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

    self.imgUrl = [aDecoder decodeObjectForKey:kcarListsImgUrl];
    self.listsIdentifier = [aDecoder decodeDoubleForKey:kcarListsId];
    self.country = [aDecoder decodeObjectForKey:kcarListsCountry];
    self.firstLetter = [aDecoder decodeObjectForKey:kcarListsFirstLetter];
    self.name = [aDecoder decodeObjectForKey:kcarListsName];
    self.articleId = [aDecoder decodeDoubleForKey:kcarListsArticleId];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_imgUrl forKey:kcarListsImgUrl];
    [aCoder encodeDouble:_listsIdentifier forKey:kcarListsId];
    [aCoder encodeObject:_country forKey:kcarListsCountry];
    [aCoder encodeObject:_firstLetter forKey:kcarListsFirstLetter];
    [aCoder encodeObject:_name forKey:kcarListsName];
    [aCoder encodeDouble:_articleId forKey:kcarListsArticleId];
}

- (id)copyWithZone:(NSZone *)zone
{
    carLists *copy = [[carLists alloc] init];
    
    if (copy) {

        copy.imgUrl = [self.imgUrl copyWithZone:zone];
        copy.listsIdentifier = self.listsIdentifier;
        copy.country = [self.country copyWithZone:zone];
        copy.firstLetter = [self.firstLetter copyWithZone:zone];
        copy.name = [self.name copyWithZone:zone];
        copy.articleId = self.articleId;
    }
    
    return copy;
}


@end
