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
        
        window = UIWindow(frame: UIScreen.main.bounds)
        
        return true
    }
    
}

extension AppDelegate: RemoteConfigProtocol {
    func onFetched() {
        checkVersionForce()
    }
    
    func onFailure() {
        debugPrint("ERROR")
    }
    
    func checkVersionForce() {
        if let remoteConfigModel = RemoteConfigHelper.sharedInstance.remoteConfigControlModel {
            if ((remoteConfigModel.isVersionForceEnabled) && (remoteConfigModel.latestVersion ?? "" > RemoteConfigHelper.sharedInstance.appBuildNumber)) {
                window?.rootViewController = UINavigationController(rootViewController: UIViewController())
                window?.makeKeyAndVisible()
                window?.rootViewController?.showInformationAlert(title: remoteConfigModel.forceUpdateTitle, description: remoteConfigModel.forceUpdateDescription)
            } else {
                let homePageViewController = UINavigationController(rootViewController: BaseViewController())
                window?.rootViewController = homePageViewController
                window?.makeKeyAndVisible()
            }
        }
    }
    
}

