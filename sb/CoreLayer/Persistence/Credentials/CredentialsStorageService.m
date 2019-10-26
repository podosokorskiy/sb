//
//  CredentialsStorageService.m
//  sb
//
//  Created by Slava Podosokorskiy on 10/25/19.
//  Copyright © 2019 com. All rights reserved.
//

#import "CredentialsStorageService.h"
#import "SAMKeychain.h"

NS_ASSUME_NONNULL_BEGIN

static NSString *const kKeychainServiceAccount = @"com.slava.sb";
static NSString *const kKeychainServiceBasicAuth = @"basic.auth";


@implementation CredentialsStorageService
- (BOOL)saveLogin:(NSString *)login password:(NSString *)password error:(NSError **)error {
    NSParameterAssert(login != nil);
    NSParameterAssert(password != nil);
    
    NSString *authorizationString = [NSString stringWithFormat:@"%@:%@", login, password];
    NSData *authorizationData = [authorizationString dataUsingEncoding:NSUTF8StringEncoding];
    
    NSString *base64AuthorizationString = [authorizationData base64EncodedStringWithOptions:0];
    NSString *baseAuthString = [NSString stringWithFormat:@"Basic %@", base64AuthorizationString];

    NSError *keychainError;
    BOOL result = [SAMKeychain setPassword:baseAuthString forService:kKeychainServiceBasicAuth account:kKeychainServiceAccount error:&keychainError];
    if (!result) {
        if (error != nil) {
            *error = keychainError;
        }
    }
    
    return result;
}


- (BOOL)deleteCredentialsWithError:(NSError **)error {
    NSError *keychainError;
    
    BOOL result = [SAMKeychain deletePasswordForService:kKeychainServiceBasicAuth account:kKeychainServiceAccount error:&keychainError];
    if (!result) {
        if (error != nil) {
            *error = keychainError;
        }
    }
    
    return result;
}


- (nullable NSString *)loadCredentialsWithError:(NSError **)error {
    NSError *keychainError;
    NSString *result = [SAMKeychain passwordForService:kKeychainServiceBasicAuth account:kKeychainServiceAccount error:&keychainError];
    if (result == nil) {
        if (error != nil) {
            *error = keychainError;
        }
    }
    
    return result;
}

@end

NS_ASSUME_NONNULL_END
