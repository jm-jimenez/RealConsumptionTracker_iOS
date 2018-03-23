//
//  User.swift
//  RealConsumptionTracker
//
//  Created by A on 22/3/18.
//  Copyright © 2018 José María Jiménez. All rights reserved.
//

import Foundation
import UIKit

class User {
    var userId: String?
    
    static func getAppDelegateUserId() -> String {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        guard let user = appDelegate.user, let userId = user.userId else { fatalError("No userId in Session") }
//        return "38217388"
        return userId
    }
}
