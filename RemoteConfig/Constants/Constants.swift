//
//  Constants.swift
//  RemoteConfig
//
//  Created by Görkem Gür on 27.03.2024.
//

import Foundation

enum Constants {
    enum RemoteConfigDefaultConstants {
        static let versionCode = "ios_version_code"
        static let forceUpdateKey = "ios_is_version_update_enabled"
        static let forceUpdateTitleKey = "ios_is_version_update_title"
        static let forceUpdateTitleDefaultValue = "Yeni Bir Sürüm Mevcut"
        static let forceUpdateDescriptionKey = "ios_is_version_update_description"
        static let forceUpdateDescriptionDefaultValue = "Uygulamayı kullanabilmek için bir üst sürüme güncellemeniz gerekmektedir!"
        
        static let maintenanceModeKey = "ios_maintenance_mode_enabled"
        static let maintenanceModeTitleKey = "ios_maintenance_mode_title"
        static let maintenanceModeTitleDefaultValue = "Bakım Çalışması"
        static let maintenanceModeDescriptionKey = "ios_maintenance_mode_description"
        static let maintenanceModeDescriptionDefaultValue = "Şuanda Anasayfa servislerimizde yaşanan yoğunuk sebebiyle uygulamada bakım çalışması yapılmaktadır, anlayışınız için teşekkürler."
        static let welcomeBannerKey = "ios_welcome_banner_enabled"
    }
}
