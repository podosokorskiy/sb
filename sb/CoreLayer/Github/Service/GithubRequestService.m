//
//  GithubRequestService.m
//  sb
//
//  Created by Slava Podosokorskiy on 10/24/19.
//  Copyright © 2019 com. All rights reserved.
//

#import "GithubRequestService.h"
#import "GithubBaseRequestEntity.h"
#import "GithubBaseResponseEntity.h"
#import "SessionHolder.h"
#import "SessionUser.h"

#import "RemoteRequestService.h"
#import "CredentialsStorageService.h"


NS_ASSUME_NONNULL_BEGIN

NSErrorDomain const kGithubRequestServiceErrorDomain = @"GithubRequestServiceErrorDomain";
static NSString *const kGithubRequestServiceEndpoint = @"https://api.github.com";

@interface GithubRequestService()
@property (nonatomic, strong) RemoteRequestService *remoteRequestService;
@end


@implementation GithubRequestService
- (instancetype)initWithRemoteRequestService:(RemoteRequestService *)remoteRequestService {
    NSParameterAssert(remoteRequestService != nil);

    self = [super init];
    if (self) {
        _remoteRequestService = remoteRequestService;
    }
    return self;
}


- (void)requestWithEntity:(GithubBaseRequestEntity *)requestEntity
          completionBlock:(GithubRequestServiceCompletionBlock)completionBlock {
    NSParameterAssert(requestEntity != nil);
    NSParameterAssert(completionBlock != nil);
    
    __weak typeof(self) welf = self;
    RemoteRequestServiceBlock remoteRequestServiceBlock = ^(NSURLResponse  * _Nullable responseUrl,
                                                                      NSData * _Nullable data,
                                                                      NSError * _Nullable blockError) {
        
        NSError *resultError;
        if (blockError != nil) {
            completionBlock(nil, blockError);
            return;
        }

        NSError *underlyingError;
        id response = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&underlyingError];
        if (response == nil) {
            completionBlock(nil, underlyingError);
            return;
        }
        
        NSDictionary<NSString *, NSString *> *responseHeaders = [(NSHTTPURLResponse *)responseUrl allHeaderFields];
        id resultEntity = [welf parseResponseArray:response
                                     responseClass:[[requestEntity class] responseClass]
                                   responseHeaders:responseHeaders
                                             error:&resultError];
        if (resultEntity == nil) {
            completionBlock(nil, resultError);
            return;
        }

        completionBlock(resultEntity, nil);
    };
    
    NSError *error;
    NSURL *url = [self urlForRequestEntity:requestEntity error:&error];
    if (url == nil) {
        completionBlock(nil, error);
        return;
    }
    
    NSDictionary<NSString *, NSString *> *headers = [self headers];
    
    GithubRequestMethod requestMethod = [[requestEntity class] requestMethod];
    switch (requestMethod) {
        case GithubRequestMethodGET: {
            [self.remoteRequestService getFromUrl:url
                                          headers:headers
                                  completionBlock:remoteRequestServiceBlock];
            break;
        }
    }
}


#pragma mark - Private
- (nullable NSURL *)urlForRequestEntity:(GithubBaseRequestEntity *)requestEntity
                                  error:(NSError **)error {
    
    NSParameterAssert(requestEntity != nil);
    
    NSString *serverUri = kGithubRequestServiceEndpoint;
    
    NSString *fullPath = [NSString stringWithFormat:@"%@%@%@", serverUri, requestEntity.path, requestEntity.pathParameters];
    
    NSURL *url = [NSURL URLWithString:fullPath];
    if (url == nil) {
        if (error != nil) {
            *error = [NSError errorWithDomain:kGithubRequestServiceErrorDomain
                                         code:GithubRequestServiceErrorInvalidURL
                                     userInfo:nil];
        }
        return nil;
    }
    
    return url;
}


- (NSDictionary<NSString *, NSString *> *)headers {
    SessionUser *sessionUser = [[SessionHolder sharedInstance] authorizedSessionUser];
    
    NSMutableDictionary<NSString *, NSString *> *headers = [[NSMutableDictionary alloc] init];
    if (sessionUser != nil) {
        headers[@"Authorization"] = sessionUser.authorization;
    }
    
    headers[@"Content-type"] = @"application/json";
    
    return headers;
}


- (nullable id)parseResponseArray:(NSArray<id> *)responseArray
                    responseClass:(Class)responseClass
                  responseHeaders:(NSDictionary<NSString *, NSString *> *)responseHeaders
                            error:(NSError **)error {
    NSParameterAssert(responseArray != nil);
    
    NSUInteger lastPage = [self parseLastPageFromResponseHeaders:responseHeaders];
    NSError *underlyingError;
    id responseEntity = [[responseClass alloc] initWithArray:responseArray lastPage:lastPage error:&underlyingError];
    if (responseEntity == nil) {
        if (error != nil) {
            *error = [NSError
                      errorWithDomain:kGithubRequestServiceErrorDomain
                      code:GithubRequestServiceErrorBadResponse userInfo:nil];
        }
        return nil;
    }
    
    return responseEntity;
}


- (NSUInteger)parseLastPageFromResponseHeaders:(NSDictionary<NSString *, NSString *> *)responseHeaders {
    NSUInteger lastPage = 1;
    
    if (responseHeaders != nil && responseHeaders[@"Link"] != nil) {
        NSError *regexError;
        
        NSString *linkResponseHeader = responseHeaders[@"Link"];
        NSString *pattern = @"\\?page=([0-9]*)>; rel=\"last\"";
        NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:pattern options:0 error:&regexError];
        
        if (regex != nil) {
            NSRange range = NSMakeRange(0, linkResponseHeader.length);
            NSArray<NSTextCheckingResult *> *matches = [regex matchesInString:linkResponseHeader options:0 range:range];
            for (NSTextCheckingResult *match in matches) {
                if (match.numberOfRanges > 0) {
                    NSString *lastPageString = [linkResponseHeader substringWithRange:[match rangeAtIndex:1]];
                    lastPage = (NSUInteger)lastPageString.integerValue;
                }
            }
        }
    }
    
    return lastPage;
}
@end

NS_ASSUME_NONNULL_END
