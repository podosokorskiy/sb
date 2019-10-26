//
//  GithubCommitEntity.m
//  sb
//
//  Created by Slava Podosokorskiy on 10/24/19.
//  Copyright © 2019 com. All rights reserved.
//

#import "GithubCommitEntity.h"

NS_ASSUME_NONNULL_BEGIN

static NSString *const kHash = @"sha";
static NSString *const kCommit = @"commit";
static NSString *const kAuthor = @"author";
static NSString *const kName = @"name";
static NSString *const kDate = @"date";
static NSString *const kMessage = @"message";

@implementation GithubCommitEntity
- (instancetype)initWithDictionary:(NSDictionary<NSString *,id> *)dictionary error:(NSError * _Nullable __autoreleasing *)error {
    self = [super initWithDictionary:dictionary error:error];
    
    if (self) {
        if (![self validateDictionary:dictionary]) {
            return nil;
        }
        
        NSDictionary *commitDictionary = dictionary[kCommit];
        NSDictionary *authorDictionary = commitDictionary[kAuthor];
        
        NSString *commitHash;
        if (![self getString:&commitHash forKey:kHash inDictionary:dictionary nullValid:NO error:error]) {
            return nil;
        }
        _commitHash = commitHash;
        
        NSString *author;
        if (![self getString:&author forKey:kName inDictionary:authorDictionary nullValid:NO error:error]) {
            return nil;
        }
        _author = author;
        
        NSString *message;
        if (![self getString:&message forKey:kMessage inDictionary:commitDictionary nullValid:NO error:error]) {
            return nil;
        }
        _message = message;
        
        NSDate *date;
        if (![self getDate:&date forKey:kDate inDictionary:authorDictionary nullValid:NO error:error]) {
            return nil;
        }
        _date = date;

    }
    
    return self;
}


- (BOOL)validateDictionary:(NSDictionary <NSString *, id> *)dictionary {
    [super validateDictionary:dictionary];
    
    if (dictionary[kHash] == nil || ![dictionary[kHash] isKindOfClass:[NSString class]]) {
        return NO;
    }
    
    id commitObject = dictionary[kCommit];
    if (commitObject == nil || ![commitObject isKindOfClass:[NSDictionary class]]) {
        return NO;
    }
    
    NSDictionary *commitDictionary = (NSDictionary *)commitObject;
    if (commitDictionary[kMessage] == nil || ![commitDictionary[kMessage] isKindOfClass:[NSString class]]) {
        return NO;
    }
    
    id authorObject = commitDictionary[kAuthor];
    if (authorObject == nil || ![authorObject isKindOfClass:[NSDictionary class]]) {
        return NO;
    }
    
    NSDictionary *authorDictionary = (NSDictionary *)authorObject;
    if (authorDictionary[kDate] == nil || ![authorDictionary[kDate] isKindOfClass:[NSString class]]) {
        return NO;
    }
    
    if (authorDictionary[kName] == nil || ![authorDictionary[kName] isKindOfClass:[NSString class]]) {
        return NO;
    }
    
    return YES;
}
@end

NS_ASSUME_NONNULL_END
