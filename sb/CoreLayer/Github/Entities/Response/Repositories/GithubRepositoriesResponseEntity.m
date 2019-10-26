//
//  GithubRepositoriesResponseEntity.m
//  sb
//
//  Created by Slava Podosokorskiy on 10/24/19.
//  Copyright © 2019 com. All rights reserved.
//

#import "GithubRepositoriesResponseEntity.h"
#import "GithubRepositoryEntity.h"


NS_ASSUME_NONNULL_BEGIN

@implementation GithubRepositoriesResponseEntity
- (instancetype)initWithArray:(NSArray<id> *)array lastPage:(NSUInteger)lastPage error:(NSError * _Nullable __autoreleasing *)error {
    self = [super initWithArray:array lastPage:lastPage error:error];
    
    if (self) {
        NSMutableArray<GithubRepositoryEntity *> *repos = [[NSMutableArray alloc] init];
        
        for (NSDictionary *repo in array) {
            GithubRepositoryEntity *repositoryEntity = [[GithubRepositoryEntity alloc] initWithDictionary:repo error:error];
            if (repositoryEntity != nil) {
                [repos addObject:repositoryEntity];
            }
        }
        
        _repositories = repos;

        if (![self validateEntity]) {
            return nil;
        }
    }
    
    return self;
}
@end

NS_ASSUME_NONNULL_END
