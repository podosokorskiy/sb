//
//  SessionHolder.m
//  sb
//
//  Created by Slava Podosokorskiy on 10/25/19.
//  Copyright © 2019 com. All rights reserved.
//

#import "SessionHolder.h"
#import "SessionUser.h"
#import "CredentialsStorageService.h"


NS_ASSUME_NONNULL_BEGIN

@interface SessionHolder()
@property (nonatomic, strong) CredentialsStorageService *credentialsStorageService;
@end

@implementation SessionHolder
+ (instancetype)sharedInstance {
    static dispatch_once_t pred;
    
    static SessionHolder *sharedInstance = nil;
    dispatch_once(&pred, ^{
        sharedInstance = [[SessionHolder alloc] init];
    });
    
    return sharedInstance;
}


- (nullable SessionUser *)authorizedSessionUser {
    NSString *creds = [self.credentialsStorageService loadCredentialsWithError:nil];
    
    SessionUser *sessionUser;
    if (creds != nil) {
        sessionUser = [[SessionUser alloc] initWithAuthorization:creds];
    }
    
    return sessionUser;
}


- (BOOL)authorizeWithLogin:(NSString *)login password:(NSString *)password error:(NSError **)error  {
    return [self.credentialsStorageService saveLogin:login password:password error:error];
}


- (BOOL)deauthorizeWithError:(NSError **)error {
    return [self.credentialsStorageService deleteCredentialsWithError:error];
}


#pragma mark - Private lazy
- (CredentialsStorageService *)credentialsStorageService {
    if (_credentialsStorageService == nil) {
        _credentialsStorageService = [[CredentialsStorageService alloc] init];
    }
    
    return _credentialsStorageService;
}
@end

NS_ASSUME_NONNULL_END
