//
//  AppDelegate.m
//  test
//
//  Created by Yuchen Wang on 2021/1/9.
//

#import "AppDelegate.h"
#import "ZJPerson.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
//    dispatch_queue_t globalQueue = dispatch_get_global_queue(0, 0);
//    
//    __block int a = 0;
//    
//    while (a < 5) {
//        dispatch_async(globalQueue, ^{
//            a++;
//            NSLog(@"内部: %d - %@", a, [NSThread currentThread]);
//        });
//    }
//    
//    NSLog(@"外部打印： %d", a);
    
    return YES;
}




#pragma mark - UISceneSession lifecycle


- (UISceneConfiguration *)application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options {
    // Called when a new scene session is being created.
    // Use this method to select a configuration to create the new scene with.
    return [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
}


- (void)application:(UIApplication *)application didDiscardSceneSessions:(NSSet<UISceneSession *> *)sceneSessions {
    // Called when the user discards a scene session.
    // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
    // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
}


@end
