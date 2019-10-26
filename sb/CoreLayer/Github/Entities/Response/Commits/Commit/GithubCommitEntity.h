//
//  GithubCommitEntity.h
//  sb
//
//  Created by Slava Podosokorskiy on 10/24/19.
//  Copyright © 2019 com. All rights reserved.
//

#import "SerializableEntity.h"

NS_ASSUME_NONNULL_BEGIN

@interface GithubCommitEntity : SerializableEntity
@property (nonatomic, strong) NSString *commitHash;
@property (nonatomic, strong) NSString *author;
@property (nonatomic, strong) NSString *message;
@property (nonatomic, strong) NSDate *date;
@end

NS_ASSUME_NONNULL_END
