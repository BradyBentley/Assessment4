//
//  BBMovieController.m
//  Assessment4
//
//  Created by Brady Bentley on 12/21/18.
//  Copyright © 2018 Brady. All rights reserved.
//

#import "BBMovieController.h"

@implementation BBMovieController

// MARK: - Methods
+(NSURL *)baseUrl
{
    return [NSURL URLWithString:@"https://api.themoviedb.org/3"];
}

+ (void)fetchMovieWithName:(NSString *)name completion:(void (^)(NSArray<BBMovie *> * _Nullable))completion
{
    //URL + Request
    NSURL *url = [[[BBMovieController baseUrl] URLByAppendingPathComponent:@"search"] URLByAppendingPathComponent:@"movie"];
    NSURLComponents *urlComponents = [NSURLComponents componentsWithURL:url resolvingAgainstBaseURL:YES];
    urlComponents.queryItems = @[[NSURLQueryItem queryItemWithName:@"api_key" value:@"ca4c06450ff6463cdeac6e6286782861"], [NSURLQueryItem queryItemWithName:@"query" value:name]];
    NSURL *finalUrl = urlComponents.URL;
    //DataTask + resume
    [[[NSURLSession sharedSession] dataTaskWithURL:finalUrl completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            NSLog(@"Error in %s: %@, %@", __PRETTY_FUNCTION__, error, error.localizedDescription);
            completion(nil);
            return;
        }
        if (!data){
            NSLog(@"No data coming back");
            completion(nil);
            return;
        }
        NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
        NSArray *resultsArray = jsonDictionary[@"results"];
        NSMutableArray *moviesArray = [NSMutableArray new];
        for (NSDictionary *movieDictionary in resultsArray){
            BBMovie *movie = [[BBMovie alloc] initWithDictionary:movieDictionary];
            [moviesArray addObject:movie];
        }
        completion(moviesArray);
    }]resume];
}

+ (void)fetchImageWithMovie:(BBMovie *)movie completion:(void (^)(UIImage * _Nullable))completion
{
    //URL + Request
    NSString *url = [NSString stringWithFormat:@"%s%@", "https://image.tmdb.org/t/p/w500", movie.moviePoster];
    NSURL *imageUrl = [[NSURL alloc] initWithString:url];
    if(!imageUrl){
        completion(nil);
        return;
    }
    NSLog(@"🛰%@", imageUrl.absoluteString);
    //DataTask + Resume
    [[[NSURLSession sharedSession] dataTaskWithURL:imageUrl completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            NSLog(@"Error in %s: %@, %@", __PRETTY_FUNCTION__, error, error.localizedDescription);
            completion(nil);
            return;
        }
        UIImage *image = [[UIImage alloc] initWithData:data];
        if (image) {
            completion(image);
        } else {
            NSLog(@"Couldn't turn data into image");
            completion(nil);
        }
    }]resume];
}

@end
