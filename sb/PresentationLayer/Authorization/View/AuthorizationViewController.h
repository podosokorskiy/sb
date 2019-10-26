//
//  AuthorizationViewController.h
//  sb
//
//  Created by Slava Podosokorskiy on 10/24/19.
//  Copyright © 2019 com. All rights reserved.
//

#import "AbstractViewController.h"
#import "AuthorizationViewInput.h"


NS_ASSUME_NONNULL_BEGIN

@protocol AuthorizationViewOutput;

@interface AuthorizationViewController : AbstractViewController<AuthorizationViewInput>
@property (nonatomic, strong) id<AuthorizationViewOutput> output;
@end

NS_ASSUME_NONNULL_END
