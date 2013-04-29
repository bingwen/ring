//
//  User.m
//  ring
//
//  Created by Li Kaihua on 13-4-29.
//  Copyright (c) 2013年 Steven. All rights reserved.
//

#import "User.h"
#import "KeychainItemWrapper.h"
#import <Security/Security.h>
#import <Security/SecItem.h>

@implementation User
-(User *) initWithUsernameandPassword:(NSString *)uName Password:(NSString *)passwd{
    self = [super init];
    if(self){
        [self setUsername:uName];
        [self setPasswd:passwd];
    }
    
    return self;
}

-(NSString *)getUsername{
    return username;
}

-(void) setUsername:(NSString *)uName{
    username = uName;
}

-(NSString *)getPasswd{
    return password;
}

-(void)setPasswd:(NSString *)passwd{
    password = passwd;
}

-(void) saveToKeyChain{
    //need implementation
    [wrapper setObject:username forKey:(id)CFBridgingRelease(kSecAttrAccount)];
    [wrapper setObject:password forKey:(id)CFBridgingRelease(kSecValueData)];
    
    
}

-(void) readFromKeyChain{
    self->username = [wrapper objectForKey:(id)CFBridgingRelease(kSecAttrAccount)];
    self->password = [wrapper objectForKey:(id)CFBridgingRelease(kSecValueData)];
    
    
    //need implementation
}

-(Boolean *) checkUserExist:(NSString *)uName{
    return FALSE;
    //need implementation
}

-(Boolean *) remove{
    [wrapper resetKeychainItem]; 
    
    return FALSE;
    
    //need implementation
}

@end
