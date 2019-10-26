//
//  RemoteRequestService.m
//  sb
//
//  Created by Slava Podosokorskiy on 10/24/19.
//  Copyright © 2019 com. All rights reserved.
//

#import "RemoteRequestService.h"

NS_ASSUME_NONNULL_BEGIN
NSErrorDomain const kRemoteRequestServiceErrorDomain = @"RemoteRequestServiceErrorDomain";
NSString *const kRemoteRequestServiceErrorDescription = @"RemoteRequestServiceErrorDescription";

typedef void (^URLSessionCompletionHandler)(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error);

@interface RemoteRequestService()
@property (nonatomic, strong) NSURLSession *urlSession;
@end


@implementation RemoteRequestService
- (void)getFromUrl:(NSURL *)url headers:(NSDictionary<NSString *, NSString *> *)headers completionBlock:(RemoteRequestServiceBlock)completionBlock {
    NSParameterAssert(url != nil);
    NSParameterAssert(headers != nil);
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    request.HTTPMethod = @"GET";
    request.timeoutInterval = 10;
    for (NSString *key in headers) {
        [request addValue:headers[key] forHTTPHeaderField:key];
    }
    
    URLSessionCompletionHandler completionHandler = ^(NSData * _Nullable data,
                                                      NSURLResponse * _Nullable response,
                                                      NSError * _Nullable error) {
        
        NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
        NSInteger statusCode = httpResponse.statusCode;
        
        NSError *resultError = nil;
        NSData *resultData = nil;
        
        if (error != nil) {
            if ([error.domain isEqualToString:NSURLErrorDomain]) {
                resultError = [NSError errorWithDomain:kRemoteRequestServiceErrorDomain
                                                  code:error.code
                                              userInfo:nil];
            } else {
                resultError = error;
            }
            
            if (completionBlock != nil) {
                completionBlock(nil, nil, resultError);
            }
            return;
        }
        
        if (statusCode >= 200 && statusCode <= 299) {
            resultData = data;
        } else {
            NSDictionary<NSErrorUserInfoKey, id> *userInfo;
            if (data != nil) {
                userInfo = @{kRemoteRequestServiceErrorDescription : data };
            }
            
            resultError = [NSError errorWithDomain:kRemoteRequestServiceErrorDomain
                                              code:statusCode
                                          userInfo:userInfo];
        }
        
        if (completionBlock != nil) {
            completionBlock(response, resultData, resultError);
        }
    };
    
    NSURLSessionDataTask *task = [self.urlSession dataTaskWithRequest:request
                                                    completionHandler:completionHandler];
    [task resume];
}


#pragma mark - Private
- (NSURLSession *)urlSession {
    return [NSURLSession sharedSession];
}
@end

NS_ASSUME_NONNULL_END
