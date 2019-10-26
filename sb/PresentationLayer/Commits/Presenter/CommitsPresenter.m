//
//  CommitsPresenter.m
//  sb
//
//  Created by Slava Podosokorskiy on 10/25/19.
//  Copyright © 2019 com. All rights reserved.
//

#import "CommitsPresenter.h"
#import "CommitsModel.h"
#import "CommitsViewInput.h"

#import "ErrorConvertionService.h"

#import "GithubCommitsResponseEntity.h"
#import "GithubCommitEntity.h"

#import "CommitsViewFields.h"
#import "CommitsElementViewFields.h"


NS_ASSUME_NONNULL_BEGIN

static NSUInteger kMaxCommitHashLength = 8;
static NSUInteger kMaxCommitMessageLength = 50;

@interface CommitsPresenter()
@property (nonatomic, strong) NSDateFormatter *dateFormatter;
@property (nonatomic, assign) NSUInteger lastPage;
@property (nonatomic, assign) NSUInteger currentPage;
@end

@implementation CommitsPresenter
- (instancetype)initWithView:(id<CommitsViewInput>)view repositoryName:(NSString *)repositoryName repositoryAuthor:(NSString *)repositoryAuthor {
    self = [super init];
    if (self) {
        _view = view;
        _model = [[CommitsModel alloc] initWithOutput:self repositoryName:repositoryName repositoryAuthor:repositoryAuthor];
        _dateFormatter = [[NSDateFormatter alloc] init];
        _dateFormatter.dateFormat = @"dd.MM.yyyy HH:mm";
        _lastPage = 1;
        _currentPage = 1;
    }
    return self;
}

#pragma mark - CommitsViewOutput
- (void)loadNextPage {
    NSUInteger nextPage = self.currentPage + 1;
    
    if (nextPage <= self.lastPage) {
        [self.model loadCommitHistoryWithPage:nextPage];
        self.currentPage = nextPage;
    }
}


- (void)loadPrevPage {
    NSUInteger prevPage = self.currentPage - 1;
    
    if (prevPage > 0) {
        [self.model loadCommitHistoryWithPage:prevPage];
        self.currentPage = prevPage;
    }
}


#pragma mark - CommitsModelOutput
- (void)didNotLoadCommitsWithError:(NSError *)error {
    NSParameterAssert(error != nil);
    
    NSString *errorText = [ErrorConvertionService errorTextFromError:error];
    
    [self.view showErrorText:errorText];
}


- (void)didLoadCommitsWithResponse:(GithubCommitsResponseEntity *)response {
    NSParameterAssert(response != nil);
    
    self.lastPage = response.lastPage;
    
    CommitsViewFields *viewFields = [self viewFieldsFromResponse:response];
    
    [self.view updateViewWithViewEntity:viewFields];
}


#pragma mark - AbstractModelOutput
- (void)didStartOperation:(NSString *)operation {
    [self.view startProgressWithText:operation];
}


- (void)didEndOperation {
    [self.view stopProgress];
}


#pragma mark - Private.Convertion
- (CommitsViewFields *)viewFieldsFromResponse:(GithubCommitsResponseEntity *)response {
    NSParameterAssert(response != nil);
    
    CommitsViewFields *viewFields = [[CommitsViewFields alloc] init];
    
    NSMutableArray<CommitsElementViewFields *> *commitElements = [[NSMutableArray alloc] init];
    
    for (GithubCommitEntity *commitEntity in response.commits) {
        CommitsElementViewFields *commitViewFields = [[CommitsElementViewFields alloc] init];
        commitViewFields.commitHash = [commitEntity.commitHash substringToIndex:MIN(commitEntity.commitHash.length, kMaxCommitHashLength)];
        commitViewFields.author = [NSString stringWithFormat:@"Author: %@", commitEntity.author];
        commitViewFields.message = [commitEntity.message substringToIndex:MIN(commitEntity.message.length, kMaxCommitMessageLength)];
        commitViewFields.date = [NSString stringWithFormat:@"Date: %@", [self.dateFormatter stringFromDate:commitEntity.date]];
        
        [commitElements addObject:commitViewFields];
    }
    
    viewFields.commits = commitElements;
    viewFields.nextPageAvailable = self.currentPage < self.lastPage;
    viewFields.prevPageAvailable = self.currentPage > 1;
    
    return viewFields;
}
@end

NS_ASSUME_NONNULL_END
