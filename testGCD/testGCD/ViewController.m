//
//  ViewController.m
//  testGCD
//
//  Created by Yuchen Wang on 2021/2/3.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // 主队列同步 死锁
//    dispatch_sync(dispatch_get_main_queue(), ^{
//        NSLog(@"dealloc");
//    });
    
    [self use041];
}

- (void)use041{
    dispatch_queue_t concurrentQueue = dispatch_queue_create("com.CJL.Queue", DISPATCH_QUEUE_CONCURRENT);
    
    NSMutableArray *array = [NSMutableArray array];
    
    for (int i = 0; i<100000; i++) {
        dispatch_async(concurrentQueue, ^{
            dispatch_barrier_async(concurrentQueue, ^{
                NSLog(@"%d",i);
                [array addObject:[NSString stringWithFormat:@"%d", i]];
            });
        });
    }
}

@end
