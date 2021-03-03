//
//  PenView.h
//  testLayer
//
//  Created by Yuchen Wang on 2021/2/25.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface PenView : UIView

@property (nonatomic, assign) NSInteger lineWidth;
@property (nonatomic, strong) UIColor *lineColor;

- (void)reset;
- (void)back;


@end

NS_ASSUME_NONNULL_END
