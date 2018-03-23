//
//  RefuelsInteractor.swift
//  RealConsumptionTracker
//
//  Created by José María Jiménez on 18/03/2018.
//  Copyright © 2018 José María Jiménez. All rights reserved.
//

import Foundation

protocol RefuelsInteractorInputProtocol {
    func getAllRefuels()
}

class RefuelsInteractor: RefuelsInteractorInputProtocol {
    weak var presenter: RefuelsInteractorOutputProtocol?
    var dataManager: RefuelsDataManagerProtocol?
    
    func getAllRefuels() {
        dataManager?.getAllRefuels(success: { (refuels: [Refuels]) in
            self.presenter?.refuelsFound(refuels)
        }, failure: { (error) in
            self.presenter?.showError(error)
        })
    }
}
