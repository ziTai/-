//
//  hotList.m
//
//  Created by mac  on 16/3/7
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "hotList.h"


NSString *const khotListHeight = @"height";
NSString *const khotListImageId = @"imageId";
NSString *const khotListUrl = @"url";
NSString *const khotListWidth = @"width";


@interface hotList ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation hotList

@synthesize height = _height;
@synthesize imageId = _imageId;
@synthesize url = _url;
@synthesize width = _width;


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
            self.height = [[self objectOrNilForKey:khotListHeight fromDictionary:dict] doubleValue];
            self.imageId = [[self objectOrNilForKey:khotListImageId fromDictionary:dict] doubleValue];
            self.url = [self objectOrNilForKey:khotListUrl fromDictionary:dict];
            self.width = [[self objectOrNilForKey:khotListWidth fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.height] forKey:khotListHeight];
    [mutableDict setValue:[NSNumber numberWithDouble:self.imageId] forKey:khotListImageId];
    [mutableDict setValue:self.url forKey:khotListUrl];
    [mutableDict setValue:[NSNumber numberWithDouble:self.width] forKey:khotListWidth];

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

    self.height = [aDecoder decodeDoubleForKey:khotListHeight];
    self.imageId = [aDecoder decodeDoubleForKey:khotListImageId];
    self.url = [aDecoder decodeObjectForKey:khotListUrl];
    self.width = [aDecoder decodeDoubleForKey:khotListWidth];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_height forKey:khotListHeight];
    [aCoder encodeDouble:_imageId forKey:khotListImageId];
    [aCoder encodeObject:_url forKey:khotListUrl];
    [aCoder encodeDouble:_width forKey:khotListWidth];
}

- (id)copyWithZone:(NSZone *)zone
{
    hotList *copy = [[hotList alloc] init];
    
    if (copy) {

        copy.height = self.height;
        copy.imageId = self.imageId;
        copy.url = [self.url copyWithZone:zone];
        copy.width = self.width;
    }
    
    return copy;
}


@end
