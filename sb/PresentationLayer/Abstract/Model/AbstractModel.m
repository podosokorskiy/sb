//
//  AbstractModel.m
//  sb
//
//  Created by Slava Podosokorskiy on 10/25/19.
//  Copyright © 2019 com. All rights reserved.
//

#import "AbstractModel.h"

#import "GithubRequestService.h"
#import "RemoteRequestService.h"


NS_ASSUME_NONNULL_BEGIN

@interface AbstractModel()
@end

@implementation AbstractModel
- (instancetype)init {
    self = [super init];
    if (self) {
        _remoteRequestService = [[RemoteRequestService alloc] init];
        _githubRequestService = [[GithubRequestService alloc] initWithRemoteRequestService:_remoteRequestService];
    }
    return self;
}
@end

NS_ASSUME_NONNULL_END
