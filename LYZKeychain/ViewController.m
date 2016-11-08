//
//  ViewController.m
//  LYZKeychain
//
//  Created by liyazhou on 16/11/8.
//  Copyright © 2016年 liyazhou. All rights reserved.
//

#import "ViewController.h"
#import "LYZKeychainManager.h"
#import <KeychainItemWrapper.h>

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *userTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (strong, nonatomic) LYZKeychainManager *keychainManager;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}
- (IBAction)loginButtonClick:(id)sender
{
    if ([self.userTextField.text isEqualToString:@""] || [self.passwordTextField.text isEqualToString:@""])
    {
        UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:@"提示" message:@"用户名或密码为空" preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
        }];
        [alertVC addAction:action1];
        
        [self presentViewController:alertVC animated:YES completion:nil];
        return;
    }
    
    UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:@"提示" message:@"登录成功" preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        //保存数据
        KeychainItemWrapper *wrapper = [[KeychainItemWrapper alloc]initWithIdentifier:@"login" accessGroup:@"cn.com.modernmedia.LYZKeychain"];
        
        
        //和字典操作基本相同
        [wrapper setObject:self.userTextField.text forKey:(__bridge id)kSecAttrAccount];
        
        //设置这个会报错，不知道为啥
//        [wrapper setObject:(__bridge id)kSecClassGenericPassword forKey:(__bridge id)kSecClassKey];
        [wrapper setObject:self.passwordTextField.text forKey:(__bridge id)kSecValueData];
    }];
    
    [alertVC addAction:action1];
    
    [self presentViewController:alertVC animated:YES completion:nil];
}
- (IBAction)readUserInfo:(id)sender
{
    //读取数据
    KeychainItemWrapper *wrapper = [[KeychainItemWrapper alloc]initWithIdentifier:@"login" accessGroup:@"cn.com.modernmedia.LYZKeychain"];
    self.userTextField.text = [wrapper objectForKey:(__bridge id)kSecAttrAccount];
    self.passwordTextField.text = [wrapper objectForKey:(__bridge id)kSecValueData];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
