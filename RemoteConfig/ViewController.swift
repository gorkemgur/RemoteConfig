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
        print("BANNER STATUS \(RemoteConfigHelper.sharedInstance.remoteConfigControlModel?.welcomeBannerEnabled ?? false)")
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
}


