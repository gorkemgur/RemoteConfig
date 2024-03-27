//
//  ViewController.swift
//  RemoteConfig
//
//  Created by Görkem Gür on 27.03.2024.
//

import UIKit

final class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        view.backgroundColor = .red
        checkWelcomeBannerStatus()
    }
    
}

extension BaseViewController {
    func checkWelcomeBannerStatus() {
        if let status = RemoteConfigHelper.sharedInstance.remoteConfigControlModel?.welcomeBannerEnabled {
            if (status) {
                showWelcomeAlert()
            } else {
                checkMaintenance()
            }
        }
    }
    
    func checkMaintenance() {
        if let remoteConfigModel = RemoteConfigHelper.sharedInstance.remoteConfigControlModel {
            if (remoteConfigModel.isMaintenanceEnabled) {
                showInformationAlert(title: remoteConfigModel.maintenanceModeTitle, description: remoteConfigModel.maintenanceModeDescription)
            }
        }
    }
}


