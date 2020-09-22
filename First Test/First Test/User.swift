//
//  User.swift
//  First Test
//
//  Created by Jesse Ruiz on 9/22/20.
//  Copyright © 2020 Jesse Ruiz. All rights reserved.
//

import Foundation

struct User {
    static let upgradeNotification = Notification.Name("UserUpgraded")
    
    func upgrade(using center: NotificationCenter = NotificationCenter.default) {
        DispatchQueue.global().async {
            Thread.sleep(forTimeInterval: 1)
            center.post(name: User.upgradeNotification, object: nil, userInfo: ["level": "gold"])
        }
    }
}
