//
//  RepositoriesViewController.h
//  sb
//
//  Created by Slava Podosokorskiy on 10/24/19.
//  Copyright © 2019 com. All rights reserved.
//

#import "AbstractViewController.h"
#import "RepositoriesViewInput.h"


NS_ASSUME_NONNULL_BEGIN

@protocol RepositoriesViewOutput;
@class GithubRepositoriesResponseEntity;

@interface RepositoriesViewController : AbstractViewController<RepositoriesViewInput>
@property (nonatomic, strong) id<RepositoriesViewOutput> output;

@property (nonatomic, strong) GithubRepositoriesResponseEntity *repositories;
@end

NS_ASSUME_NONNULL_END
