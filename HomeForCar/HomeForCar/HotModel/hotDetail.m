//
//  hotDetail.m
//
//  Created by mac  on 16/3/7
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "hotDetail.h"


NSString *const khotDetailHeight = @"height";
NSString *const khotDetailImageId = @"imageId";
NSString *const khotDetailUrl = @"url";
NSString *const khotDetailWidth = @"width";


@interface hotDetail ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation hotDetail

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
            self.height = [[self objectOrNilForKey:khotDetailHeight fromDictionary:dict] doubleValue];
            self.imageId = [[self objectOrNilForKey:khotDetailImageId fromDictionary:dict] doubleValue];
            self.url = [self objectOrNilForKey:khotDetailUrl fromDictionary:dict];
            self.width = [[self objectOrNilForKey:khotDetailWidth fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.height] forKey:khotDetailHeight];
    [mutableDict setValue:[NSNumber numberWithDouble:self.imageId] forKey:khotDetailImageId];
    [mutableDict setValue:self.url forKey:khotDetailUrl];
    [mutableDict setValue:[NSNumber numberWithDouble:self.width] forKey:khotDetailWidth];

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

    self.height = [aDecoder decodeDoubleForKey:khotDetailHeight];
    self.imageId = [aDecoder decodeDoubleForKey:khotDetailImageId];
    self.url = [aDecoder decodeObjectForKey:khotDetailUrl];
    self.width = [aDecoder decodeDoubleForKey:khotDetailWidth];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_height forKey:khotDetailHeight];
    [aCoder encodeDouble:_imageId forKey:khotDetailImageId];
    [aCoder encodeObject:_url forKey:khotDetailUrl];
    [aCoder encodeDouble:_width forKey:khotDetailWidth];
}

- (id)copyWithZone:(NSZone *)zone
{
    hotDetail *copy = [[hotDetail alloc] init];
    
    if (copy) {

        copy.height = self.height;
        copy.imageId = self.imageId;
        copy.url = [self.url copyWithZone:zone];
        copy.width = self.width;
    }
    
    return copy;
}


@end
