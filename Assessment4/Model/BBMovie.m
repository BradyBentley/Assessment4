//
//  BBMovie.m
//  Assessment4
//
//  Created by Brady Bentley on 12/21/18.
//  Copyright © 2018 Brady. All rights reserved.
//

#import "BBMovie.h"
//@property (nonatomic, readonly) NSString *title;
//@property (nonatomic, readonly) NSInteger rating;
//@property (nonatomic, readonly) NSString *overview;

@implementation BBMovie

// MARK: - Initialization
- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if (self) {
        _title = dictionary[@"title"];
        _rating = [dictionary[@"vote_average"] integerValue];
        _overview =dictionary[@"overview"];
    }
    return self;
}


@end
