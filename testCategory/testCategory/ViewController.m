//
//  ViewController.m
//  testCategory
//
//  Created by Yuchen Wang on 2021/1/28.
//

#import "ViewController.h"
#import "Person.h"
@interface ViewController ()

@end

@implementation ViewController

+ (void)load {
    
}

+ (void)initialize {
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    Person *person = [[Person alloc] init];
    
    [person sayHello];
    
//    [Person sayGood];
    

}


@end
