//
//  CommitsViewController.h
//  sb
//
//  Created by Slava Podosokorskiy on 10/24/19.
//  Copyright © 2019 com. All rights reserved.
//

#import "AbstractViewController.h"
#import "CommitsViewInput.h"


NS_ASSUME_NONNULL_BEGIN

@protocol CommitsViewOutput;

@interface CommitsViewController : AbstractViewController<CommitsViewInput>
@property (nonatomic, strong) id<CommitsViewOutput> output;

@property (nonatomic, strong) NSString *repositoryAuthor;
@property (nonatomic, strong) NSString *repositoryName;
@end

NS_ASSUME_NONNULL_END
