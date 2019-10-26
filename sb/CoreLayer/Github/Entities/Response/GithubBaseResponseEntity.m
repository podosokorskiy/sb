//
//  GithubBaseResponseEntity.m
//  sb
//
//  Created by Slava Podosokorskiy on 10/24/19.
//  Copyright © 2019 com. All rights reserved.
//

#import "GithubBaseResponseEntity.h"


NS_ASSUME_NONNULL_BEGIN

@implementation GithubBaseResponseEntity
- (instancetype)initWithArray:(NSArray<id> *)array lastPage:(NSUInteger)lastPage error:(NSError * _Nullable __autoreleasing *)error {
    self = [super initWithArray:array error:error];
    
    if (self) {
        _lastPage = lastPage;
    }
    
    return self;
}
@end

NS_ASSUME_NONNULL_END
