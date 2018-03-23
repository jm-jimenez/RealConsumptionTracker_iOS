//
//  NewRefuelAPIClient.swift
//  RealConsumptionTracker
//
//  Created by José María Jiménez on 17/03/2018.
//  Copyright © 2018 José María Jiménez. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper

protocol NewRefuelAPIClientProtocol {
    
    func saveRefuelWith(newRefuelRequest: NewRefuelRequest, success: @escaping () -> Void, failure: @escaping (BaseError) -> Void)
}

class NewRefuelAPIClient: BaseAPIClient, NewRefuelAPIClientProtocol {
    
    func saveRefuelWith(newRefuelRequest: NewRefuelRequest, success: @escaping () -> Void, failure: @escaping (BaseError) -> Void) {
        self.request(newRefuelRequest.endPoint, parameters: newRefuelRequest.toParams).responseJSON { (response) in
            guard let data = response.data, let added = String(data: data, encoding: .utf8) else {
                failure(.generic)
                return
            }
            if added == "true" { success() }
            else { failure(.generic)}
        }
    }
}
