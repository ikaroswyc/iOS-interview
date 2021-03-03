//
//  ViewController.m
//  testLayer
//
//  Created by Yuchen Wang on 2021/2/25.
//

#import "ViewController.h"
#import "PenView.h"
#import "ShadowView.h"

#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

@interface ViewController ()


@property (nonatomic, strong) PenView *penView;
@property (nonatomic, strong) ShadowView *shadowView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
//    [self.view addSubview:self.penView];
    
    self.shadowView = [[ShadowView alloc] initWithFrame:CGRectMake(100, 100, 60, 60)];
    [self.view addSubview:self.shadowView];
}

- (PenView *)penView {
    if (!_penView) {
        
       
        _penView = [[PenView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-64-40)];
        _penView.backgroundColor = [UIColor clearColor];
    }
    
    return _penView;
}



@end
