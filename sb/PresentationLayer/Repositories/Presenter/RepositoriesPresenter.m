//
//  RepositoriesPresenter.m
//  sb
//
//  Created by Slava Podosokorskiy on 10/25/19.
//  Copyright © 2019 com. All rights reserved.
//

#import "RepositoriesPresenter.h"
#import "RepositoriesModel.h"
#import "RepositoriesViewInput.h"
#import "ErrorConvertionService.h"

#import "RepositoriesViewFields.h"
#import "GithubRepositoriesResponseEntity.h"


NS_ASSUME_NONNULL_BEGIN

@interface RepositoriesPresenter()
@property (nonatomic, assign) NSUInteger lastPage;
@property (nonatomic, assign) NSUInteger currentPage;
@end


@implementation RepositoriesPresenter
- (instancetype)initWithView:(id<RepositoriesViewInput>)view repositories:(GithubRepositoriesResponseEntity *)repositories {
    self = [super init];
    if (self) {
        _view = view;
        _model = [[RepositoriesModel alloc] initWithOutput:self];
        _lastPage = repositories.lastPage;
        _currentPage = 1;
        [self didLoadRepositoriesWithResponse:repositories];
    }
    return self;
}


#pragma mark - AbstractViewOutput
- (void)loadNextPage {
    NSUInteger nextPage = self.currentPage + 1;
    
    if (nextPage <= self.lastPage) {
        [self.model loadRepositoryListWithPage:nextPage];
        self.currentPage = nextPage;
    }
}


- (void)loadPrevPage {
    NSUInteger prevPage = self.currentPage - 1;
    
    if (prevPage > 0) {
        [self.model loadRepositoryListWithPage:prevPage];
        self.currentPage = prevPage;
    }
}


- (void)logout {
    [self.model logout];
}


#pragma mark - RepositoriesModelOutput
- (void)didNotLoadRepositoriesWithError:(NSError *)error {
    NSParameterAssert(error != nil);
    
    NSString *errorText = [ErrorConvertionService errorTextFromError:error];
    
    [self.view showErrorText:errorText];
}


- (void)didLoadRepositoriesWithResponse:(GithubRepositoriesResponseEntity *)response {
    self.lastPage = response.lastPage;
    
    RepositoriesViewFields *viewFields = [[RepositoriesViewFields alloc] init];
    viewFields.repositories = response;
    viewFields.nextPageAvailable = self.currentPage < self.lastPage;
    viewFields.prevPageAvailable = self.currentPage > 1;
    
    [self.view updateWithViewEntity:viewFields];
}


#pragma mark - AbstractModelOutput
- (void)didStartOperation:(NSString *)operation {
    [self.view startProgressWithText:operation];
}


- (void)didEndOperation {
    [self.view stopProgress];
}
@end

NS_ASSUME_NONNULL_END
