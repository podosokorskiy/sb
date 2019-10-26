//
//  SessionHolder.h
//  sb
//
//  Created by Slava Podosokorskiy on 10/25/19.
//  Copyright © 2019 com. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class SessionUser;

@interface SessionHolder : NSObject
+ (instancetype)sharedInstance;

/**
 Current authorized user (null equals not authorized)
 */
- (nullable SessionUser *)authorizedSessionUser;

/**
 Perform authorization
 */
- (BOOL)authorizeWithLogin:(NSString *)login password:(NSString *)password error:(NSError **)error;

/**
 Deauthorize current user
 */
- (BOOL)deauthorizeWithError:(NSError **)error;
@end

NS_ASSUME_NONNULL_END
