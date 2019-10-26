//
//  GithubRepositoryEntity.m
//  sb
//
//  Created by Slava Podosokorskiy on 10/24/19.
//  Copyright © 2019 com. All rights reserved.
//

#import "GithubRepositoryEntity.h"
#import "GithubRepositoryAuthorEntity.h"


NS_ASSUME_NONNULL_BEGIN

static NSString *const kName = @"name";
static NSString *const kDescription = @"description";
static NSString *const kOwner = @"owner";
static NSString *const kForksCount = @"forks_count";
static NSString *const kWatchersCount = @"watchers_count";


@implementation GithubRepositoryEntity
- (instancetype)initWithDictionary:(NSDictionary<NSString *,id> *)dictionary error:(NSError * _Nullable __autoreleasing *)error {
    self = [super initWithDictionary:dictionary error:error];
    
    if (self) {
        if (![self validateDictionary:dictionary]) {
            return nil;
        }
        
        GithubRepositoryAuthorEntity *author = [[GithubRepositoryAuthorEntity alloc] initWithDictionary:dictionary[kOwner] error:error];
        
        NSString *name;
        if (![self getString:&name forKey:kName inDictionary:dictionary nullValid:NO error:error]) {
            return nil;
        }
        _name = name;
        
        NSString *repoDescription;
        if (![self getString:&repoDescription forKey:kDescription inDictionary:dictionary nullValid:YES error:error]) {
            return nil;
        }
        _repoDescription = repoDescription;

        _author = author;
        
        NSNumber *forks;
        if (![self getNumber:&forks forKey:kForksCount inDictionary:dictionary nullValid:YES error:error]) {
            return nil;
        }
        _forks = forks.unsignedIntegerValue;
        
        NSNumber *watchers;
        if (![self getNumber:&watchers forKey:kWatchersCount inDictionary:dictionary nullValid:YES error:error]) {
            return nil;
        }
        _watchers = watchers.unsignedIntegerValue;
    }
    
    return self;
}


- (BOOL)validateDictionary:(NSDictionary <NSString *, id> *)dictionary {
    [super validateDictionary:dictionary];
    
    if (dictionary[kName] == nil || ![dictionary[kName] isKindOfClass:[NSString class]]) {
        return NO;
    }
    
    if (![dictionary[kDescription] isEqual:[NSNull null]]) {
        if (![dictionary[kDescription] isKindOfClass:[NSString class]]) {
            return NO;
        }
    }
    
    if (dictionary[kOwner] == nil || ![dictionary[kOwner] isKindOfClass:[NSDictionary class]]) {
        return NO;
    }
    
    if (dictionary[kForksCount] != nil) {
        if (![dictionary[kForksCount] isKindOfClass:[NSNumber class]]) {
            return NO;
        }
    }
    
    if (dictionary[kWatchersCount] != nil) {
        if (![dictionary[kWatchersCount] isKindOfClass:[NSNumber class]]) {
            return NO;
        }
    }
    
    return YES;
}
@end

NS_ASSUME_NONNULL_END
