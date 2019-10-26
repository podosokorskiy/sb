//
//  Wireframe.m
//  sb
//
//  Created by Slava Podosokorskiy on 10/25/19.
//  Copyright © 2019 com. All rights reserved.
//

#import "Wireframe.h"

#import "RepositoriesViewController.h"
#import "RepositoryInfoViewController.h"
#import "CommitsViewController.h"


NS_ASSUME_NONNULL_BEGIN

@implementation Wireframe
+ (instancetype)sharedInstance {
    static dispatch_once_t pred;
    
    static Wireframe *sharedInstance = nil;
    dispatch_once(&pred, ^{
        sharedInstance = [[Wireframe alloc] init];
    });
    
    return sharedInstance;
}


- (RepositoriesViewController *)createRepositoriesViewController {
    return (RepositoriesViewController *)[self viewControllerWithStoryboardName:@"Repositories"];
}


- (RepositoryInfoViewController *)createRepositoryInfoViewController {
    return (RepositoryInfoViewController *)[self viewControllerWithStoryboardName:@"RepositoryInfo"];
}


- (CommitsViewController *)createCommitsViewController {
    return (CommitsViewController *)[self viewControllerWithStoryboardName:@"Commits"];
}


#pragma mark - Private
- (UIViewController *)viewControllerWithStoryboardName:(NSString *)storyboardName {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:storyboardName bundle:[NSBundle mainBundle]];
    UIViewController *viewController = [storyboard instantiateInitialViewController];
    
    return viewController;
}
@end

NS_ASSUME_NONNULL_END
