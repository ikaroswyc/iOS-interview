//
//  YCDownloader.h
//  Downloader
//
//  Created by Yuchen Wang on 2021/1/22.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface YCDownloader : NSObject

- (void)downLoadWithURL:(NSURL *)url progress:(void (^)(float progress))progress completion:(void (^)(NSString *filePath))completion failed:(void(^)(NSString *failed))failed;// $$$$$

- (void)pause;

@end

NS_ASSUME_NONNULL_END
