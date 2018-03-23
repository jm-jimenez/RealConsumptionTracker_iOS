//
//  NewRefuelRequest.swift
//  RealConsumptionTracker
//
//  Created by A on 23/3/18.
//  Copyright © 2018 José María Jiménez. All rights reserved.
//

import Foundation

enum NewRefuelRequestType {
    case newUser
    case addRefuel
}

class NewRefuelRequest {
    
    private let userIdKey: String = "userId"
    private let odoKey: String = "odo"
    private let litresKey: String = "litres"
    private let eurosKey: String = "euros"
    private let fullKey: String = "full"
    private let chatIdKey: String = "chatId"
    private let firstNameKey: String = "firstName"
    
    var type: NewRefuelRequestType {
        if alias != nil { return .newUser }
        else { return .addRefuel }
    }
    var odo: Int?
    var litres: Double?
    var euros: Double?
    var full: Bool?
    var alias: String?
    
    var endPoint: String {
        switch type {
        case .addRefuel: return Constants.newRefuel
        case .newUser: return Constants.setCurrentOdometer
        }
    }
    
    var toParams: [String: Any] {
        var params: [String: Any] = [:]
        params[userIdKey] = User.getAppDelegateUserId()
        params[odoKey] = odo
        if type == .addRefuel {
            params[litresKey] = litres
            params[eurosKey] = euros
            params[fullKey] = full
        } else {
            params[chatIdKey] = User.getAppDelegateUserId()
            params[firstNameKey] = alias
        }
        
        return params
    }
}
