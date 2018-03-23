//
//  DashboardDataManager.swift
//  RealConsumptionTracker
//
//  Created by José María Jiménez on 17/03/2018.
//  Copyright © 2018 José María Jiménez. All rights reserved.
//

import Foundation

protocol DashboardDataManagerProtocol {
    func checkUserData(success: @escaping (Bool) -> Void, failure: @escaping (BaseError) -> Void)
    func getLastFullRefuels(success: @escaping ([Float]) -> Void, failure: @escaping (BaseError) -> Void)
}

class DashboardDataManager: DashboardDataManagerProtocol {
    var apiClient: DashboardAPIClientProtocol?
    
    func checkUserData(success: @escaping (Bool) -> Void, failure: @escaping (BaseError) -> Void) {
        apiClient?.checkUserData(success: success, failure: failure)
    }
    
    func getLastFullRefuels(success: @escaping ([Float]) -> Void, failure: @escaping (BaseError) -> Void) {
        apiClient?.getLastFullRefuels(success: success, failure: failure)
    }
}
