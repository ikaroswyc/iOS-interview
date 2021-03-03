//
//  Person.m
//  testRuntime
//
//  Created by Yuchen Wang on 2021/1/26.
//

#import "Person.h"
#import "Teacher.h"
@implementation Person

- (void)sayHello {
    NSLog(@"hello");
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
    
    if (aSelector == @selector(sayNB)) {
        NSMethodSignature *sig = [NSMethodSignature signatureWithObjCTypes:"v@:"];
        
        NSLog(@"frameLength: %d", sig.frameLength);
        NSLog(@"numberOfArguments: %d", sig.numberOfArguments);
        NSLog(@"methodReturnLength: %d",sig.methodReturnLength);
        NSLog(@"methodReturnType: %s",sig.methodReturnType);
        
        
        
        return sig;
    }
    
    return [super methodSignatureForSelector:aSelector];
}

- (void)forwardInvocation:(NSInvocation *)anInvocation {
    SEL selector = [anInvocation selector];
    
    Teacher *teacher = [[Teacher alloc] init];

    if ([teacher respondsToSelector:selector]) {
        [anInvocation invokeWithTarget:teacher];
    }else {
        [super forwardInvocation:anInvocation];
    }
}
@end
