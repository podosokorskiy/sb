//
//  RepositoriesModel.m
//  sb
//
//  Created by Slava Podosokorskiy on 10/25/19.
//  Copyright © 2019 com. All rights reserved.
//

#import "RepositoriesModel.h"
#import "RepositoriesModelOutput.h"

#import "GithubRequestService.h"
#import "GithubRepositoriesRequestEntity.h"

NS_ASSUME_NONNULL_BEGIN

@interface RepositoriesModel()
@end

@implementation RepositoriesModel
- (instancetype)initWithOutput:(id<RepositoriesModelOutput>)output {
    self = [super init];
    
    if (self) {
        _output = output;
    }
    
    return self;
}


#pragma mark - RepositoriesModelInput
- (void)loadRepositoryListWithPage:(NSUInteger)page {
    [self.output didStartOperation:@"Loading repository list..."];
    
    GithubRepositoriesRequestEntity *request = [[GithubRepositoriesRequestEntity alloc] initWithPage:page];
    __weak typeof(self) welf = self;
    [self.githubRequestService requestWithEntity:request
                                 completionBlock:^(id  _Nullable responseEntity, NSError * _Nullable error) {
                                     dispatch_async(dispatch_get_main_queue(), ^{
                                         if (error != nil) {
                                             [welf.output didNotLoadRepositoriesWithError:error];
                                         } else {
                                             [welf.output didLoadRepositoriesWithResponse:responseEntity];
                                         }
                                         
                                         [welf.output didEndOperation];
                                     });
                                 }];
}


- (void)logout {
    [[SessionHolder sharedInstance] deauthorizeWithError:nil];
}
@end

NS_ASSUME_NONNULL_END
