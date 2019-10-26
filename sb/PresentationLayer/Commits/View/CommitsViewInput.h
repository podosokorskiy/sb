//
//  CommitsViewInput.h
//  sb
//
//  Created by Slava Podosokorskiy on 10/25/19.
//  Copyright © 2019 com. All rights reserved.
//

#import "AbstractViewInput.h"

NS_ASSUME_NONNULL_BEGIN

@class CommitsViewFields;

@protocol CommitsViewInput<AbstractViewInput>
- (void)updateViewWithViewEntity:(CommitsViewFields *)viewEntity;
@end

NS_ASSUME_NONNULL_END
