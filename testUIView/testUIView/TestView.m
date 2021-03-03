//
//  TestView.m
//  testUIView
//
//  Created by Yuchen Wang on 2021/2/17.
//

#import "TestView.h"


@interface TestView (){
    NSInteger count;
}
@end

@implementation TestView
- (instancetype)init{
    self = [super init];
    if (self) {
        
        count = 0;
        
    }
    return self;
}
- (void)layoutSubviews{
    [super layoutSubviews];
    count++;
    NSLog(@"%@ ==> %ld",NSStringFromSelector(_cmd),count);
}
- (void)didAddSubview:(UIView *)subview{
    [super didAddSubview:subview];
    count++;
    NSLog(@"%@ ==> %ld",NSStringFromSelector(_cmd),count);
}
- (void)willRemoveSubview:(UIView *)subview{
    [super willRemoveSubview:subview];
    count++;
    NSLog(@"%@ ==> %ld",NSStringFromSelector(_cmd),count);
}
- (void)willMoveToSuperview:(nullable UIView *)newSuperview{
    [super willMoveToSuperview:newSuperview];
    count++;
    NSLog(@"%@ ==> %ld",NSStringFromSelector(_cmd),count);
}
- (void)didMoveToSuperview{
    [super didMoveToSuperview];
    count++;
    NSLog(@"%@ ==> %ld",NSStringFromSelector(_cmd),count);
}
- (void)willMoveToWindow:(nullable UIWindow *)newWindow{
    [super willMoveToWindow:newWindow];
    count++;
    NSLog(@"%@ ==> %ld",NSStringFromSelector(_cmd),count);
}
- (void)didMoveToWindow{
    [super didMoveToWindow];
    count++;
    NSLog(@"%@ ==> %ld",NSStringFromSelector(_cmd),count);
}
- (void)removeFromSuperview{
    [super removeFromSuperview];
    count++;
    NSLog(@"%@ ==> %ld",NSStringFromSelector(_cmd),count);
}
- (void)dealloc{
    count++;
    NSLog(@"%@ ==> %ld",NSStringFromSelector(_cmd),count);
}
@end
