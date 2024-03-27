//
//  SessionHelper.swift
//  RemoteConfig
//
//  Created by Görkem Gür on 27.03.2024.
//

import Foundation

final class SessionHelper {
    private init() {}
    
    static let sharedInstance = SessionHelper()
    
    func saveBoolValue(boolKey: String, boolValue: Bool) {
        UserDefaults.standard.setValue(boolValue, forKey: boolKey)
    }
    
    func getBoolValue(boolKey: String) -> Bool {
        return UserDefaults.standard.bool(forKey: boolKey)
    }
    
    func saveStringValue(stringKey: String, stringValue: Bool) {
        UserDefaults.standard.setValue(stringValue, forKey: stringKey)
    }
    
    func getStringValue(boolKey: String) -> String? {
        return UserDefaults.standard.string(forKey: boolKey)
    }
    
    func removeObject(objectKey: String) {
        UserDefaults.standard.removeObject(forKey: objectKey)
    }
    
}
