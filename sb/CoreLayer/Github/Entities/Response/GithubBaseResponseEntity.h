//
//  GithubBaseResponseEntity.h
//  sb
//
//  Created by Slava Podosokorskiy on 10/24/19.
//  Copyright © 2019 com. All rights reserved.
//

#import "SerializableEntity.h"

NS_ASSUME_NONNULL_BEGIN

@interface GithubBaseResponseEntity : SerializableEntity
@property (nonatomic, assign) NSUInteger lastPage;

- (instancetype)initWithArray:(NSArray<id> *)array lastPage:(NSUInteger)lastPage error:(NSError * _Nullable __autoreleasing *)error;
@end

NS_ASSUME_NONNULL_END
