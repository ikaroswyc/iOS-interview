//
//  PenView.m
//  testLayer
//
//  Created by Yuchen Wang on 2021/2/25.
//

#import "PenView.h"

#import <sys/sysctl.h>

#import <mach/mach.h>
@interface PenView()

@property (nonatomic, strong) UIBezierPath *path;
@property (nonatomic, strong) NSMutableArray *lineArray;
@property (nonatomic, strong) NSMutableArray *colorArray;
@property (nonatomic, strong) CAShapeLayer *sLayer;
@end

@implementation PenView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

#pragma mark - Life Cycle
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.lineWidth = 5;
        self.lineColor = [UIColor blackColor];
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(10, 10, 100, 100)];
        button.backgroundColor = [UIColor redColor];
        [self addSubview:button];
//        [button addTarget:self action:@selector(touchesBegan:withEvent:) forControlEvents:UIControlEventTouchUpInside];
        [button sendActionsForControlEvents:UIControlEventTouchUpInside];

        
    }
    return self;
}

- (void)reset {
    [self.lineArray removeAllObjects];
    [self.colorArray removeAllObjects];
    [self setNeedsDisplay];
}

- (void)back {
    if (self.lineArray.count > 0) {
        [self.lineArray removeLastObject];
        [self.colorArray removeLastObject];
        [self setNeedsDisplay];
    }
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    self.path = [UIBezierPath bezierPath];
    [self.path moveToPoint:[touch locationInView:self]];
    
    CAShapeLayer *layer = [CAShapeLayer layer];
    layer.lineWidth = self.lineWidth;
    layer.strokeStart = 0;
    layer.strokeEnd = 1;
    layer.lineCap = kCALineCapRound;
    layer.lineJoin = kCALineJoinRound;
    layer.strokeColor = self.lineColor.CGColor;
    layer.fillColor = [UIColor clearColor].CGColor;
    layer.path = self.path.CGPath;
    [self.layer addSublayer:layer];
    _sLayer = layer;
   
    static int touchesCount = 0;
    NSLog(@"touchesCount: %d", touchesCount++);
    [self memoryUsage];
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    

        UITouch *touch = [touches anyObject];
        [self.path addLineToPoint:[touch locationInView:self]];
    //    [self setNeedsDisplay];
        
        
        _sLayer.path = self.path.CGPath;
    
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    UITouch *touch = [touches anyObject];
//    [self.path addLineToPoint:[touch locationInView:self]];
//    [self setNeedsDisplay];
    [self.lineArray addObject:self.path];
    [self.colorArray addObject:self.lineColor];
    self.path = nil;
}


- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesCancelled:touches withEvent:event];
}

//- (void)drawRect:(CGRect)rect {
//    for (NSInteger i = 0; i < self.lineArray.count; i++) {
//        UIColor *color = self.colorArray[i];
//        [color setStroke];
//        UIBezierPath *path = self.lineArray[i];
//        path.lineCapStyle = kCGLineCapRound;
//        [path stroke];
//    }
//    [self.lineColor setStroke];
//    self.path.lineCapStyle = kCGLineCapRound;
//    [self.path stroke];
//}

- (NSMutableArray *)lineArray {
    if (!_lineArray) {
        _lineArray = [[NSMutableArray alloc]init];
    }
    return _lineArray;
}

- (NSMutableArray *)colorArray {
    if (!_colorArray) {
        _colorArray = [[NSMutableArray alloc]init];
    }
    return _colorArray;
}


// 当前任务占用内存
- (int64_t)memoryUsage {
    int64_t memoryUsageInByte = 0;
    task_vm_info_data_t vmInfo;
    mach_msg_type_number_t count = TASK_VM_INFO_COUNT;
    kern_return_t kernelReturn = task_info(mach_task_self(), TASK_VM_INFO, (task_info_t) &vmInfo, &count);
    if(kernelReturn == KERN_SUCCESS) {
        memoryUsageInByte = (int64_t) vmInfo.phys_footprint;
        double memInMB = memoryUsageInByte * 1.0 / 1024.0 / 1024.0;
        NSLog(@"Memory in use (in bytes): %f", memInMB);
    } else {
        NSLog(@"Error with task_info(): %s", mach_error_string(kernelReturn));
    }
    return memoryUsageInByte;
}




@end
