//
//  ViewController.m
//  testAutoReleasePool
//
//  Created by Yuchen Wang on 2021/1/25.
//

#import "ViewController.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    [self testNoAutoRelease];
    [self testAutoRelease];
}

- (void)testNoAutoRelease {
    
    int largeNumber = 999999999;
    
    for (int i = 0; i < largeNumber; i++) {
        NSString *str = [NSString stringWithFormat:@"hello -%04d", i];
        str = [str stringByAppendingString:@" - world"];
        NSLog(@"%@", str);
    }
}


- (void)testAutoRelease {
    
    int largeNumber = 999999999;

    for (int i = 0; i < largeNumber; i++) {
        @autoreleasepool {
            NSString *str = [NSString stringWithFormat:@"hello -%04d", i];
            str = [str stringByAppendingString:@" - world"];
            NSLog(@"%@", str);
        }
    }
}
@end
