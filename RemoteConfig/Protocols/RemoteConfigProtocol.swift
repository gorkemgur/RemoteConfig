//
//  RemoteConfigProtocol.swift
//  RemoteConfig
//
//  Created by Görkem Gür on 27.03.2024.
//

import Foundation

protocol RemoteConfigProtocol: AnyObject {
    func onFetched()
    func onFailure()
}
