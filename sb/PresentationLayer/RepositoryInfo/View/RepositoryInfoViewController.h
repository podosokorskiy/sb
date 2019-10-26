//
//  RepositoryInfoViewController.h
//  sb
//
//  Created by Slava Podosokorskiy on 10/24/19.
//  Copyright © 2019 com. All rights reserved.
//

#import "AbstractViewController.h"
#import "RepositoryInfoViewInput.h"
#import "GithubRepositoryEntity.h"


NS_ASSUME_NONNULL_BEGIN

@class GithubRepositoryEntity;
@protocol RepositoryInfoViewOutput;

@interface RepositoryInfoViewController : AbstractViewController<RepositoryInfoViewInput>
@property (nonatomic, strong) id<RepositoryInfoViewOutput> output;

@property (nonatomic, strong) GithubRepositoryEntity *repository;
@end

NS_ASSUME_NONNULL_END
