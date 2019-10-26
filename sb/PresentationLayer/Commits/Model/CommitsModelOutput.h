//
//  CommitsModelOutput.h
//  sb
//
//  Created by Slava Podosokorskiy on 10/25/19.
//  Copyright © 2019 com. All rights reserved.
//

#import "AbstractModelOutput.h"

NS_ASSUME_NONNULL_BEGIN

@class GithubCommitsResponseEntity;


@protocol CommitsModelOutput<AbstractModelOutput>
- (void)didNotLoadCommitsWithError:(NSError *)error;
- (void)didLoadCommitsWithResponse:(GithubCommitsResponseEntity *)response;
@end

NS_ASSUME_NONNULL_END
