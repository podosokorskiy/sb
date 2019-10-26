//
//  RepositoryInfoModelOutput.h
//  sb
//
//  Created by Slava Podosokorskiy on 10/25/19.
//  Copyright © 2019 com. All rights reserved.
//

#import "AbstractModelOutput.h"

NS_ASSUME_NONNULL_BEGIN

@protocol RepositoryInfoModelOutput<AbstractModelOutput>
- (void)didReceiveUserAvatarImageData:(nullable NSData *)imageData;
@end

NS_ASSUME_NONNULL_END
