//
//  CredentialsStorageService.h
//  sb
//
//  Created by Slava Podosokorskiy on 10/25/19.
//  Copyright © 2019 com. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CredentialsStorageService : NSObject
- (BOOL)saveLogin:(NSString *)login password:(NSString *)password error:(NSError **)error;
- (BOOL)deleteCredentialsWithError:(NSError **)error;
- (nullable NSString *)loadCredentialsWithError:(NSError **)error;
@end

NS_ASSUME_NONNULL_END
