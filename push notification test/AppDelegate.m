//
//  AppDelegate.m
//  push notification test
//
//  Created by Danilo Viana on 07/01/15.
//  Copyright (c) 2015 SERPRO. All rights reserved.
//

#import "AppDelegate.h"
#import <asl.h>

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    //Registra o aplicativo para receber notificações push
    
    [application registerForRemoteNotifications];
    
    return YES;
}

- (void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error {
    //Chamado se o registro para receber notificações push falhou
    asl_log_message(ASL_LEVEL_WARNING, "Falhou ao tentar obter token de push notifications");
}

- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
    //Chamado se o registro para receber notificações foi um sucesso. Atributo deviceToken contém o token gerado e deve ser enviado para o servidor para que mais tarde ele envie as notificações
    asl_log_message(ASL_LEVEL_INFO, "Token gerado: %s",[[deviceToken description] UTF8String] );
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo {
    //Chamado quando a aplicação recebe uma notificação remota
    asl_log_message(ASL_LEVEL_INFO, "Notificação recebida: %s",[[userInfo description] UTF8String] );
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

@end
