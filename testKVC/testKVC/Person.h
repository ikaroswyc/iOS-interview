//
//  Person.h
//  testKVC
//
//  Created by Yuchen Wang on 2021/1/18.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Person : NSObject

@property (nonatomic, strong, readonly) NSString *name;

@end

NS_ASSUME_NONNULL_END
