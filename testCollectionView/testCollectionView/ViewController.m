//
//  ViewController.m
//  testCollectionView
//
//  Created by Yuchen Wang on 2021/3/2.
//

#import "ViewController.h"

static NSString * const cellID = @"cellID";

@interface ViewController ()<UICollectionViewDataSource>

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 创建布局
    UICollectionViewFlowLayout * layout = [[UICollectionViewFlowLayout alloc]init];
    layout.itemSize = CGSizeMake(50, 50);
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;

    // 创建collectionView
    CGFloat collectionViewW = self.view.frame.size.width;
    CGFloat collectionViewH = 200;
    UICollectionView * collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 100, collectionViewW, collectionViewH) collectionViewLayout:layout];
    collectionView.backgroundColor = [UIColor blackColor];
    collectionView.dataSource = self;
    [self.view addSubview:collectionView];
    
    // 注册
    [collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:cellID];
}


#pragma mark - <UICollectionViewDataSource>
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 2;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    UICollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellID forIndexPath:indexPath];
    
    // 设置圆角
    cell.layer.cornerRadius = 5.0;
    cell.layer.masksToBounds = YES;
    cell.backgroundColor = [UIColor redColor];
    

    return cell;
}

@end

