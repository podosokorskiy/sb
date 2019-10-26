//
//  AbstractViewController.m
//  sb
//
//  Created by Slava Podosokorskiy on 10/25/19.
//  Copyright © 2019 com. All rights reserved.
//

#import "AbstractViewController.h"
#import "Wireframe.h"


NS_ASSUME_NONNULL_BEGIN

@interface AbstractViewController ()
@property (nonatomic, strong) UIView *loadingIndicatorWrapperView;
@property (nonatomic, strong) UIActivityIndicatorView *loadingIndicator;
@property (nonatomic, strong) UILabel *loadingTextLabel;
@end

@implementation AbstractViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Back"
                                                                             style:UIBarButtonItemStylePlain
                                                                            target:nil
                                                                            action:nil];
    
    [self createLoadingIndicator];
}


- (Wireframe *)wireframe {
    return [Wireframe sharedInstance];
}


- (void)pushViewController:(UIViewController *)viewController {
    for (UIViewController *existingViewController in self.navigationController.viewControllers) {
        if (existingViewController.class == viewController.class) {
            return;
        }
    }
    
    [self.navigationController pushViewController:viewController animated:YES];
}

- (void)showErrorText:(NSString *)errorText {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Error occurred"
                                                                   message:errorText
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *defaultAction = [UIAlertAction actionWithTitle:@"OK"
                                                            style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction * action) {}];
    
    [alert addAction:defaultAction];
    
    [self presentViewController:alert animated:YES completion:nil];
}


- (void)startProgressWithText:(NSString *)progressText {
    self.loadingTextLabel.text = progressText;
    self.loadingIndicatorWrapperView.hidden = NO;
}


- (void)stopProgress {
    self.loadingTextLabel.text = nil;
    self.loadingIndicatorWrapperView.hidden = YES;
}


#pragma mark - Private
- (void)createLoadingIndicator {
    // Loading indicator wrapper:
    self.loadingIndicatorWrapperView = [[UIView alloc] initWithFrame:self.view.frame];
    self.loadingIndicatorWrapperView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.5];
    self.loadingIndicatorWrapperView.hidden = YES;
    
    // Loading indicator (activity):
    self.loadingIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    [self.loadingIndicator setCenter:CGPointMake(self.loadingIndicatorWrapperView.frame.size.width / 2.0, self.loadingIndicatorWrapperView.frame.size.height / 2.0)];
    [self.loadingIndicator startAnimating];
    
    // Label:
    CGFloat padding = 20.0;
    CGRect labelFrame = CGRectMake(0,
                                   self.loadingIndicator.frame.origin.y + self.loadingIndicator.frame.size.height + padding,
                                   self.view.frame.size.width, padding);
    self.loadingTextLabel = [[UILabel alloc] initWithFrame:labelFrame];
    self.loadingTextLabel.textAlignment = NSTextAlignmentCenter;
    self.loadingTextLabel.textColor = [UIColor whiteColor];
    
    // Adding subviews:
    [self.loadingIndicatorWrapperView addSubview:self.loadingTextLabel];
    [self.loadingIndicatorWrapperView addSubview:self.loadingIndicator];
    [self.view addSubview:self.loadingIndicatorWrapperView];
}
@end

NS_ASSUME_NONNULL_END
