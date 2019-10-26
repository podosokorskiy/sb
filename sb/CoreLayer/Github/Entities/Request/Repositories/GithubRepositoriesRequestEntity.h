//
//  GithubRepositoriesRequestEntity.h
//  sb
//
//  Created by Slava Podosokorskiy on 10/24/19.
//  Copyright © 2019 com. All rights reserved.
//

#import "GithubBaseRequestEntity.h"

NS_ASSUME_NONNULL_BEGIN

@interface GithubRepositoriesRequestEntity : GithubBaseRequestEntity
- (instancetype)initWithPage:(NSUInteger)page;
@end

NS_ASSUME_NONNULL_END
