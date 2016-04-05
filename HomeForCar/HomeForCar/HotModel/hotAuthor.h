//
//  hotAuthor.h
//
//  Created by mac  on 16/3/7
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface hotAuthor : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) BOOL manager;
@property (nonatomic, assign) double identity;
@property (nonatomic, assign) BOOL internal;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *userId;
@property (nonatomic, strong) NSString *avatar;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
