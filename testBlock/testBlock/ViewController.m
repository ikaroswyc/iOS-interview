//
//  ViewController.m
//  testBlock
//
//  Created by Yuchen Wang on 2021/1/30.
//

#import "ViewController.h"
#import "Person.h"
#import "Teacher.h"
@interface ViewController ()

@property (nonatomic, strong) Person *person;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    [self stackBlock];
//    [self personBlock];
    [self testPersonBlock2];
}

- (void)personBlock {
    
    self.person = [[Person alloc] init];
    
    self.person.name = @"qqq";
    
    __block NSString *test = @"rrr";
    void(^block)(void) = ^{
        
        test = @"www";
        
        self.person.name = @"xxx";
        NSLog(@"test: %@",test);
        NSLog(@"person name: %@", self.person.name);
        
    };
    
    block();
    
}


//_NSGlobalBlock__
- (void)globalBlock {
    void(^block)(void) = ^{
        NSLog(@"CJL");
    };
    NSLog(@"%@", block);
}

// mallocBlock
- (void)mallocBlock {
    int a = 10;
    void(^block)(void) = ^{
        NSLog(@"CJL - %d", a);
    };
    NSLog(@"%@", block);
}

// stackBlock 需要在mrc模式下运行，arc下自动copy到堆
- (void)stackBlock {
    
    int a = 10;
   void(^block)(void) = ^{
       NSLog(@"CJL - %d", a);
   };
   NSLog(@"%@", ^{
       NSLog(@"CJL - %d", a);
   });
}

//- (void)testPersonBlock {
//
//    __block Person *person = [[Person alloc] init];
//    void(^block)(void) = ^{
//        person = [[Teacher alloc] init];
//
//    };
//
//    block();
//
//
//}

- (void)testPersonBlock2 {
    
    Person *person;
    
    
    [self foo:person];
    
    // Person
    
}

- (void)foo:(Person *)person {
    person = [[Teacher alloc] init];
    
    
}


@end
