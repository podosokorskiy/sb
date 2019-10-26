//
//  AbstractModel.h
//  sb
//
//  Created by Slava Podosokorskiy on 10/25/19.
//  Copyright © 2019 com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SessionHolder.h"

NS_ASSUME_NONNULL_BEGIN

@class RemoteRequestService;
@class GithubRequestService;

@interface AbstractModel : NSObject
@property (nonatomic, strong) RemoteRequestService *remoteRequestService;
@property (nonatomic, strong) GithubRequestService *githubRequestService;
@end

NS_ASSUME_NONNULL_END
