//
//  LYZKeychainManager.m
//  LYZKeychain
//
//  Created by liyazhou on 16/11/8.
//  Copyright © 2016年 liyazhou. All rights reserved.
//

#import "LYZKeychainManager.h"
#import <KeychainItemWrapper.h>

@interface LYZKeychainManager ()

@property (nonatomic, strong) KeychainItemWrapper *wrapper;
@end

@implementation LYZKeychainManager

+ (instancetype)defaultManager
{
    static LYZKeychainManager *manager = nil;
    static dispatch_once_t once;
    _dispatch_once(&once, ^{
        manager = [[LYZKeychainManager alloc]init];
        manager.wrapper = [[KeychainItemWrapper alloc]initWithIdentifier:@"login" accessGroup:@"my group"];
    });
    return manager;
}

//读取
- (id)objectForKey:(NSString *)key
{
    return [self.wrapper objectForKey:key];
}

//添加
- (void)setObject:(id)object forKey:(NSString *)key
{
    [self.wrapper setObject:object forKey:key];
    [self.wrapper setObject:object forKey:(__bridge id)(kSecAttrAccount)];// 2
    [self.wrapper setObject:object forKey:(__bridge id)(kSecValueData)];
}


@end
