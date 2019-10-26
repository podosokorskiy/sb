//
//  SessionUser.m
//  sb
//
//  Created by Slava Podosokorskiy on 10/25/19.
//  Copyright © 2019 com. All rights reserved.
//

#import "SessionUser.h"

NS_ASSUME_NONNULL_BEGIN

@implementation SessionUser
- (instancetype)initWithAuthorization:(NSString *)authorization {
    self = [super init];
    
    if (self) {
        _authorization = authorization;
    }
    
    return self;
}
@end

NS_ASSUME_NONNULL_END
