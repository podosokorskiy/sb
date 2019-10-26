//
//  AbstractViewOutput.h
//  sb
//
//  Created by Slava Podosokorskiy on 10/26/19.
//  Copyright © 2019 com. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol AbstractViewOutput<NSObject>
@optional
- (void)loadNextPage;
- (void)loadPrevPage;
@end

NS_ASSUME_NONNULL_END

