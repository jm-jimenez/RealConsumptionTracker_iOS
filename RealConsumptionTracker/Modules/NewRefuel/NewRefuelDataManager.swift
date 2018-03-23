//
//  NewRefuelDataManager.swift
//  RealConsumptionTracker
//
//  Created by José María Jiménez on 17/03/2018.
//  Copyright © 2018 José María Jiménez. All rights reserved.
//

import Foundation

protocol NewRefuelDataManagerProtocol {
    
    func saveRefuelWith(newRefuelRequest: NewRefuelRequest, success: @escaping () -> Void, failure: @escaping (BaseError) -> Void)
}

class NewRefuelDataManager: NewRefuelDataManagerProtocol {
    
    var apiClient: NewRefuelAPIClientProtocol?
    
    func saveRefuelWith(newRefuelRequest: NewRefuelRequest, success: @escaping () -> Void, failure: @escaping (BaseError) -> Void) {
        apiClient?.saveRefuelWith(newRefuelRequest: newRefuelRequest, success: success, failure: failure)
    }
}
