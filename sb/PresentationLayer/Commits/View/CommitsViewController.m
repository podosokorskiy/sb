//
//  CommitsViewController.m
//  sb
//
//  Created by Slava Podosokorskiy on 10/25/19.
//  Copyright © 2019 com. All rights reserved.
//

#import "CommitsViewController.h"
#import "CommitsPresenter.h"

#import "CommitsTableViewCell.h"
#import "CommitsViewFields.h"
#import "CommitsElementViewFields.h"


NS_ASSUME_NONNULL_BEGIN

static NSString *const kCommitsTableViewCellIdentifier = @"CommitsTableViewCell";


@interface CommitsViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIButton *nextButton;
@property (weak, nonatomic) IBOutlet UIButton *prevButton;

@property (nonatomic, strong) CommitsViewFields *viewFields;
@end

@implementation CommitsViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.output = [[CommitsPresenter alloc] initWithView:self
                                          repositoryName:self.repositoryName
                                        repositoryAuthor:self.repositoryAuthor];
}


- (IBAction)didPressPrevPageButton:(id)sender {
    [self.output loadPrevPage];
}


- (IBAction)didPressNextPageButton:(id)sender {
    [self.output loadNextPage];
}


#pragma mark - TableViewDatasource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.viewFields.commits.count;
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CommitsElementViewFields *commitElement = self.viewFields.commits[indexPath.row];
    
    CommitsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCommitsTableViewCellIdentifier];
    cell.commitHashLabel.text = commitElement.commitHash;
    cell.authorLabel.text = commitElement.author;
    cell.dateLabel.text = commitElement.date;
    cell.messageLabel.text = commitElement.message;
    
    return cell;
}

#pragma mark - CommitsViewInput
- (void)updateViewWithViewEntity:(CommitsViewFields *)viewEntity {
    self.viewFields = viewEntity;
    self.nextButton.enabled = viewEntity.nextPageAvailable;
    self.prevButton.enabled = viewEntity.prevPageAvailable;
    
    self.tableView.hidden = (self.viewFields.commits.count == 0);
    
    [self.tableView reloadData];
}
@end

NS_ASSUME_NONNULL_END
