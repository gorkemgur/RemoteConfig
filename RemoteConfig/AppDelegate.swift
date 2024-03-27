//
//  AppDelegate.swift
//  RemoteConfig
//
//  Created by Görkem Gür on 27.03.2024.
//

import Firebase
import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        FirebaseApp.configure()
        RemoteConfigHelper.sharedInstance.delegate = self
        RemoteConfigHelper.sharedInstance.fetchRemoteConfig()
        
        return true
    }
    
}

extension AppDelegate: RemoteConfigProtocol {
    func onFetched() {
        checkMaintenance()
        checkVersionForce()
    }
    
    func onFailure() {
        debugPrint("ERROR")
    }
    
    func checkVersionForce() {
        let homePageViewController = BaseViewController()
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = homePageViewController
        window?.makeKeyAndVisible()
    }
    
    func checkMaintenance() {
        
    }
    
}

