//
//  ShadowView.m
//  testLayer
//
//  Created by Yuchen Wang on 2021/2/28.
//

#import "ShadowView.h"

@interface ShadowView()
@property(nonatomic, strong) UIImageView *imageView;
@end

@implementation ShadowView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {

        UIImage *image = [UIImage imageNamed:@"lina_full.png"];
        self.imageView = [[UIImageView alloc] initWithImage:image];
        
        [self addSubview:self.imageView];
//        [self ImageViewShadowWithoutPath];
        [self ImageViewShadowWithPath];
    }
    return self;
}

- (void)ImageViewShadowWithoutPath {
    // 设置阴影颜色
    self.imageView.layer.shadowColor = [UIColor orangeColor].CGColor;
    // 设置阴影的偏移量，默认是（0， -3）
//    self.imageView.layer.shadowOffset = CGSizeMake(4, 4);
    // 设置阴影不透明度，默认是0
    self.imageView.layer.shadowOpacity = 0.8;
    // 设置阴影的半径，默认是3
    self.imageView.layer.shadowRadius = 4;
}

- (void)ImageViewShadowWithPath {
    _imageView.layer.shadowColor = [UIColor yellowColor].CGColor;//shadowColor阴影颜色
    _imageView.layer.shadowOffset = CGSizeMake(0,0);//shadowOffset阴影偏移，默认(0, -3),这个跟shadowRadius配合使用
    _imageView.layer.shadowOpacity = 1;//阴影透明度，默认0
    _imageView.layer.shadowRadius = 3;//阴影半径，默认3
    
    //路径阴影
    UIBezierPath *path = [UIBezierPath bezierPath];
    
    float width = _imageView.bounds.size.width;
    float height = _imageView.bounds.size.height;
    float x = _imageView.bounds.origin.x;
    float y = _imageView.bounds.origin.y;
    float addWH = 10;
    
    CGPoint topLeft      = _imageView.bounds.origin;
    CGPoint topMiddle = CGPointMake(x+(width/2),y-addWH);
    CGPoint topRight     = CGPointMake(x+width,y);
    
    CGPoint rightMiddle = CGPointMake(x+width+addWH,y+(height/2));
    
    CGPoint bottomRight  = CGPointMake(x+width,y+height);
    CGPoint bottomMiddle = CGPointMake(x+(width/2),y+height+addWH);
    CGPoint bottomLeft   = CGPointMake(x,y+height);
    
    
    CGPoint leftMiddle = CGPointMake(x-addWH,y+(height/2));
    
    [path moveToPoint:topLeft];
    //添加四个二元曲线
    [path addQuadCurveToPoint:topRight
                 controlPoint:topMiddle];
    [path addQuadCurveToPoint:bottomRight
                 controlPoint:rightMiddle];
    [path addQuadCurveToPoint:bottomLeft
                 controlPoint:bottomMiddle];
    [path addQuadCurveToPoint:topLeft
                 controlPoint:leftMiddle];
    //设置阴影路径
    _imageView.layer.shadowPath = path.CGPath;
}

@end
