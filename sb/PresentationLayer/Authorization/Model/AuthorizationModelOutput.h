//
//  AuthorizationModelOutput.h
//  sb
//
//  Created by Slava Podosokorskiy on 10/25/19.
//  Copyright © 2019 com. All rights reserved.
//

#import "AbstractModelOutput.h"

NS_ASSUME_NONNULL_BEGIN

@class GithubRepositoriesResponseEntity;

@protocol AuthorizationModelOutput<AbstractModelOutput>
- (void)didNotSaveCredentialsWithError:(NSError *)error;
- (void)didNotAuthorizeWithError:(NSError *)error;
- (void)didAuthorizeWithResponse:(GithubRepositoriesResponseEntity *)response;
@end

NS_ASSUME_NONNULL_END
