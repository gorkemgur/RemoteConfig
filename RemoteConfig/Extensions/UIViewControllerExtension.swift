//
//  UIViewControllerExtension.swift
//  RemoteConfig
//
//  Created by Görkem Gür on 27.03.2024.
//

import UIKit

extension UIViewController {
    func showWelcomeAlert() {
        let alert = UIAlertController(title: "Hoşgeldiniz", message: "Uygulamaya Hoşgeldiniz", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Tamam", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    func showInformationAlert(title: String, description: String) {
        let alert = UIAlertController(title: title, message: description, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Tamam", style: .default, handler: { action in
            exit(0)
        }))
        self.present(alert, animated: true, completion: nil)
    }
}
