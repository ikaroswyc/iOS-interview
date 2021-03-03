//
//  Person.m
//  testCategory
//
//  Created by Yuchen Wang on 2021/1/28.
//

#import "Person.h"

@implementation Person

+ (void)load {
    
}

+ (void)initialize {
    
}


- (void)sayHello {
    NSLog(@"hello from Person");
    
    NSLog(@"%@", [super class]);
}

+ (void)sayGood {
    NSLog(@"good from Person");
}

@end
