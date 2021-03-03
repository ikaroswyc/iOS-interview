//
//  AppDelegate.m
//  testUIView
//
//  Created by Yuchen Wang on 2021/2/17.
//

#import "AppDelegate.h"
#import "ViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    UINavigationController * nvc = [[UINavigationController alloc] initWithRootViewController:[[ViewController alloc] init]];
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window setRootViewController:nvc];
    [self.window makeKeyAndVisible];
    return YES;
}



@end
