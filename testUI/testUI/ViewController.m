//
//  ViewController.m
//  testUI
//
//  Created by Yuchen Wang on 2021/2/20.
//

#import "ViewController.h"
#import "TestObject.h"
@interface ViewController ()
@property (nonatomic, strong) CALayer *subLayer;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    
//    [self image];
//    [self testBanyu];
//    [self testFrameandBounds];
    [self testLayerAnimation];
}

// 切圆角
- (void)image {
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    imageView.center = CGPointMake(200, 300);
    UIImage *anotherImage = [UIImage imageNamed:@"lina_full"];
    UIGraphicsBeginImageContextWithOptions(imageView.bounds.size, NO, 1.0);
    [[UIBezierPath bezierPathWithRoundedRect:imageView.bounds
                           cornerRadius:50] addClip];
    [anotherImage drawInRect:imageView.bounds];
    imageView.image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    [self.view addSubview:imageView];
}


- (void)testBanyu {
    TestObject *object1 = [[TestObject alloc] init];
    __block TestObject *object2 = [[TestObject alloc] init];
    object1.name = @"Mike";
    object2.name = @"Sean";
    __block int vi = 1;

    void (^handler)(NSString *) = ^(NSString *name) {
        object1.name = name;
        object2.name = name;
        vi = 2;
    };
    handler(@"Lucy");

    NSLog(object1.name);
    NSLog(object2.name);
    NSLog(@"%i", vi);
}

- (void)testFrameandBounds {
    //创建红色view
      UIView *redView = [[UIView alloc] initWithFrame:CGRectMake(50, 100, 200, 200)];
      //打印此时的frame
      NSLog(@"log1:%@",NSStringFromCGRect(redView.frame));
      //设置bounds,x,y分别为20，20，宽高为300，300
      redView.bounds = CGRectMake(20, 20, 200, 200);
      //打印设置完bounds后的frame
       NSLog(@"log2:%@",NSStringFromCGRect(redView.frame));
    NSLog(@"log2:%@",NSStringFromCGRect(redView.bounds));
      redView.backgroundColor = [UIColor redColor];
      //把红色view添加到控制器view上
      [self.view addSubview:redView];
     
     //创建紫色view
     UIView *purpleView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 80, 80)];
     purpleView.backgroundColor = [UIColor purpleColor];
     NSLog(@"log3:%@",NSStringFromCGRect(purpleView.frame));
     //把紫色view添加到红色view上
     [redView addSubview:purpleView];
}

// 测试隐式动画
- (void)testLayerAnimation {
    
    self.subLayer = [[CALayer alloc] init];
    self.subLayer.frame = CGRectMake(20, 20, 100, 100);
    self.subLayer.backgroundColor = [UIColor redColor].CGColor;
    [self.view.layer addSublayer:self.subLayer];
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 60, 60)];
    button.backgroundColor = [UIColor blackColor];
    [button addTarget:self action:@selector(handleLayerAnimation) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:button];
}

- (void)handleLayerAnimation {
//    [CATransaction begin];
//    [CATransaction setDisableActions:YES];
    self.subLayer.frame = CGRectMake(40, 40, 150, 150);
//    [CATransaction commit];
}

@end
