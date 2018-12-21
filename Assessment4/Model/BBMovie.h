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

// MARK: - Initialization
-(instancetype)initWithDictionary: (NSDictionary *)dictionary;

@end

NS_ASSUME_NONNULL_END
