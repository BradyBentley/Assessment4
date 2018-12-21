//
//  BBMovie.m
//  Assessment4
//
//  Created by Brady Bentley on 12/21/18.
//  Copyright © 2018 Brady. All rights reserved.
//

#import "BBMovie.h"

@implementation BBMovie

// MARK: - Initialization
- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if (self) {
        _title = dictionary[@"title"];
        _rating = [dictionary[@"vote_average"] integerValue];
        _overview = dictionary[@"overview"];
        _moviePoster = dictionary[@"poster_path"];
        _votes = [dictionary[@"vote_count"] integerValue];
        _releaseDate = dictionary[@"release_date"];
    }
    return self;
}


@end
