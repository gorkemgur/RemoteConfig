//
//  RemoteConfigControlModel.swift
//  RemoteConfig
//
//  Created by Görkem Gür on 27.03.2024.
//

import Foundation

struct RemoteConfigControlModel {
    let latestVersion: String
    let isMaintenanceEnabled: Bool
    let maintenanceModeTitle: String
    let maintenanceModeDescription: String
    let isVersionForceEnabled: Bool
    let forceUpdateTitle: String
    let forceUpdateDescription: String
    let welcomeBannerEnabled: Bool
}
