//
//  User.m
//  ring
//
//  Created by Li Kaihua on 13-4-29.
//  Copyright (c) 2013年 Steven. All rights reserved.
//

#import "User.h"

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
}

-(User *) readFromKeyChain{
    User *user = [[User alloc] initWithUsernameandPassword:@"" Password:@""];
    return user;
    
    //need implementation
}

-(Boolean *) checkUserExist:(NSString *)uName{
    return false;
    //need implementation
}

-(Boolean *) remove{
    return true;
    
    //need implementation
}

@end
