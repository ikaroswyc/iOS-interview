//
//  Person+Private.m
//  testKVC
//
//  Created by Yuchen Wang on 2021/1/18.
//

#import "Person+Private.h"
#import <objc/runtime.h>

static char kTextKey;

@implementation Person (Private)

- (void)setText:(NSString *)text {
    objc_setAssociatedObject(self, &kTextKey, text, OBJC_ASSOCIATION_COPY);
}

- (NSString *)text {
    
    return objc_getAssociatedObject(self, &kTextKey);
}


@end
