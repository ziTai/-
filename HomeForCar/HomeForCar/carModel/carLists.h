//
//  carLists.h
//
//  Created by mac  on 16/3/8
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface carLists : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *imgUrl;
@property (nonatomic, assign) double listsIdentifier;
@property (nonatomic, strong) NSString *country;
@property (nonatomic, strong) NSString *firstLetter;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, assign) double articleId;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
