//
//  RepositoryInfoModel.h
//  sb
//
//  Created by Slava Podosokorskiy on 10/24/19.
//  Copyright © 2019 com. All rights reserved.
//

#import "AbstractModel.h"
#import "RepositoryInfoModelInput.h"


NS_ASSUME_NONNULL_BEGIN

@protocol RepositoryInfoModelOutput;

@interface RepositoryInfoModel : AbstractModel<RepositoryInfoModelInput>
- (instancetype)initWithOutput:(id<RepositoryInfoModelOutput>)output;

@property (nonatomic, weak) id<RepositoryInfoModelOutput> output;
@end

NS_ASSUME_NONNULL_END
