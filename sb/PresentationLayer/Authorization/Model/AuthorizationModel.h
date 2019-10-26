//
//  AuthorizationModel.h
//  sb
//
//  Created by Slava Podosokorskiy on 10/24/19.
//  Copyright © 2019 com. All rights reserved.
//

#import "AbstractModel.h"
#import "AuthorizationModelInput.h"


NS_ASSUME_NONNULL_BEGIN

@protocol AuthorizationModelOutput;

@interface AuthorizationModel : AbstractModel<AuthorizationModelInput>
- (instancetype)initWithOutput:(id<AuthorizationModelOutput>)output;

@property (nonatomic, weak) id<AuthorizationModelOutput> output;
@end

NS_ASSUME_NONNULL_END
