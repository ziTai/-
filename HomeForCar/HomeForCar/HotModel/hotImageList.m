//
//  hotImageList.m
//
//  Created by mac  on 16/3/7
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "hotImageList.h"
#import "hotDetail.h"
#import "hotList.h"


NSString *const khotImageListDetail = @"detail";
NSString *const khotImageListList = @"list";


@interface hotImageList ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation hotImageList

@synthesize detail = _detail;
@synthesize list = _list;


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
            self.detail = [hotDetail modelObjectWithDictionary:[dict objectForKey:khotImageListDetail]];
            self.list = [hotList modelObjectWithDictionary:[dict objectForKey:khotImageListList]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[self.detail dictionaryRepresentation] forKey:khotImageListDetail];
    [mutableDict setValue:[self.list dictionaryRepresentation] forKey:khotImageListList];

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

    self.detail = [aDecoder decodeObjectForKey:khotImageListDetail];
    self.list = [aDecoder decodeObjectForKey:khotImageListList];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_detail forKey:khotImageListDetail];
    [aCoder encodeObject:_list forKey:khotImageListList];
}

- (id)copyWithZone:(NSZone *)zone
{
    hotImageList *copy = [[hotImageList alloc] init];
    
    if (copy) {

        copy.detail = [self.detail copyWithZone:zone];
        copy.list = [self.list copyWithZone:zone];
    }
    
    return copy;
}


@end
