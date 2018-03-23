//
//  NewRefuelViewModel.swift
//  RealConsumptionTracker
//
//  Created by A on 22/3/18.
//  Copyright © 2018 José María Jiménez. All rights reserved.
//

import Foundation

class NewRefuelViewModel {
    var title: String?
    var alias: String?
    var infoLabel: String {
        return "This seems to be your first refuel. For more precise calculations, please make a full deposit refuel."
    }
    
    var isNewUser: Bool {
        return alias != nil
    }
}
