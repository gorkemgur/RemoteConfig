//
//  RemoteConfigProtocol.swift
//  RemoteConfig
//
//  Created by Görkem Gür on 27.03.2024.
//

import Foundation

enum RemoteConfigType {
    case forceUpdate(updateTitle: String, updateDescription: String)
    case maintenanceMode(maintenanceTitle: String, maintenanceDescription: String)
}

protocol RemoteConfigProtocol: AnyObject {
    func onFetched()
    func onFailure()
}
