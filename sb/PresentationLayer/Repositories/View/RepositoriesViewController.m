//
//  RepositoriesViewController.m
//  sb
//
//  Created by Slava Podosokorskiy on 10/25/19.
//  Copyright © 2019 com. All rights reserved.
//

#import "RepositoriesViewController.h"
#import "RepositoriesPresenter.h"
#import "RepositoryInfoViewController.h"
#import "RepositoriesTableViewCell.h"
#import "RepositoriesViewFields.h"
#import "GithubRepositoriesResponseEntity.h"


NS_ASSUME_NONNULL_BEGIN

static NSString *const kRepositoriesTableViewCellIdentifier = @"RepositoriesTableViewCell";


@interface RepositoriesViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIView *noRepositoriesView;
@property (weak, nonatomic) IBOutlet UIButton *nextButton;
@property (weak, nonatomic) IBOutlet UIButton *prevButton;

@property (nonatomic, strong) RepositoriesViewFields *viewFields;
@end

@implementation RepositoriesViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIBarButtonItem *logOutNavButton = [[UIBarButtonItem alloc] initWithTitle:@"Log out"
                                                                        style:UIBarButtonItemStylePlain
                                                                       target:self
                                                                       action:@selector(didPressLogoutNavigationButton)];
    [self.navigationItem setLeftBarButtonItem:logOutNavButton];
    
    self.output = [[RepositoriesPresenter alloc] initWithView:self repositories:self.repositories];
    
    [self updateUI];
}


- (void)didPressLogoutNavigationButton {
    [self.output logout];
    
    [self.navigationController popToRootViewControllerAnimated:YES];
}


- (IBAction)didPressPrevPageButton:(id)sender {
    [self.output loadPrevPage];
}


- (IBAction)didPressNextPageButton:(id)sender {
    [self.output loadNextPage];
}


#pragma mark - TableViewDatasource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    GithubRepositoriesResponseEntity *repositoriesEntity = self.viewFields.repositories;
    return repositoriesEntity.repositories.count;
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    GithubRepositoriesResponseEntity *repositoriesEntity = self.viewFields.repositories;
    GithubRepositoryEntity *repository = repositoriesEntity.repositories[indexPath.row];
    
    RepositoriesTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kRepositoriesTableViewCellIdentifier];
    cell.nameLabel.text = repository.name;
    
    return cell;
}


#pragma mark - TableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    GithubRepositoriesResponseEntity *repositoriesEntity = self.viewFields.repositories;
    GithubRepositoryEntity *repository = repositoriesEntity.repositories[indexPath.row];
    
    [self presentRepositoryInfoWithRepository:repository];
}


#pragma mark - RepositoriesViewInput
- (void)updateWithViewEntity:(RepositoriesViewFields *)viewEntity {
    self.viewFields = viewEntity;
    self.nextButton.enabled = viewEntity.nextPageAvailable;
    self.prevButton.enabled = viewEntity.prevPageAvailable;
    
    [self.tableView reloadData];
}


#pragma mark - Navigation
- (void)presentRepositoryInfoWithRepository:(GithubRepositoryEntity *)repository {
    RepositoryInfoViewController *repositoryInfoViewController = [self.wireframe createRepositoryInfoViewController];
    repositoryInfoViewController.repository = repository;
    [self pushViewController:repositoryInfoViewController];
}


#pragma mark - Private
- (void)updateUI {
    GithubRepositoriesResponseEntity *repositoriesEntity = self.viewFields.repositories;

    self.tableView.hidden = (repositoriesEntity.repositories.count == 0);
    self.noRepositoriesView.hidden = !self.tableView.isHidden;
}
@end

NS_ASSUME_NONNULL_END
