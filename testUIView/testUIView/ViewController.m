//
//  ViewController.m
//  testUIView
//
//  Created by Yuchen Wang on 2021/2/17.
//

#import "ViewController.h"
#import "TestViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(100, 100, 100, 100);
    btn.backgroundColor = [UIColor colorWithRed:0.489 green:0.548 blue:0.898 alpha:1.000];
    [btn setTitle:@"push" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(pushTestViewVC:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:btn];
}
- (void)pushTestViewVC:(UIButton *)sender{
    TestViewController *vc = [[TestViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
    
}


@end
