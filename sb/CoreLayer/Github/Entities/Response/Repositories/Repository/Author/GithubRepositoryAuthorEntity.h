//
//  GithubRepositoryAuthorEntity.h
//  sb
//
//  Created by Slava Podosokorskiy on 10/24/19.
//  Copyright © 2019 com. All rights reserved.
//

#import "SerializableEntity.h"

NS_ASSUME_NONNULL_BEGIN

@interface GithubRepositoryAuthorEntity : SerializableEntity
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong, nullable) NSString *avatarUrl;
@end

NS_ASSUME_NONNULL_END
