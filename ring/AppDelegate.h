//
//  AppDelegate.h
//  ring
//
//  Created by Steven on 13-4-3.
//  Copyright (c) 2013年 Steven. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MainViewController;
@class DDMenuController;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) DDMenuController *menuController;

@property (strong, nonatomic) MainViewController *mainViewController;

@end
