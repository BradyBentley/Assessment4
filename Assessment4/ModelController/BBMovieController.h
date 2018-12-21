//
//  BBMovieController.h
//  Assessment4
//
//  Created by Brady Bentley on 12/21/18.
//  Copyright © 2018 Brady. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BBMovie.h"
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BBMovieController : NSObject

// MARK: - Methods
+(void)fetchMovieWithName: (NSString *)name
               completion: (void (^)(NSArray<BBMovie *>* _Nullable movies))completion;

+(void)fetchImageWithMovie: (BBMovie *)movie
                completion: (void (^)(UIImage * _Nullable image))completion;

@end

NS_ASSUME_NONNULL_END
