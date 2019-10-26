//
//  CommitsModel.m
//  sb
//
//  Created by Slava Podosokorskiy on 10/25/19.
//  Copyright © 2019 com. All rights reserved.
//

#import "CommitsModel.h"
#import "CommitsModelOutput.h"

#import "GithubRequestService.h"
#import "GithubCommitsRequestEntity.h"


NS_ASSUME_NONNULL_BEGIN


@interface CommitsModel()
@property (nonatomic, strong) NSString *repositoryName;
@property (nonatomic, strong) NSString *repositoryAuthor;
@end

@implementation CommitsModel
- (instancetype)initWithOutput:(id<CommitsModelOutput>)output
                repositoryName:(nonnull NSString *)repositoryName
              repositoryAuthor:(nonnull NSString *)repositoryAuthor {
    self = [super init];
    
    if (self) {
        _output = output;
        _repositoryName = repositoryName;
        _repositoryAuthor = repositoryAuthor;

        [self loadCommitHistoryWithPage:1];
    }
    
    return self;
}


#pragma mark - CommitsModelInput
- (void)loadCommitHistoryWithPage:(NSUInteger)page {
    [self.output didStartOperation:@"Loading commit history..."];
    
    GithubCommitsRequestEntity *request = [[GithubCommitsRequestEntity alloc] initWithUser:self.repositoryAuthor
                                                                                      repo:self.repositoryName
                                                                                      page:page];
    
    __weak typeof(self) welf = self;
    [self.githubRequestService requestWithEntity:request
                                 completionBlock:^(id  _Nullable responseEntity, NSError * _Nullable error) {
                                     dispatch_async(dispatch_get_main_queue(), ^{
                                         if (error != nil) {
                                             [welf.output didNotLoadCommitsWithError:error];
                                         } else {
                                             [welf.output didLoadCommitsWithResponse:responseEntity];
                                         }
                                         [welf.output didEndOperation];
                                     });
                                 }];
}
@end

NS_ASSUME_NONNULL_END
