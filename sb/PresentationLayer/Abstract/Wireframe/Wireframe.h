//
//  Wireframe.h
//  sb
//
//  Created by Slava Podosokorskiy on 10/25/19.
//  Copyright © 2019 com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class RepositoriesViewController;
@class RepositoryInfoViewController;
@class CommitsViewController;


@interface Wireframe : NSObject
+ (instancetype)sharedInstance;

- (RepositoriesViewController *)createRepositoriesViewController;
- (RepositoryInfoViewController *)createRepositoryInfoViewController;
- (CommitsViewController *)createCommitsViewController;
@end

NS_ASSUME_NONNULL_END
