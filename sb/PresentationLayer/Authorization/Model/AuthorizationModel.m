//
//  AuthorizationModel.m
//  sb
//
//  Created by Slava Podosokorskiy on 10/24/19.
//  Copyright © 2019 com. All rights reserved.
//

#import "AuthorizationModel.h"
#import "AuthorizationModelOutput.h"

#import "GithubRequestService.h"
#import "GithubRepositoriesRequestEntity.h"


NS_ASSUME_NONNULL_BEGIN

@interface AuthorizationModel()
@end

@implementation AuthorizationModel
#pragma mark - AuthorizationModelInput
- (instancetype)initWithOutput:(id<AuthorizationModelOutput>)output {
    self = [super init];
    
    if (self) {
        _output = output;

        if ([[SessionHolder sharedInstance] authorizedSessionUser] != nil) {
            // already authorized
            [self loadRepositoryList];
        }
    }
    
    return self;
}


- (void)authorizeWithLogin:(NSString *)login password:(NSString *)password {
    NSError *underlyingError;

    if ([[SessionHolder sharedInstance] authorizeWithLogin:login password:password error:&underlyingError]) {
        // successfully saved credentials, requesting repositories
        [self loadRepositoryList];
    } else {
        [self.output didNotSaveCredentialsWithError:underlyingError];
    }
}


#pragma mark - Private
// Loading repository list as authorization (1 less request later)
- (void)loadRepositoryList {
    [self.output didStartOperation:@"Loading user data..."];
    
    GithubRepositoriesRequestEntity *request = [[GithubRepositoriesRequestEntity alloc] initWithPage:1];
    __weak typeof(self) welf = self;
    [self.githubRequestService requestWithEntity:request
                                 completionBlock:^(id  _Nullable responseEntity, NSError * _Nullable error) {
                                     dispatch_async(dispatch_get_main_queue(), ^{
                                         if (error != nil) {
                                             [welf.output didNotAuthorizeWithError:error];
                                             
                                             [[SessionHolder sharedInstance] deauthorizeWithError:nil];
                                         } else {
                                             [welf.output didAuthorizeWithResponse:responseEntity];
                                         }
                                         [welf.output didEndOperation];
                                     });
                                 }];
}
@end

NS_ASSUME_NONNULL_END
