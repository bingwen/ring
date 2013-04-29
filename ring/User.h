//
//  User.h
//  ring
//
//  Created by Li Kaihua on 13-4-29.
//  Copyright (c) 2013年 Steven. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject{
@private
    NSString *username;
    NSString *password;
}
-(User *) initWithUsernameandPassword:(NSString *)uName Password:(NSString *)passwd;
-(NSString *) getUsername;
-(void) setUsername:(NSString *) uName;
-(NSString *) getPasswd;
-(void) setPasswd:(NSString *) passwd;
-(void) saveToKeyChain;
-(User *) readFromKeyChain;
-(Boolean *) checkUserExist:(NSString *) uName;
-(Boolean *) remove;
@end
