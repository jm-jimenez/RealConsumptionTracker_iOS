//
//  Double+Util.swift
//  RealConsumptionTracker
//
//  Created by José María Jiménez on 18/03/2018.
//  Copyright © 2018 José María Jiménez. All rights reserved.
//

import Foundation

extension Double {
    var toCurrency: String {
        let formatter = NumberFormatter()
        formatter.locale = Locale.current
        formatter.numberStyle = .currency
        return formatter.string(from: self as NSNumber) ?? "0"
    }
}
