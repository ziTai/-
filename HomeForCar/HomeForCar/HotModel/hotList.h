//
//  hotList.h
//
//  Created by mac  on 16/3/7
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface hotList : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double height;
@property (nonatomic, assign) double imageId;
@property (nonatomic, strong) NSString *url;
@property (nonatomic, assign) double width;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
