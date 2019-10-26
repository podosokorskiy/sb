//
//  RepositoryInfoViewController.m
//  sb
//
//  Created by Slava Podosokorskiy on 10/25/19.
//  Copyright © 2019 com. All rights reserved.
//

#import "RepositoryInfoViewController.h"
#import "RepositoryInfoPresenter.h"
#import "CommitsViewController.h"
#import "GithubRepositoryAuthorEntity.h"
#import "RepositoryInfoViewFields.h"


NS_ASSUME_NONNULL_BEGIN

@interface RepositoryInfoViewController ()
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;
@property (weak, nonatomic) IBOutlet UIImageView *avatarImageView;
@property (weak, nonatomic) IBOutlet UILabel *authorLabel;
@property (weak, nonatomic) IBOutlet UILabel *forksLabel;
@property (weak, nonatomic) IBOutlet UILabel *watchersLabel;

@property (weak, nonatomic) IBOutlet UIView *avatarFallbackView;
@end

@implementation RepositoryInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.output = [[RepositoryInfoPresenter alloc] initWithView:self repository:self.repository];

    [self updateUI];
}


- (IBAction)didPressCommitsButton:(id)sender {
    [self presentCommitHistory];
}


#pragma mark - RepositoryInfoViewInput
- (void)updateViewWithViewEntity:(RepositoryInfoViewFields *)viewEntity {
    self.titleLabel.text = viewEntity.name;
    self.descriptionLabel.text = viewEntity.repoDescription;
    self.authorLabel.text = viewEntity.author;
    self.forksLabel.text = viewEntity.forks;
    self.watchersLabel.text = viewEntity.watchers;
}


- (void)updateAvatarWithData:(NSData *)data {
    UIImage *image = [UIImage imageWithData:data];
    
    if (image != nil) {
        self.avatarFallbackView.backgroundColor = [UIColor clearColor];
        self.avatarImageView.image = image;
    }
}


#pragma mark - Navigation
- (void)presentCommitHistory {
    CommitsViewController *commitsViewController = [self.wireframe createCommitsViewController];
    commitsViewController.repositoryName = self.repository.name;
    commitsViewController.repositoryAuthor = self.repository.author.name;
    [self.navigationController pushViewController:commitsViewController animated:YES];
}


#pragma mark - Private
- (void)updateUI {
    self.avatarFallbackView.layer.cornerRadius = self.avatarFallbackView.frame.size.width / 2.0;
}
@end

NS_ASSUME_NONNULL_END
