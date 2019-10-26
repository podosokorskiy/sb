//
//  RepositoriesModelInput.h
//  sb
//
//  Created by Slava Podosokorskiy on 10/25/19.
//  Copyright © 2019 com. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol RepositoriesModelInput<NSObject>
- (void)logout;
- (void)loadRepositoryListWithPage:(NSUInteger)page;
@end

NS_ASSUME_NONNULL_END
