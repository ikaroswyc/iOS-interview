//
//  Person.m
//  testKVC
//
//  Created by Yuchen Wang on 2021/1/18.
//

#import "Person.h"

@interface Person()

@property (nonatomic, strong, readwrite) NSString *name;

@end

@implementation Person

+ (BOOL)accessInstanceVariablesDirectly {
    return NO;
}

- (void)abc {
    _name = @"xxxxx";
}

@end
