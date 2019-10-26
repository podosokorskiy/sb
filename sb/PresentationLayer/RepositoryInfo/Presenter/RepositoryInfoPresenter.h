//
//  RepositoryInfoPresenter.h
//  sb
//
//  Created by Slava Podosokorskiy on 10/24/19.
//  Copyright © 2019 com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RepositoryInfoViewOutput.h"
#import "RepositoryInfoModelOutput.h"


NS_ASSUME_NONNULL_BEGIN

@class GithubRepositoryEntity;
@protocol RepositoryInfoModelInput;
@protocol RepositoryInfoViewInput;

@interface RepositoryInfoPresenter : NSObject<RepositoryInfoViewOutput, RepositoryInfoModelOutput>
- (instancetype)initWithView:(id<RepositoryInfoViewInput>)view repository:(GithubRepositoryEntity *)repository;

@property (nonatomic, weak) id<RepositoryInfoViewInput> view;
@property (nonatomic, strong) id<RepositoryInfoModelInput> model;
@end

NS_ASSUME_NONNULL_END
