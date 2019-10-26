//
//  CommitsPresenter.h
//  sb
//
//  Created by Slava Podosokorskiy on 10/24/19.
//  Copyright © 2019 com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CommitsViewOutput.h"
#import "CommitsModelOutput.h"


NS_ASSUME_NONNULL_BEGIN

@protocol CommitsModelInput;
@protocol CommitsViewInput;

@interface CommitsPresenter : NSObject<CommitsViewOutput, CommitsModelOutput>
- (instancetype)initWithView:(id<CommitsViewInput>)view repositoryName:(NSString *)repositoryName repositoryAuthor:(NSString *)repositoryAuthor;

@property (nonatomic, weak) id<CommitsViewInput> view;
@property (nonatomic, strong) id<CommitsModelInput> model;
@end

NS_ASSUME_NONNULL_END
