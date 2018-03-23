//
//  BaseAPIClient.swift
//  RealConsumptionTracker
//
//  Created by José María Jiménez on 17/03/2018.
//  Copyright © 2018 José María Jiménez. All rights reserved.
//

import Foundation
import Alamofire

class BaseAPIClient {
    
    private var sessionManager: Alamofire.SessionManager

    private var baseURL: URL {
        guard let stringURL = Environment().baseUrl, let baseURL = URL(string: stringURL) else { fatalError("BASE URL NOT FOUND")}
        return baseURL
    }
    
    init() {
        sessionManager = SessionManager.default
    }
    
    func request(_ endPoint: String, method: HTTPMethod = .post, parameters: [String: Any]? = nil) -> DataRequest {
        
        let completeURL = baseURL.appendingPathComponent(endPoint)
        return sessionManager.request(completeURL, method: method, parameters: parameters, encoding: URLEncoding.default, headers: nil)
    }
    
    func handleError<T: Any>(response: DataResponse<T>) -> BaseError {
        var error: BaseError = .generic
        if let statusCode = response.response?.statusCode, statusCode == 200 { error = .noError }
        
        return error
    }
}
