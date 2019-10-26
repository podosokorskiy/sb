//
//  AuthorizationViewOutput.h
//  sb
//
//  Created by Slava Podosokorskiy on 10/25/19.
//  Copyright © 2019 com. All rights reserved.
//

#import "AbstractViewOutput.h"

NS_ASSUME_NONNULL_BEGIN

@protocol AuthorizationViewInput;

@protocol AuthorizationViewOutput<AbstractViewOutput>
- (void)authorizeWithLogin:(NSString *)login password:(NSString *)password;
@end

NS_ASSUME_NONNULL_END
