//
//  GithubBaseRequestEntity.h
//  sb
//
//  Created by Slava Podosokorskiy on 10/24/19.
//  Copyright © 2019 com. All rights reserved.
//

#import "SerializableEntity.h"

NS_ASSUME_NONNULL_BEGIN

@class GithubBaseResponseEntity;

typedef NS_ENUM(NSUInteger, GithubRequestMethod) {
    GithubRequestMethodGET
};

@interface GithubBaseRequestEntity : SerializableEntity
// @virtual:
- (NSString *)pathParameters;

// @abstract:
+ (Class)responseClass;
+ (GithubRequestMethod)requestMethod;
- (NSString *)path;
@end

NS_ASSUME_NONNULL_END
