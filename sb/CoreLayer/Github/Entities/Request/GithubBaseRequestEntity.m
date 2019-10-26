//
//  GithubBaseRequestEntity.m
//  sb
//
//  Created by Slava Podosokorskiy on 10/24/19.
//  Copyright © 2019 com. All rights reserved.
//

#import "GithubBaseRequestEntity.h"

NS_ASSUME_NONNULL_BEGIN

@implementation GithubBaseRequestEntity
- (NSString *)pathParameters {
    return @"";
}


+ (Class)responseClass {
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:[NSString stringWithFormat:@"You must override %@ in %@ subclass", NSStringFromSelector(_cmd), NSStringFromClass([self class])]
                                 userInfo:nil];
}


+ (GithubRequestMethod)requestMethod {
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:[NSString stringWithFormat:@"You must override %@ in %@ subclass", NSStringFromSelector(_cmd), NSStringFromClass([self class])]
                                 userInfo:nil];
}


- (NSString *)path {
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:[NSString stringWithFormat:@"You must override %@ in %@ subclass", NSStringFromSelector(_cmd), NSStringFromClass([self class])]
                                 userInfo:nil];
}
@end

NS_ASSUME_NONNULL_END
