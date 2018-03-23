//
//  Constants.swift
//  RealConsumptionTracker
//
//  Created by José María Jiménez on 17/03/2018.
//  Copyright © 2018 José María Jiménez. All rights reserved.
//

import Foundation

struct Constants {
    
    // MARK: - Configuration
    static let configurationFileName: String = "Configuration"
    static let baseUrlKey: String = "baseUrl"
    
    // MARK: - FileTypes
    static let plistFileType: String = "plist"
    
    // MARK: - Endpoints
    static let checkUserData: String = "/checkUserData"
    static let partialMileage: String = "/partialMileage"
    static let getAllRefuelsByUser: String = "/getAllRefuelsByUser"
    
    // MARK: - CollectionViews
    static let defaultBarHeight: Float = 170
    static let mileageCollectionViewCellNibName: String = "MileageCollectionViewCell"
    static let mileageCollectionViewCellReuseIdentifier: String = "MileageCollectionViewCellReuseIdentifier"
    
    // MARK: - TableViews
    static let refuelTableViewCellNibName: String = "RefuelTableViewCell"
    static let refuelTableViewCellReuseIdentifier: String = "RefuelTableViewCellReuseIdentifier"
}
