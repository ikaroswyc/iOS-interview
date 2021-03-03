//
//  YCDownloaderManager.m
//  Downloader
//
//  Created by Yuchen Wang on 2021/1/22.
//

#import "YCDownloaderManager.h"



@implementation YCDownloaderManager

+ (YCDownloaderManager *)sharedDownloaderManager {
    
    
    static YCDownloaderManager *YCDownloaderManager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        YCDownloaderManager = [[self alloc] init];
    });
    
    return YCDownloaderManager;
}

@end
