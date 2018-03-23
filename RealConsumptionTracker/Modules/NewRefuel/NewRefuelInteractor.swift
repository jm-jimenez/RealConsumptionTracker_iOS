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
    func addRefuelWith(newRefuelRequest: NewRefuelRequest)
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
    
    func addRefuelWith(newRefuelRequest: NewRefuelRequest) {
        if let alias = alias { newRefuelRequest.alias = alias }
        dataManager?.saveRefuelWith(newRefuelRequest: newRefuelRequest, success: {
            self.presenter?.refuelSaved()
        }, failure: { (error) in
            self.presenter?.showError(error)
        })
    }
}
