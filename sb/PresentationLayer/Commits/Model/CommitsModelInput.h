//
//  CommitsModelInput.h
//  sb
//
//  Created by Slava Podosokorskiy on 10/25/19.
//  Copyright © 2019 com. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol CommitsModelInput<NSObject>
- (void)loadCommitHistoryWithPage:(NSUInteger)page;
@end

NS_ASSUME_NONNULL_END
