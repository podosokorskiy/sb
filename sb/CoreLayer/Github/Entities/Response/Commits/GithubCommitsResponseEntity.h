//
//  GithubCommitsResponseEntity.h
//  sb
//
//  Created by Slava Podosokorskiy on 10/24/19.
//  Copyright © 2019 com. All rights reserved.
//

#import "GithubBaseResponseEntity.h"

NS_ASSUME_NONNULL_BEGIN

@class GithubCommitEntity;

@interface GithubCommitsResponseEntity : GithubBaseResponseEntity
@property (nonatomic, strong) NSArray<GithubCommitEntity *> *commits;
@end

NS_ASSUME_NONNULL_END
