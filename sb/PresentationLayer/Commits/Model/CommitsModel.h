//
//  CommitsModel.h
//  sb
//
//  Created by Slava Podosokorskiy on 10/24/19.
//  Copyright © 2019 com. All rights reserved.
//

#import "AbstractModel.h"
#import "CommitsModelInput.h"


NS_ASSUME_NONNULL_BEGIN

@protocol CommitsModelOutput;

@interface CommitsModel : AbstractModel<CommitsModelInput>
- (instancetype)initWithOutput:(id<CommitsModelOutput>)output
                repositoryName:(NSString *)repositoryName
              repositoryAuthor:(NSString *)repositoryAuthor;

@property (nonatomic, weak) id<CommitsModelOutput> output;
@end

NS_ASSUME_NONNULL_END
