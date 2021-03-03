//
//  ViewController.m
//  testAutoLayout
//
//  Created by Yuchen Wang on 2021/2/27.
//

#import "ViewController.h"
#import "imageAndLabelView.h"
#import "ThreeLabelView.h"
#import <UIKit/UIKit.h>
@interface ViewController ()
@property(nonatomic, strong) imageAndLabelView *imageAndLabelView;
@property(nonatomic, strong) ThreeLabelView *threeLabelView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.imageAndLabelView = [[imageAndLabelView alloc]init];
//    self.imageAndLabelView.frame = self.view.bounds;
//    [self.view addSubview:self.imageAndLabelView];
    
    self.threeLabelView = [[ThreeLabelView alloc] init];
    self.threeLabelView.frame = self.view.bounds;
    [self.view addSubview:self.threeLabelView];
    
}

@end
