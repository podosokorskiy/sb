//
//  RemoteRequestService.h
//  sb
//
//  Created by Slava Podosokorskiy on 10/24/19.
//  Copyright © 2019 com. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
extern NSErrorDomain const kRemoteRequestServiceErrorDomain;
extern NSString *const kRemoteRequestServiceErrorDescription;

typedef void (^RemoteRequestServiceBlock)(NSURLResponse  * _Nullable responseUrl, NSData * _Nullable data, NSError * _Nullable error);

@interface RemoteRequestService : NSObject
- (void)getFromUrl:(NSURL *)url headers:(NSDictionary<NSString *, NSString *> *)headers completionBlock:(RemoteRequestServiceBlock)completionBlock;
@end

NS_ASSUME_NONNULL_END
