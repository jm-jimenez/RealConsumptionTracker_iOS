//
//  Environment.swift
//  RealConsumptionTracker
//
//  Created by José María Jiménez on 17/03/2018.
//  Copyright © 2018 José María Jiménez. All rights reserved.
//

import Foundation

struct Environment {
    var plistEnvironment: [String: Any]?
    
    var baseUrl: String? {
        return plistEnvironment?[Constants.baseUrlKey] as? String
    }
    
    init() {
        guard let path = Bundle.main.path(forResource: Constants.configurationFileName, ofType: Constants.plistFileType) else { return }
        plistEnvironment = NSDictionary(contentsOfFile: path) as? [String: Any]
    }
}
