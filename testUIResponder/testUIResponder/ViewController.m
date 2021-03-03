//
//  ViewController.m
//  testUIResponder
//
//  Created by Yuchen Wang on 2021/2/25.
//

#import "ViewController.h"
#import "ViewA.h"
#import "ViewB.h"
#import "ViewC.h"
#import "ViewD.h"
#import "ViewE.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    ViewA *AView = [[ViewA alloc] initWithFrame:CGRectMake(10, 10, 350, 800)];
    AView.backgroundColor = [UIColor blackColor];
    [self.view addSubview:AView];
    
    ViewB *BView = [[ViewB alloc] initWithFrame:CGRectMake(40, 40, 200, 300)];
    BView.backgroundColor = [UIColor whiteColor];
    [AView addSubview:BView];
 
    ViewC *CView = [[ViewC alloc] initWithFrame:CGRectMake(40, 400, 200, 300)];
    CView.backgroundColor = [UIColor whiteColor];
    [AView addSubview:CView];
    
    ViewD *DView = [[ViewD alloc] initWithFrame:CGRectMake(180, 60, 100, 100)];
    DView.backgroundColor = [UIColor redColor];
    [BView addSubview:DView];
    
    ViewE *EView = [[ViewE alloc] initWithFrame:CGRectMake(60, 60, 100, 100)];
    EView.backgroundColor = [UIColor redColor];
    [CView addSubview:EView];
    
}


@end
