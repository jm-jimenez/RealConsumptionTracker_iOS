//
//  BaseError.swift
//  RealConsumptionTracker
//
//  Created by José María Jiménez on 17/03/2018.
//  Copyright © 2018 José María Jiménez. All rights reserved.
//

import Foundation

enum BaseError {
    case generic
    
    case noError
    
    var description: String {
        switch self {
        case .generic: return "error_generic".localized
        case .noError: return ""
        }
    }
}
