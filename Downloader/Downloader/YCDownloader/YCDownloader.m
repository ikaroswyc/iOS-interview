//
//  YCDownloader.m
//  Downloader
//
//  Created by Yuchen Wang on 2021/1/22.
//

#import "YCDownloader.h"

@interface YCDownloader()<NSURLConnectionDataDelegate>

@property (nonatomic, assign) long long  currentLength;

@end

@implementation YCDownloader

- (void)downLoadWithURL:(NSURL *)url
               progress:(void (^)(float progress))progress
             completion:(void (^)(NSString *filePath))completion failed:(void(^)(NSString *failed))failed {
    
}

- (void)pause {
    
}


@end
