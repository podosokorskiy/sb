//
//  AbstractViewController.h
//  sb
//
//  Created by Slava Podosokorskiy on 10/25/19.
//  Copyright © 2019 com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Wireframe.h"
#import "AbstractViewInput.h"


NS_ASSUME_NONNULL_BEGIN

@interface AbstractViewController : UIViewController<AbstractViewInput>
@property (nonatomic, strong) Wireframe *wireframe;

- (void)pushViewController:(UIViewController *)viewController;
@end

NS_ASSUME_NONNULL_END
