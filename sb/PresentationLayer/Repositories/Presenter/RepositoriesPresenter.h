//
//  RepositoriesPresenter.h
//  sb
//
//  Created by Slava Podosokorskiy on 10/24/19.
//  Copyright © 2019 com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RepositoriesViewOutput.h"
#import "RepositoriesModelOutput.h"


NS_ASSUME_NONNULL_BEGIN

@class GithubRepositoriesResponseEntity;
@protocol RepositoriesModelInput;
@protocol RepositoriesViewInput;

@interface RepositoriesPresenter : NSObject<RepositoriesViewOutput, RepositoriesModelOutput>
- (instancetype)initWithView:(id<RepositoriesViewInput>)view repositories:(GithubRepositoriesResponseEntity *)repositories;

@property (nonatomic, weak) id<RepositoriesViewInput> view;
@property (nonatomic, strong) id<RepositoriesModelInput> model;
@end

NS_ASSUME_NONNULL_END
