//
//  User.h
//  ring
//
//  Created by Li Kaihua on 13-4-29.
//  Copyright (c) 2013年 Steven. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KeychainItemWrapper.h"

@interface User : NSObject{
@private
    NSString *username;
@private
    NSString *password;
    KeychainItemWrapper *wrapper;
}
-(User *) initWithUsernameandPassword:(NSString *)uName Password:(NSString *)passwd;
-(NSString *) getUsername;
-(void) setUsername:(NSString *) uName;
-(NSString *) getPasswd;
-(void) setPasswd:(NSString *) passwd;
-(void) saveToKeyChain;
-(BOOL *) readFromKeyChain;
-(Boolean *) checkUserExist:(NSString *) uName;
-(Boolean *) remove;
@property (nonatomic, retain) KeychainItemWrapper *wrapper;
@end
