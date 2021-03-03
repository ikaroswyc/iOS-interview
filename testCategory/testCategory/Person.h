//
//  Person.h
//  testCategory
//
//  Created by Yuchen Wang on 2021/1/28.
//

#import <Foundation/Foundation.h>
#import "SuperPerson.h"
NS_ASSUME_NONNULL_BEGIN

@interface Person : SuperPerson

- (void)sayHello;

+ (void)sayGood;
@end

NS_ASSUME_NONNULL_END
