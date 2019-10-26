//
//  AuthorizationPresenter.h
//  sb
//
//  Created by Slava Podosokorskiy on 10/24/19.
//  Copyright © 2019 com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AuthorizationViewOutput.h"
#import "AuthorizationModelOutput.h"


NS_ASSUME_NONNULL_BEGIN

@protocol AuthorizationModelInput;
@protocol AuthorizationViewInput;

@interface AuthorizationPresenter : NSObject<AuthorizationViewOutput, AuthorizationModelOutput>
- (instancetype)initWithView:(id<AuthorizationViewInput>)view;

@property (nonatomic, weak) id<AuthorizationViewInput> view;
@property (nonatomic, strong) id<AuthorizationModelInput> model;
@end

NS_ASSUME_NONNULL_END
