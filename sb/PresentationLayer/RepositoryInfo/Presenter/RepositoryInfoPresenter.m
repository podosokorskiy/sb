//
//  RepositoryInfoPresenter.m
//  sb
//
//  Created by Slava Podosokorskiy on 10/25/19.
//  Copyright © 2019 com. All rights reserved.
//

#import "RepositoryInfoPresenter.h"
#import "RepositoryInfoModel.h"
#import "RepositoryInfoViewInput.h"
#import "RepositoryInfoViewFields.h"

#import "GithubRepositoryEntity.h"
#import "GithubRepositoryAuthorEntity.h"


NS_ASSUME_NONNULL_BEGIN

@interface RepositoryInfoPresenter()
@property (nonatomic, strong) GithubRepositoryEntity *repository;
@end

@implementation RepositoryInfoPresenter
- (instancetype)initWithView:(id<RepositoryInfoViewInput>)view repository:(GithubRepositoryEntity *)repository {
    self = [super init];
    if (self) {
        _view = view;
        _model = [[RepositoryInfoModel alloc] initWithOutput:self];
        _repository = repository;
        
        [self prepareViewFields];
    }
    return self;
}


- (void)prepareViewFields {
    RepositoryInfoViewFields *viewFields = [[RepositoryInfoViewFields alloc] init];
    
    viewFields.name = self.repository.name;
    viewFields.repoDescription = self.repository.repoDescription ? self.repository.repoDescription : @"No description";
    viewFields.author = self.repository.author.name;
    viewFields.forks = [NSString stringWithFormat:@"Forks: %lu", (unsigned long)self.repository.forks];
    viewFields.watchers = [NSString stringWithFormat:@"Watchers: %lu", (unsigned long)self.repository.watchers];
    
    if (self.repository.author.avatarUrl != nil) {
        [self.model receiveUserAvatarImageDataWithUrl:self.repository.author.avatarUrl];
    }
    
    [self.view updateViewWithViewEntity:viewFields];
}


#pragma mark - RepositoryInfoModelOutput
- (void)didReceiveUserAvatarImageData:(nullable NSData *)imageData {
    if (imageData != nil) {
        [self.view updateAvatarWithData:imageData];
    }
}
@end

NS_ASSUME_NONNULL_END
