//
//  CommitsViewFields.h
//  sb
//
//  Created by Slava Podosokorskiy on 10/25/19.
//  Copyright © 2019 com. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class CommitsElementViewFields;

@interface CommitsViewFields : NSObject
@property (nonatomic, strong) NSArray<CommitsElementViewFields *> *commits;
@property (nonatomic, assign) BOOL prevPageAvailable;
@property (nonatomic, assign) BOOL nextPageAvailable;
@end

NS_ASSUME_NONNULL_END
