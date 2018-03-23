//
//  RefuelCellViewModel.swift
//  RealConsumptionTracker
//
//  Created by José María Jiménez on 18/03/2018.
//  Copyright © 2018 José María Jiménez. All rights reserved.
//

import Foundation

class RefuelCellViewModel {
    let totalOdo: String
    let litres: String
    let euros: String
    let partialOdo: String
    let full: Bool
    
    init?(refuel: Refuels) {
        guard let totalOdo = refuel.totalOdometer, let litres = refuel.litres, let euros = refuel.euros, let partialOdo = refuel.odometer, let full = refuel.full else { return nil }
        self.totalOdo = String(totalOdo)
        self.litres = String(litres.rounded())
        self.euros = euros.toCurrency
        self.partialOdo = String(partialOdo)
        self.full = full
    }
}
