//
//  NewRefuelInteractor.swift
//  RealConsumptionTracker
//
//  Created by José María Jiménez on 17/03/2018.
//  Copyright © 2018 José María Jiménez. All rights reserved.
//

import Foundation

protocol NewRefuelInteractorInputProtocol {
    func getAlias() -> String?
}

class NewRefuelInteractor: NewRefuelInteractorInputProtocol {

    weak var presenter: NewRefuelInteractorOutputProtocol?
    var dataManager: NewRefuelDataManagerProtocol?
    private var alias: String?
    
    init(alias: String? = nil) {
        self.alias = alias
    }
    
    func getAlias() -> String? {
        return self.alias
    }
}
