//
//  GithubRepositoryAuthorEntity.m
//  sb
//
//  Created by Slava Podosokorskiy on 10/24/19.
//  Copyright © 2019 com. All rights reserved.
//

#import "GithubRepositoryAuthorEntity.h"

NS_ASSUME_NONNULL_BEGIN

static NSString *const kLogin = @"login";
static NSString *const kAvatarUrl = @"avatar_url";

@implementation GithubRepositoryAuthorEntity
- (instancetype)initWithDictionary:(NSDictionary<NSString *,id> *)dictionary error:(NSError * _Nullable __autoreleasing *)error {
    self = [super initWithDictionary:dictionary error:error];
    
    if (self) {
        if (![self validateDictionary:dictionary]) {
            return nil;
        }

        NSString *name;
        if (![self getString:&name forKey:kLogin inDictionary:dictionary nullValid:NO error:error]) {
            return nil;
        }
        _name = name;
        
        NSString *avatarUrl;
        if (![self getString:&avatarUrl forKey:kAvatarUrl inDictionary:dictionary nullValid:YES error:error]) {
            return nil;
        }
        _avatarUrl = avatarUrl;
    }
    
    return self;
}


- (BOOL)validateDictionary:(NSDictionary<NSString *,id> *)dictionary {
    if (![dictionary[kLogin] isKindOfClass:[NSString class]]) {
        return NO;
    }
    
    if (![dictionary[kAvatarUrl] isEqual:[NSNull null]]) {
        if (![dictionary[kAvatarUrl] isKindOfClass:[NSString class]]) {
            return NO;
        }
    }
    
    return YES;
}
@end

NS_ASSUME_NONNULL_END
