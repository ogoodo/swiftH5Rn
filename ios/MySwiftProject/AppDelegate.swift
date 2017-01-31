//
//  AppDelegate.swift
//  MySwiftProject
//
//  Created by chen on 2016/12/27.
//  Copyright © 2016年 chen. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        self.initTab()
        return true
    }
    private func initTab() {
        //创建ViewController
        let homeVC=WKWebViewController()
        let enjoyVC=WKWebViewController()
        let exploreVC=WKWebViewController()
        let userinfoVC=WKWebViewController()
        
        //设置ViewController在工具栏的图标
        homeVC.tabBarItem.image=UIImage(named: "icon_tab01_normal.png")
        enjoyVC.tabBarItem.image=UIImage(named: "icon_tab02_normal.png")
        exploreVC.tabBarItem.image=UIImage(named: "icon_tab03_normal.png")
        userinfoVC.tabBarItem.image=UIImage(named: "icon_tab04_normal.png")
        homeVC.tabBarItem.selectedImage = UIImage(named: "icon_tab01_normal.png")
        homeVC.tabBarItem.badgeValue="8"
        
        //设置ViewController在工具栏的名称
        homeVC.tabBarItem.title="首页"
        enjoyVC.tabBarItem.title="关注"
        exploreVC.tabBarItem.title="探索"
        userinfoVC.tabBarItem.title="我的"
        
        let nav = UINavigationController(rootViewController: homeVC)
        nav.title = "nav"
        
        
        //将以上的ViewController天剑到UITabBarController中
        let tabBar=UITabBarController()
        tabBar.viewControllers = [nav,enjoyVC,exploreVC,userinfoVC]
        tabBar.selectedIndex=0
//        let nav = UINavigationController(rootViewController: tabBar)
//        nav.title = "nav"
        // tabBar.delegate=self
        //将window的跟视图设置为tabBar
//        self.window?.rootViewController=tabBar
//        self.window?.backgroundColor=UIColor.white
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.rootViewController = tabBar
        self.window?.backgroundColor = UIColor.red
        self.window?.makeKeyAndVisible()
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

