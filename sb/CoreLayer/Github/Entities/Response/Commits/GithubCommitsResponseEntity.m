//
//  GithubCommitsResponseEntity.m
//  sb
//
//  Created by Slava Podosokorskiy on 10/24/19.
//  Copyright © 2019 com. All rights reserved.
//

#import "GithubCommitsResponseEntity.h"
#import "GithubCommitEntity.h"


NS_ASSUME_NONNULL_BEGIN

@implementation GithubCommitsResponseEntity
- (instancetype)initWithArray:(NSArray<id> *)array lastPage:(NSUInteger)lastPage error:(NSError * _Nullable __autoreleasing *)error {
    self = [super initWithArray:array lastPage:lastPage error:error];
    
    if (self) {
        NSMutableArray<GithubCommitEntity *> *commits = [[NSMutableArray alloc] init];
        
        for (NSDictionary *commit in array) {
            GithubCommitEntity *commitEntity = [[GithubCommitEntity alloc] initWithDictionary:commit error:error];
            if (commitEntity != nil) {
                [commits addObject:commitEntity];
            }
        }
        
        _commits = commits;
        
        if (![self validateEntity]) {
            return nil;
        }
    }
    
    return self;
}
@end

NS_ASSUME_NONNULL_END
