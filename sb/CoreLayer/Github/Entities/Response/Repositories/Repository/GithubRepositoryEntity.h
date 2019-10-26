//
//  GithubRepositoryEntity.h
//  sb
//
//  Created by Slava Podosokorskiy on 10/24/19.
//  Copyright © 2019 com. All rights reserved.
//

#import "SerializableEntity.h"

NS_ASSUME_NONNULL_BEGIN

@class GithubRepositoryAuthorEntity;

@interface GithubRepositoryEntity : SerializableEntity
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong, nullable) NSString *repoDescription;
@property (nonatomic, strong) GithubRepositoryAuthorEntity *author;
@property (nonatomic, assign) NSUInteger forks;
@property (nonatomic, assign) NSUInteger watchers;
@end

NS_ASSUME_NONNULL_END
