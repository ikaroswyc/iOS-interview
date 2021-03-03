//
//  ViewController.m
//  testKVO
//
//  Created by Yuchen Wang on 2021/1/19.
//

#import "ViewController.h"
#import "Person.h"

@interface ViewController ()

@property (nonatomic, strong) Person *person;

@end

@implementation ViewController

- (void)dealloc {
    [self.person removeObserver:self forKeyPath:@"name"];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.person = [[Person alloc] init];
    [self.person addObserver:self forKeyPath:@"name" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:nil];
    self.person.name = @"ddd";
//    [self willChangeValueForKey:@"name"];
    [self.person testName];
//    [self willChangeValueForKey:@"name"];
    
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    
    
    if ([keyPath isEqualToString:@"name"]) {
        NSLog(@"%@", change);
    }
    
    if ([keyPath isEqualToString:@"_name"]) {
        NSLog(@"%@", change);
    }
    
}



@end
