//
//  Float+Util.swift
//  RealConsumptionTracker
//
//  Created by José María Jiménez on 17/03/2018.
//  Copyright © 2018 José María Jiménez. All rights reserved.
//

import Foundation

extension Float {
    var twoDecimals: String? {
        let number = (self * 100).rounded() / 100
        let numberFormater = NumberFormatter()
        numberFormater.locale = Locale.current
        numberFormater.numberStyle = .decimal
        return numberFormater.string(from: number as NSNumber)
    }
}
