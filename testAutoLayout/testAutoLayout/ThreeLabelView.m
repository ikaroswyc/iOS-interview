//
//  ThreeLabelView.m
//  testAutoLayout
//
//  Created by Yuchen Wang on 2021/2/27.
//

#import "ThreeLabelView.h"
#import "Masonry.h"
@interface ThreeLabelView()

@property(nonatomic, strong) UILabel *label1;
@property(nonatomic, strong) UILabel *label2;
@property(nonatomic, strong) UILabel *label3;
@property(nonatomic, strong) UIButton *leftButton;
@end

@implementation ThreeLabelView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self setupMyViews];
    }
    return self;
}

//-(instancetype)init
//{
//    self = [super init];
//    if (self)
//    {
//        [self setupMyViews];
//    }
//    return self;
//}

- (void)setupMyViews {
    
    [self addSubview:self.leftButton];
    
    self.label1 = [[UILabel alloc] init];
    self.label1.text = @"aa";
    self.label1.textColor = [UIColor blackColor];
    [self.label1 setContentHuggingPriority:UILayoutPriorityDefaultHigh forAxis:UILayoutConstraintAxisHorizontal];
    [self addSubview:self.label1];
    self.label2 = [[UILabel alloc] init];
    self.label2.text = @"aaaaa";
    self.label2.textColor = [UIColor blackColor];
    [self.label2 setContentCompressionResistancePriority:UILayoutPriorityDefaultLow forAxis:UILayoutConstraintAxisHorizontal];
    [self addSubview:self.label2];
    self.label3 = [[UILabel alloc] init];
    self.label3.text = @"aaa";
    self.label3.textColor = [UIColor blackColor];
    
    [self.label3 setContentCompressionResistancePriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisHorizontal];

    [self addSubview:self.label3];
    
    [self label1Constraint];
    [self label3Constraint];
    [self label2Constraint];

   
    
    
    [self.leftButton mas_makeConstraints:^(MASConstraintMaker *make) {

        make.top.mas_equalTo(700);
        make.width.mas_equalTo(40);
        make.height.mas_equalTo(20);
        make.left.mas_equalTo(50);

    }];
    
    
}

- (void)label1Constraint {
    [self.label1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.left.mas_equalTo(10);
    }];
}

- (void)label2Constraint {

    [self.label2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.label1);
        make.left.equalTo(self.label1.mas_right).offset(10);
        make.right.equalTo(self.label3.mas_left).offset(-10);
    }];

}

- (void)label3Constraint {
    [self.label3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.label1);
        make.left.equalTo(self.label2.mas_right).offset(10);
        make.right.equalTo(self).offset(-10);
    }];
}

//
-(void)add{
    NSString * sOne = self.label1.text;
    self.label1.text = [NSString stringWithFormat:@"%@%@",sOne,sOne];
    
    NSString * sTwo = self.label2.text;
    self.label2.text = [NSString stringWithFormat:@"%@%@",sTwo,sTwo];
    
    NSString * sThree = self.label3.text;
    self.label3.text = [NSString stringWithFormat:@"%@%@",sThree,sThree];
    
    
}

-(UIButton*)leftButton
{
    if (!_leftButton)
    {
        _leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_leftButton setBackgroundColor:[UIColor orangeColor]];
        [_leftButton setTitle:@"增加" forState:UIControlStateNormal];
        [_leftButton addTarget:self action:@selector(add) forControlEvents:UIControlEventTouchUpInside];
    }
    return _leftButton;
}
@end
