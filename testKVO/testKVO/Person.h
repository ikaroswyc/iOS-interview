//
//  Person.h
//  testKVO
//
//  Created by Yuchen Wang on 2021/1/19.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Person : NSObject

@property (nonatomic, strong) NSString *name;

- (void)testName;

@end

NS_ASSUME_NONNULL_END
