//
//  RepositoryInfoViewFields.h
//  sb
//
//  Created by Admin on 10/25/19.
//  Copyright © 2019 com. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface RepositoryInfoViewFields : NSObject
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *repoDescription;
@property (nonatomic, strong) NSString *author;
@property (nonatomic, strong) NSString *forks;
@property (nonatomic, strong) NSString *watchers;
@end

NS_ASSUME_NONNULL_END
