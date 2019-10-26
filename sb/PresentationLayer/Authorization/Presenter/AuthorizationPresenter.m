//
//  AuthorizationPresenter.m
//  sb
//
//  Created by Slava Podosokorskiy on 10/24/19.
//  Copyright © 2019 com. All rights reserved.
//

#import "AuthorizationPresenter.h"
#import "AuthorizationModel.h"
#import "AuthorizationViewInput.h"

#import "ErrorConvertionService.h"


NS_ASSUME_NONNULL_BEGIN

@implementation AuthorizationPresenter
- (instancetype)initWithView:(id<AuthorizationViewInput>)view {
    self = [super init];
    if (self) {
        _view = view;
        _model = [[AuthorizationModel alloc] initWithOutput:self];
    }
    return self;
}


#pragma mark - AuthorizationViewOutput
- (void)authorizeWithLogin:(NSString *)login password:(NSString *)password {
    NSParameterAssert(login != nil);
    NSParameterAssert(password != nil);

    [self.model authorizeWithLogin:login password:password];
}


#pragma mark - AuthorizationModelOutput
- (void)didNotSaveCredentialsWithError:(NSError *)error {
    NSParameterAssert(error != nil);
    
    // keychain error (rarely happens)
    NSString *errorText = @"Couldn't save credentials, try again";
    
    [self.view showErrorText:errorText];
}


- (void)didNotAuthorizeWithError:(NSError *)error {
    NSParameterAssert(error != nil);
    
    NSString *errorText = [ErrorConvertionService errorTextFromError:error];
    [self.view showErrorText:errorText];
}


- (void)didAuthorizeWithResponse:(GithubRepositoriesResponseEntity *)response {
    NSParameterAssert(response != nil);
    
    [self.view presentRepositoriesWithRepositoryList:response];
}


#pragma mark - AbstractModelOutput
- (void)didStartOperation:(NSString *)operation {
    [self.view startProgressWithText:operation];
}


- (void)didEndOperation {
    [self.view stopProgress];
}
@end

NS_ASSUME_NONNULL_END
