//
//  Person+Private.h
//  testKVC
//
//  Created by Yuchen Wang on 2021/1/18.
//

#import "Person.h"

NS_ASSUME_NONNULL_BEGIN

@interface Person (Private)

@property (nonatomic, copy) NSString *text;

@end

NS_ASSUME_NONNULL_END
