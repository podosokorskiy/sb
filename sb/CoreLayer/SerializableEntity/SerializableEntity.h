//
//  SerializableEntity.h
//  sb
//
//  Created by Slava Podosokorskiy on 10/24/19.
//  Copyright © 2019 com. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SerializableEntity : NSObject
// @virtual
- (instancetype)initWithArray:(NSArray<id> *)array error:(NSError **)error;
- (instancetype)initWithDictionary:(NSDictionary<NSString *, id> *)dictionary error:(NSError **)error;
- (BOOL)validateDictionary:(NSDictionary <NSString *, id> *)dictionary;
- (BOOL)validateEntity;

// deserialization:
- (BOOL)getNumber:(NSNumber * _Nullable * _Nonnull)number
           forKey:(NSString *)key
     inDictionary:(NSDictionary<NSString *, id> *)dictionary
        nullValid:(BOOL)nullValid
            error:(NSError **)error;

- (BOOL)getString:(NSString * _Nullable * _Nonnull)number
           forKey:(NSString *)key
     inDictionary:(NSDictionary<NSString *, id> *)dictionary
        nullValid:(BOOL)nullValid
            error:(NSError **)error;

- (BOOL)getDate:(NSDate * _Nullable * _Nonnull)date
         forKey:(NSString *)key
   inDictionary:(NSDictionary<NSString *, id> *)dictionary
      nullValid:(BOOL)nullValid
          error:(NSError **)error;
@end

NS_ASSUME_NONNULL_END
