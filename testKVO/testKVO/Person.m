//
//  Person.m
//  testKVO
//
//  Created by Yuchen Wang on 2021/1/19.
//

#import "Person.h"

@implementation Person

- (void)setName:(NSString *)name {
    _name = name;
}

- (void)testName {
    [self willChangeValueForKey:@"name"];
    _name =  @"xxx";
    [self didChangeValueForKey:@"name"];
}


@end
