//
//  AuthorizationViewController.m
//  sb
//
//  Created by Slava Podosokorskiy on 10/24/19.
//  Copyright © 2019 com. All rights reserved.
//

#import "AuthorizationViewController.h"
#import "AuthorizationPresenter.h"

#import "RepositoriesViewController.h"
#import "GithubRepositoriesResponseEntity.h"


NS_ASSUME_NONNULL_BEGIN

@interface AuthorizationViewController ()
@property (weak, nonatomic) IBOutlet UITextField *loginTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (weak, nonatomic) IBOutlet UIButton *loginButton;
@end


@implementation AuthorizationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.output = [[AuthorizationPresenter alloc] initWithView:self];
}


- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.passwordTextField.text = nil;
    self.loginButton.enabled = NO;
    
    [self updateUI];
}


- (IBAction)didPressLoginButton:(id)sender {
    [self authorize];
}


- (IBAction)textFieldChanged:(UITextField *)sender {
    self.loginButton.enabled = [self signInAvailable];
}


- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if (textField == self.loginTextField) {
        if ([self.passwordTextField canBecomeFirstResponder]) {
            [self.passwordTextField becomeFirstResponder];
        }
    }
    
    if (textField == self.passwordTextField) {
        if ([self signInAvailable]) {
            [self authorize];
        }
    }
    
    return NO;
}


#pragma mark - AuthorizationViewInput
#pragma mark - Navigation
- (void)presentRepositoriesWithRepositoryList:(GithubRepositoriesResponseEntity *)repositoryList {
    RepositoriesViewController *repositoriesViewController = [self.wireframe createRepositoriesViewController];
    repositoriesViewController.repositories = repositoryList;
    [self pushViewController:repositoriesViewController];
}


#pragma mark - Private
- (void)updateUI {
    // Fixing autolayout problems for disabled autocorrection and secureentry textfields
    self.loginTextField.inputAssistantItem.leadingBarButtonGroups = @[];
    self.loginTextField.inputAssistantItem.trailingBarButtonGroups = @[];
    self.passwordTextField.inputAssistantItem.leadingBarButtonGroups = @[];
    self.passwordTextField.inputAssistantItem.trailingBarButtonGroups = @[];
}


- (BOOL)signInAvailable {
    return (self.loginTextField.text.length > 0) && (self.passwordTextField.text.length > 0);
}


- (void)authorize {
    [self.view endEditing:YES];
    [self.output authorizeWithLogin:self.loginTextField.text password:self.passwordTextField.text];
}
@end

NS_ASSUME_NONNULL_END
