//
//  ViewController.m
//  test
//
//  Created by Yuchen Wang on 2021/1/9.
//

#import "ViewController.h"
#import "ZJPerson.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self testNSString];

    
}

- (void)testNSString {
    ZJPerson *person = [[ZJPerson alloc] init];
    NSMutableString *mutString = [NSMutableString stringWithString:@"123"];
    person.StrongName = mutString;
    
    [mutString appendString:@"666"];
    NSLog(@"strongName: %@", person.StrongName);
}


- (void)testDispatch {
    dispatch_group_t group = dispatch_group_create();
    
    dispatch_group_enter(group);
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
//        sleep(1);
        NSLog(@"123");
        dispatch_group_leave(group);
    });
    
    dispatch_group_enter(group);
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        NSLog(@"4567");
        dispatch_group_leave(group);
    });
    
    dispatch_group_async(group, dispatch_get_global_queue(0, 0), ^{
        NSLog(@"890");
    });
    
    
    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
        NSLog(@"他们回来了 我准备主线程更新ui");
    });
    
    NSLog(@"主线程事务正常执行");
    
}

@end
