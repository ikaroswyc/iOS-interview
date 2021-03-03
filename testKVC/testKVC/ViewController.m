//
//  ViewController.m
//  testKVC
//
//  Created by Yuchen Wang on 2021/1/18.
//

#import "ViewController.h"
#import "Person.h"
#import "Person+Private.h"
#import <UIKit/UIKit.h>
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    Person *person = [[Person alloc] init];
//    person.name = @"oo";
    NSLog(@"person.name: %@", person.name);
    
    [person setValue:@"xx" forKey:@"name"];
    
    NSLog(@"person.name: %@", person.name);
    person.text = @"11";
    
    
    NSLog(@"person.text: %@", person.text);
    [person setValue:@"22" forKey:@"text"];
    NSLog(@"person.text: %@", person.text);
    
    UITextField *textfield = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    textfield.placeholder = @"test";
    [textfield setValue:[UIColor redColor] forKeyPath:@"placeholderLabel.textColor"];
    
}


@end
