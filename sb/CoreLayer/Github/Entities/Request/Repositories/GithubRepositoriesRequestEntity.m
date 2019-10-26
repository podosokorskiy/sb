//
//  GithubRepositoriesRequestEntity.m
//  sb
//
//  Created by Slava Podosokorskiy on 10/24/19.
//  Copyright © 2019 com. All rights reserved.
//

#import "GithubRepositoriesRequestEntity.h"
#import "GithubRepositoriesResponseEntity.h"

NS_ASSUME_NONNULL_BEGIN

@interface GithubRepositoriesRequestEntity()
@property (nonatomic, assign) NSUInteger page;
@end


@implementation GithubRepositoriesRequestEntity
- (instancetype)init {
    self = [super init];
    if (self) {
        _page = 1;
    }
    return self;
}


- (instancetype)initWithPage:(NSUInteger)page {
    self = [super init];
    if (self) {
        _page = page;
    }
    return self;
}


- (NSString *)pathParameters {
    return [NSString stringWithFormat:@"?page=%lu", (unsigned long)self.page];
}


+ (Class)responseClass {
    return [GithubRepositoriesResponseEntity class];
}


+ (GithubRequestMethod)requestMethod {
    return GithubRequestMethodGET;
}


- (NSString *)path {
    return @"/user/repos";
}
@end

NS_ASSUME_NONNULL_END
