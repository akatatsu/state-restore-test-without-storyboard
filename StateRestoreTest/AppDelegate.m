//
//  AppDelegate.m
//  StateRestoreTest
//
//  Created by Tatsuhiko Akashi on 2014/10/06.
//  Copyright (c) 2014年 akatatsu. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "ModalViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application willFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [self commonLaunchInitialization:launchOptions];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

#pragma mark - State Preservation methods

-(BOOL)application:(UIApplication *)application shouldRestoreApplicationState:(NSCoder *)coder
{
    NSLog(@"restore");
    return YES;
}

-(BOOL)application:(UIApplication *)application shouldSaveApplicationState:(NSCoder *)coder
{
    NSLog(@"save");
    return YES;
}

- (void) commonLaunchInitialization:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    ViewController* main = [[ViewController alloc] init];
    UINavigationController* nav = [[UINavigationController alloc] initWithRootViewController:main];
    nav.navigationBar.translucent = NO;
    nav.restorationIdentifier = @"Nav";
    
    self.window.rootViewController = nav;
    [self.window makeKeyAndVisible];
}

- (UIViewController *)application:(UIApplication *)application viewControllerWithRestorationIdentifierPath:(NSArray *)identifierComponents
                            coder:(NSCoder *)coder
{
    UIViewController* vc = nil;
    NSString* rid = [identifierComponents lastObject];
    NSLog(@"restoring %@", rid);
    if ([rid isEqualToString: @"ViewController"]) {
        ViewController* modal = [[ViewController alloc] init];
        UINavigationController *nc = [[UINavigationController alloc] initWithRootViewController:modal];
        nc.restorationIdentifier = @"Nav";
        return nc;
    }
    
    
    if ([rid isEqualToString: @"ModalNC"]) {
        ModalViewController* modal = [[ModalViewController alloc] init];
        UINavigationController *nc = [[UINavigationController alloc] initWithRootViewController:modal];
        nc.restorationIdentifier = @"ModalNC";
        
        return nc;
    }
    
    Class class = NSClassFromString(rid);//rid
    vc = [[class alloc] initWithNibName: nil bundle: nil];
    if (!vc.restorationIdentifier) {
        vc.restorationIdentifier = rid;
    }
    
    return vc;

}

@end
