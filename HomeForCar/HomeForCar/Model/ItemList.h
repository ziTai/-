//
//  ItemList.h
//
//  Created by mac  on 16/3/4
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Content, Action;

@interface ItemList : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double articleId;
@property (nonatomic, strong) Content *content;
@property (nonatomic, assign) double categoryId;
@property (nonatomic, strong) Action *action;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
