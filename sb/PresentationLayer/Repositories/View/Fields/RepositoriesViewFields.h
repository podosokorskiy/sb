//
//  RepositoriesViewFields.h
//  sb
//
//  Created by Slava Podosokorskiy on 10/26/19.
//  Copyright © 2019 com. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class GithubRepositoriesResponseEntity;

@interface RepositoriesViewFields : NSObject
@property (nonatomic, strong) GithubRepositoriesResponseEntity *repositories;
@property (nonatomic, assign) BOOL prevPageAvailable;
@property (nonatomic, assign) BOOL nextPageAvailable;
@end

NS_ASSUME_NONNULL_END
