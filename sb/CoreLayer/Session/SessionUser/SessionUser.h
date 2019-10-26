//
//  SessionUser.h
//  sb
//
//  Created by Slava Podosokorskiy on 10/25/19.
//  Copyright © 2019 com. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SessionUser : NSObject
@property (nonatomic, strong) NSString *authorization;

- (instancetype)init NS_UNAVAILABLE;
- (instancetype)initWithAuthorization:(NSString *)authorization NS_DESIGNATED_INITIALIZER;
@end

NS_ASSUME_NONNULL_END
