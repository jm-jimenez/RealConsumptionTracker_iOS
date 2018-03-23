//
//  MileageViewModel.swift
//  RealConsumptionTracker
//
//  Created by José María Jiménez on 17/03/2018.
//  Copyright © 2018 José María Jiménez. All rights reserved.
//

import Foundation

class MileageViewModel {

    var mileage: Float
    var percentage: Float
    
    init(_ mileage: Float, max: Float, min: Float){
        self.mileage = mileage
        self.percentage = (mileage - min) / (max - min)
    }
}
