//
//  RefuelsAPIClient.swift
//  RealConsumptionTracker
//
//  Created by José María Jiménez on 18/03/2018.
//  Copyright © 2018 José María Jiménez. All rights reserved.
//

import Foundation
import AlamofireObjectMapper
import Alamofire
import ObjectMapper

protocol RefuelsAPIClientProtocol {
    func getAllRefuels(success: @escaping ([Refuels]) -> Void, failure: @escaping (BaseError) -> Void)
}

class RefuelsAPIClient: BaseAPIClient, RefuelsAPIClientProtocol {
    
    func getAllRefuels(success: @escaping ([Refuels]) -> Void, failure: @escaping (BaseError) -> Void) {
        self.request(Constants.getAllRefuelsByUser,
                     parameters: ["userId": User.getAppDelegateUserId()]).responseJSON { (response) in
                        switch response.result {
                        case .success(let JSON):
                            let outer = JSON as! [Any]
                            guard outer.count > 0, let inner = outer[0] as? [String: Any], let refuels = Mapper<AllRefuelsResponse>().map(JSON: inner)?.refuels else {
                                failure(.generic)
                                return
                            }
                            success(refuels)
                        case .failure: failure(.generic)
                        }
        }
    }
}
