//
//  GithubCommitsRequestEntity.m
//  sb
//
//  Created by Slava Podosokorskiy on 10/24/19.
//  Copyright © 2019 com. All rights reserved.
//

#import "GithubCommitsRequestEntity.h"
#import "GithubCommitsResponseEntity.h"

NS_ASSUME_NONNULL_BEGIN

@interface GithubCommitsRequestEntity()
@property (nonatomic, strong) NSString *user;
@property (nonatomic, strong) NSString *repo;
@property (nonatomic, assign) NSUInteger page;
@end


@implementation GithubCommitsRequestEntity
- (instancetype)initWithUser:(NSString *)user
                        repo:(NSString *)repo
                        page:(NSUInteger)page {
    self = [super init];
    if (self) {
        _user = user;
        _repo = repo;
        _page = page;
    }
    return self;
}


- (NSString *)pathParameters {
    return [NSString stringWithFormat:@"?page=%lu", (unsigned long)self.page];
}


+ (Class)responseClass {
    return [GithubCommitsResponseEntity class];
}


+ (GithubRequestMethod)requestMethod {
    return GithubRequestMethodGET;
}


- (NSString *)path {
    NSString *path = [NSString stringWithFormat:@"/repos/%@/%@/commits", self.user, self.repo];
    
    return path;
}
@end

NS_ASSUME_NONNULL_END
