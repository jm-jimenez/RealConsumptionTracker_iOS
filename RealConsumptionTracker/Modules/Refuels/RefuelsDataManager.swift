//
//  RefuelsDataManager.swift
//  RealConsumptionTracker
//
//  Created by José María Jiménez on 18/03/2018.
//  Copyright © 2018 José María Jiménez. All rights reserved.
//

import Foundation

protocol RefuelsDataManagerProtocol {
    func getAllRefuels(success: @escaping ([Refuels]) -> Void, failure: @escaping (BaseError) -> Void)
}

class RefuelsDataManager: RefuelsDataManagerProtocol {
    var apiClient: RefuelsAPIClientProtocol?
    
    func getAllRefuels(success: @escaping ([Refuels]) -> Void, failure: @escaping (BaseError) -> Void) {
        apiClient?.getAllRefuels(success: success, failure: failure)
    }
}
