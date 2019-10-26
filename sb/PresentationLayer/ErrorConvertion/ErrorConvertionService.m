//
//  ErrorConvertionService.m
//  sb
//
//  Created by Slava Podosokorskiy on 10/25/19.
//  Copyright © 2019 com. All rights reserved.
//

#import "ErrorConvertionService.h"
#import "GithubRequestService.h"
#import "RemoteRequestService.h"


NS_ASSUME_NONNULL_BEGIN

@implementation ErrorConvertionService
+ (NSString *)errorTextFromError:(NSError *)error {
    NSParameterAssert(error != nil);
    
    NSString *errorText = @"Unknown error"; // fallback
    if ([error.domain isEqualToString:kGithubRequestServiceErrorDomain]) {
        switch ((GithubRequestServiceError)error.code) {
            case GithubRequestServiceErrorInvalidURL:
                errorText = @"Invalid URL";
                break;
                
            case GithubRequestServiceErrorBadResponse:
                errorText = @"Bad response";
                break;
        }
    } else if ([error.domain isEqualToString:kRemoteRequestServiceErrorDomain]) {
        errorText = [NSString stringWithFormat:@"Connection error (code = %ld)", (long)error.code];
        
        switch (error.code) {
            case 400:
                errorText = @"Bad Request";
                break;
             
            case 401:
                errorText = @"Incorrect login/password";
                break;
                
            case 403:
                errorText = @"Forbidden";
                break;
                
            case 404:
                errorText = @"Not Found";
                break;
                
            case 429:
                errorText = @"Too Many Requests";
                break;
                
            case NSURLErrorTimedOut:
                errorText = @"Connection timed out";
                break;
                
            case NSURLErrorNotConnectedToInternet:
                errorText = @"Not connected to Internet";
                break;
                
            case NSURLErrorCannotFindHost:
                errorText = @"Cannot find host";
                break;
        }
    }
    
    return errorText;
}
@end

NS_ASSUME_NONNULL_END
