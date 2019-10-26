//
//  CommitsElementViewFields.h
//  sb
//
//  Created by Slava Podosokorskiy on 10/25/19.
//  Copyright © 2019 com. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CommitsElementViewFields : NSObject
@property (nonatomic, strong) NSString *commitHash;
@property (nonatomic, strong) NSString *author;
@property (nonatomic, strong) NSString *message;
@property (nonatomic, strong) NSString *date;
@end

NS_ASSUME_NONNULL_END
