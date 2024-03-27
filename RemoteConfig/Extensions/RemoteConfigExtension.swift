//
//  RemoteConfigExtension.swift
//  RemoteConfig
//
//  Created by Görkem Gür on 27.03.2024.
//
import FirebaseRemoteConfig

extension RemoteConfig {
    func getStringValue(for key: String) -> String {
        RemoteConfig.remoteConfig().configValue(forKey: key).stringValue ?? ""
    }
    
    func getBoolValue(for key: String) -> Bool {
        RemoteConfig.remoteConfig().configValue(forKey: key).boolValue
    }
}
