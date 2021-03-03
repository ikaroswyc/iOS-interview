//
//  ViewController.m
//  testMultiThread
//
//  Created by Yuchen Wang on 2021/2/2.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) dispatch_queue_t serialQueue;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.serialQueue = dispatch_queue_create("my_serial_queue", DISPATCH_QUEUE_SERIAL);
    [NSThread detachNewThreadSelector:@selector(testSerialQueue) toTarget:self withObject:nil];
}

- (void)testSerialQueue {
    dispatch_sync(self.serialQueue, ^{
        NSLog(@"task 1: %@", [NSThread currentThread]);
    });
}

- (IBAction)doTestButtonTouched:(id)sender {
    dispatch_sync(self.serialQueue, ^{
        NSLog(@"task 2: %@", [NSThread currentThread]);
    });
}

@end
