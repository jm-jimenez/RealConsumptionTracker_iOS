//
//  DashboardAPIClient.swift
//  RealConsumptionTracker
//
//  Created by José María Jiménez on 17/03/2018.
//  Copyright © 2018 José María Jiménez. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper

protocol DashboardAPIClientProtocol {
    func checkUserData(success: @escaping (Bool) -> Void, failure: @escaping (BaseError) -> Void)
    func getLastFullRefuels(success: @escaping ([Float]) -> Void, failure: @escaping (BaseError) -> Void)
}

class DashboardAPIClient: BaseAPIClient, DashboardAPIClientProtocol {
    
    func checkUserData(success: @escaping (Bool) -> Void, failure: @escaping (BaseError) -> Void) {
        self.request(Constants.checkUserData,
                     parameters: ["userId": User.getAppDelegateUserId()]).responseJSON { (response) in
                        let error = self.handleError(response: response)
                        if error != .noError {
                            failure(error)
                        } else if let value = String(data: response.data!, encoding: .utf8) {
                            switch value {
                            case "0": success(false)
                            case "1": success(true)
                            default: failure(.generic)
                            }
                        }
        }
    }
    
    func getLastFullRefuels(success: @escaping ([Float]) -> Void, failure: @escaping (BaseError) -> Void) {
        self.request(Constants.partialMileage,
                     parameters: ["userId": User.getAppDelegateUserId(), "limit": 5]).responseObject { (response: DataResponse<PartialMileageResponse>) in
                        
                        let error = self.handleError(response: response)
                        if error != .noError {
                            failure(error)
                        } else {
                            guard let mileages = response.value?.mileages else {
                                failure(.generic)
                                return
                            }
                            success(mileages)
                        }
        }
        
    }
}
