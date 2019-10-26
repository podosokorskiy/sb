//
//  SerializableEntity.m
//  sb
//
//  Created by Slava Podosokorskiy on 10/24/19.
//  Copyright © 2019 com. All rights reserved.
//

#import "SerializableEntity.h"

NS_ASSUME_NONNULL_BEGIN

@implementation SerializableEntity
- (instancetype)initWithArray:(NSArray<id> *)array error:(NSError **)error {
    self = [super init];
    
    return self;
}


- (instancetype)initWithDictionary:(NSDictionary<NSString *, id> *)dictionary error:(NSError **)error {
    self = [super init];
    
    return self;
}


- (BOOL)validateDictionary:(NSDictionary <NSString *, id> *)dictionary {
    return YES;
}


- (BOOL)validateEntity {
    return YES;
}


- (BOOL)getNumber:(NSNumber * _Nullable * _Nonnull)number forKey:(NSString *)key inDictionary:(NSDictionary<NSString *, id> *)dictionary nullValid:(BOOL)nullValid error:(NSError **)error {
    NSParameterAssert(number != nil);
    NSParameterAssert(key != nil);
    NSParameterAssert(dictionary != nil);
    
    id object = [self objectForKey:key inDictionary:dictionary];
    
    if (object == nil) {
        if (nullValid) {
            return YES;
        } else {
            return NO;
        }
    }
    
    if (![object isKindOfClass:[NSNumber class]]) {
        return NO;
    }
    
    *number = object;
    
    return YES;
}


- (BOOL)getString:(NSString * _Nullable * _Nonnull)number forKey:(NSString *)key inDictionary:(NSDictionary<NSString *, id> *)dictionary nullValid:(BOOL)nullValid error:(NSError **)error {
    NSParameterAssert(number != nil);
    NSParameterAssert(key != nil);
    NSParameterAssert(dictionary != nil);
    
    id object = [self objectForKey:key inDictionary:dictionary];
    
    if (object == nil) {
        if (nullValid) {
            return YES;
        } else {
            return NO;
        }
    }
    
    if (![object isKindOfClass:[NSString class]]) {
        return NO;
    }
    
    *number = object;
    
    return YES;
}


- (BOOL)getDate:(NSDate * _Nullable * _Nonnull)date forKey:(NSString *)key inDictionary:(NSDictionary<NSString *, id> *)dictionary nullValid:(BOOL)nullValid error:(NSError **)error {
    NSParameterAssert(date != nil);
    NSParameterAssert(key != nil);
    NSParameterAssert(dictionary != nil);
    
    id object = [self objectForKey:key inDictionary:dictionary];
    
    if (object == nil) {
        if (nullValid) {
            return YES;
        } else {
            return NO;
        }
    }
    
    if (![object isKindOfClass:[NSString class]]) {
        return NO;
    }
    
    NSDate *result = [self dateFormatterDateFromJSONString:object];
    if (result == nil) {
        return NO;
    }
    
    *date = result;
    
    return YES;
}

#pragma mark - Private
- (nullable id)objectForKey:(NSString *)key inDictionary:(NSDictionary<NSString *, id> *)dictionary {
    NSParameterAssert(key != nil);
    NSParameterAssert(dictionary != nil);
    
    id object = nil;
    id objectValue = dictionary[key];
    if (objectValue != nil && ![objectValue isEqual:[NSNull null]]) {
        object = objectValue;
    }
    return object;
}


- (nullable NSDate *)dateFormatterDateFromJSONString:(NSString *)jsonString {
    NSParameterAssert(jsonString != nil);
    
    static NSDateFormatter *dateFormatter = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setLocale:[NSLocale localeWithLocaleIdentifier:@"en_US_POSIX"]];
        [dateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ssZ"];
    });
    
    NSDate *dateFromJSONString = [dateFormatter dateFromString:jsonString];

    return dateFromJSONString;
}
@end

NS_ASSUME_NONNULL_END
