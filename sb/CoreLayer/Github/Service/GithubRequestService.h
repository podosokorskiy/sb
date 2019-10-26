//
//  GithubRequestService.h
//  sb
//
//  Created by Slava Podosokorskiy on 10/24/19.
//  Copyright © 2019 com. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class RemoteRequestService;
@class GithubBaseRequestEntity;

extern NSErrorDomain const kGithubRequestServiceErrorDomain;

typedef NS_ENUM(NSInteger, GithubRequestServiceError) {
    GithubRequestServiceErrorInvalidURL,
    GithubRequestServiceErrorBadResponse
};

typedef void (^GithubRequestServiceCompletionBlock)(id _Nullable responseEntity,
                                             NSError * _Nullable error);

@interface GithubRequestService : NSObject
- (instancetype)init NS_UNAVAILABLE;
- (instancetype)initWithRemoteRequestService:(RemoteRequestService *)remoteRequestService NS_DESIGNATED_INITIALIZER;

- (void)requestWithEntity:(GithubBaseRequestEntity *)requestEntity
          completionBlock:(GithubRequestServiceCompletionBlock)completionBlock;
@end

NS_ASSUME_NONNULL_END
