//
//  LYZKeychainManager.h
//  LYZKeychain
//
//  Created by liyazhou on 16/11/8.
//  Copyright © 2016年 liyazhou. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LYZKeychainManager : NSObject

+ (instancetype)defaultManager;

//读取
- (id)objectForKey:(NSString *)key;

//添加
- (void)setObject:(id)object forKey:(NSString *)key;

@end
