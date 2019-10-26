//
//  RepositoriesModel.h
//  sb
//
//  Created by Slava Podosokorskiy on 10/24/19.
//  Copyright © 2019 com. All rights reserved.
//

#import "AbstractModel.h"
#import "RepositoriesModelInput.h"


NS_ASSUME_NONNULL_BEGIN

@protocol RepositoriesModelOutput;

@interface RepositoriesModel : AbstractModel<RepositoriesModelInput>
- (instancetype)initWithOutput:(id<RepositoriesModelOutput>)output;

@property (nonatomic, weak) id<RepositoriesModelOutput> output;
@end

NS_ASSUME_NONNULL_END
