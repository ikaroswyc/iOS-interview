//
//  TestViewController.m
//  testUIView
//
//  Created by Yuchen Wang on 2021/2/17.
//

#import "TestViewController.h"
#import "TestView.h"

@interface TestViewController (){
    
    TestView *testView;
}
@end
@implementation TestViewController
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self.navigationController setToolbarHidden:YES animated:animated];
    [self.navigationController setNavigationBarHidden:YES];
}


- (void)viewDidLoad{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithTitle:@"addSubView" style:UIBarButtonItemStylePlain target:self action:@selector(addTestViewSubView)];
    self.navigationItem.rightBarButtonItem = item;
    
    TestView *view = [[TestView alloc] init];
    view.frame = CGRectMake(8, 100, self.view.bounds.size.width - 8*2, 250);
    view.backgroundColor = [UIColor colorWithRed:0.101 green:0.502 blue:0.427 alpha:1.000];
    [self.view addSubview:view];
    testView = view;
    
}
- (void)addTestViewSubView{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(50, 50, 100, 100)];
    view.backgroundColor = [UIColor lightGrayColor];
    view.tag = 100;
    [testView addSubview:view];
    
}
@end
