//
//  RepositoriesViewOutput.h
//  sb
//
//  Created by Slava Podosokorskiy on 10/25/19.
//  Copyright © 2019 com. All rights reserved.
//

#import "AbstractViewOutput.h"

NS_ASSUME_NONNULL_BEGIN

@protocol RepositoriesViewInput;

@protocol RepositoriesViewOutput<AbstractViewOutput>
- (void)logout;
@end

NS_ASSUME_NONNULL_END
