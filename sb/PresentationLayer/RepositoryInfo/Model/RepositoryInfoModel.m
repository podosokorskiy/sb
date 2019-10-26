//
//  RepositoryInfoModel.m
//  sb
//
//  Created by Slava Podosokorskiy on 10/25/19.
//  Copyright © 2019 com. All rights reserved.
//

#import "RepositoryInfoModel.h"
#import "RepositoryInfoModelOutput.h"

#import "RemoteRequestService.h"


NS_ASSUME_NONNULL_BEGIN

@interface RepositoryInfoModel()
@end

@implementation RepositoryInfoModel
- (instancetype)initWithOutput:(id<RepositoryInfoModelOutput>)output {
    self = [super init];
    
    if (self) {
        _output = output;
    }
    
    return self;
}


#pragma mark - RepositoryInfoModelInput
- (void)receiveUserAvatarImageDataWithUrl:(NSString *)avatarUrl {
    NSURL *url = [NSURL URLWithString:avatarUrl];
    
    if (url != nil) {
        __weak typeof(self) welf = self;
        [self.remoteRequestService getFromUrl:url
                                      headers:@{}
                              completionBlock:^(NSURLResponse * _Nullable responseUrl, NSData * _Nullable data, NSError * _Nullable error) {
                                  dispatch_async(dispatch_get_main_queue(), ^{
                                      [welf.output didReceiveUserAvatarImageData:data];
                                  });
        }];
    }
}
@end

NS_ASSUME_NONNULL_END
