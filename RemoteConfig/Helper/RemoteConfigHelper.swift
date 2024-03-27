//
//  RemoteConfigHelper.swift
//  RemoteConfig
//
//  Created by Görkem Gür on 27.03.2024.
//

import Foundation
import FirebaseRemoteConfig

final class RemoteConfigHelper {
    
    private let appBuildNumber = "\(Bundle.main.infoDictionary?["CFBundleShortVersionString"] ?? "")"
    
    private(set) var remoteConfigControlModel: RemoteConfigControlModel? = nil
    
    private let dispatchQueue = DispatchQueue.global(qos: .background)
    private var remoteConfig = RemoteConfig.remoteConfig()
    
    private init () {
        setRemoteConfigDefaults()
    }
    
    static let sharedInstance = RemoteConfigHelper()
    
    weak var delegate: RemoteConfigProtocol?
    
    func fetchRemoteConfig() {
        dispatchQueue.async { [weak self] in
            guard let self = self else { return }
            //If we need to instantly get value from remoteConfig we must use fetchAndActivate
            self.remoteConfig.fetchAndActivate { (status, error) in
                if status == .successFetchedFromRemote {
                    self.remoteConfigControlModel = RemoteConfigControlModel(
                        latestVersion: self.remoteConfig.getStringValue(for: Constants.RemoteConfigDefaultConstants.versionCode),
                        isMaintenanceEnabled: self.remoteConfig.getBoolValue(for: Constants.RemoteConfigDefaultConstants.maintenanceModeKey),
                        maintenanceModeTitle: self.remoteConfig.getStringValue(for: Constants.RemoteConfigDefaultConstants.maintenanceModeTitleKey),
                        maintenanceModeDescription: self.remoteConfig.getStringValue(for: Constants.RemoteConfigDefaultConstants.maintenanceModeDescriptionKey),
                        isVersionForceEnabled: self.remoteConfig.getBoolValue(for: Constants.RemoteConfigDefaultConstants.forceUpdateKey),
                        forceUpdateTitle: self.remoteConfig.getStringValue(for: Constants.RemoteConfigDefaultConstants.forceUpdateTitleKey),
                        forceUpdateDescription: self.remoteConfig.getStringValue(for: Constants.RemoteConfigDefaultConstants.forceUpdateDescriptionKey),
                        welcomeBannerEnabled: self.remoteConfig.getBoolValue(for: Constants.RemoteConfigDefaultConstants.welcomeBannerKey))
                    #if DEBUG
                    debugPrint("---------------------- VALUES ---------------------- \n"
                               + "Current App Version \(self.appBuildNumber) \n"
                               + "Production Version: \(String(describing: self.remoteConfigControlModel)) \n"
                               + "---------------------- VALUES ---------------------- ")
                    #endif
                    self.saveWelcomeBannerStatus()
                    self.delegate?.onFetched()
                } else {
                    print("Config not fetched")
                    print("Error: \(error?.localizedDescription ?? "No error available.")")
                    self.delegate?.onFailure()
                }
            }
        }
    }
    
}


extension RemoteConfigHelper {
    func setRemoteConfigDefaults() {
        let defaults = [
            Constants.RemoteConfigDefaultConstants.versionCode: appBuildNumber,
            Constants.RemoteConfigDefaultConstants.forceUpdateKey: false,
            Constants.RemoteConfigDefaultConstants.forceUpdateTitleKey: Constants.RemoteConfigDefaultConstants.forceUpdateTitleDefaultValue,
            Constants.RemoteConfigDefaultConstants.forceUpdateDescriptionKey: Constants.RemoteConfigDefaultConstants.forceUpdateDescriptionDefaultValue,
            Constants.RemoteConfigDefaultConstants.maintenanceModeKey: false,
            Constants.RemoteConfigDefaultConstants.maintenanceModeTitleKey: Constants.RemoteConfigDefaultConstants.maintenanceModeTitleDefaultValue,
            Constants.RemoteConfigDefaultConstants.maintenanceModeDescriptionKey: Constants.RemoteConfigDefaultConstants.maintenanceModeDescriptionDefaultValue,
            Constants.RemoteConfigDefaultConstants.welcomeBannerKey: false,
        ] as! [String: NSObject]
        let settings = RemoteConfigSettings()
        #if DEBUG
        settings.minimumFetchInterval = 0
        #else
        settings.minimumFetchInterval = 15
        #endif
        remoteConfig.configSettings = settings
        remoteConfig.setDefaults(defaults)
    }
    
    func saveWelcomeBannerStatus() {
        SessionHelper.sharedInstance.saveBoolValue(boolKey: "isWelcomeBannerEnabled", boolValue: remoteConfigControlModel?.welcomeBannerEnabled ?? false)
    }
    
}
