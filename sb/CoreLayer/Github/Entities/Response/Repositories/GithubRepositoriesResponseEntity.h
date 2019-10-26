//
//  GithubRepositoriesResponseEntity.h
//  sb
//
//  Created by Slava Podosokorskiy on 10/24/19.
//  Copyright © 2019 com. All rights reserved.
//

#import "GithubBaseResponseEntity.h"

NS_ASSUME_NONNULL_BEGIN

@class GithubRepositoryEntity;

@interface GithubRepositoriesResponseEntity : GithubBaseResponseEntity
@property (nonatomic, strong) NSArray<GithubRepositoryEntity *> *repositories;
@end

NS_ASSUME_NONNULL_END
