//
//  BBMovie.h
//  Assessment4
//
//  Created by Brady Bentley on 12/21/18.
//  Copyright © 2018 Brady. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface BBMovie : NSObject

// MARK: - Properties
@property (nonatomic, readonly) NSString *title;
@property (nonatomic, readonly) NSInteger rating;
@property (nonatomic, readonly) NSString *overview;
@property (nonatomic, readonly, nullable) NSString *moviePoster;
@property (nonatomic, readonly) NSInteger votes;
@property (nonatomic, readonly) NSString *releaseDate;

// MARK: - Initialization
-(instancetype)initWithDictionary: (NSDictionary *)dictionary;

@end

NS_ASSUME_NONNULL_END
