//
//  DashboardInteractor.swift
//  RealConsumptionTracker
//
//  Created by José María Jiménez on 17/03/2018.
//  Copyright © 2018 José María Jiménez. All rights reserved.
//

import Foundation

protocol DashboardInteractorInputProtocol {
    func checkUserData()
    func getLastFullRefuels()
}

class DashboardInteractor: DashboardInteractorInputProtocol {
    
    // MARK: - Properties
    weak var presenter: DashboardInteractorOutputProtocol?
    var dataManager: DashboardDataManagerProtocol?
    
    // MARK: DashboardInteractorInputProtocol
    func checkUserData() {
        dataManager?.checkUserData(success: { (exists) in
            if exists { self.getLastFullRefuels() }
            else { self.presenter?.noDataFound() }
        }, failure: { (error) in
            self.presenter?.showError(error)
        })
    }
    
    func getLastFullRefuels() {
        dataManager?.getLastFullRefuels(success: { (mileages: [Float]) in
            self.presenter?.mileagesFound(mileages)
        }, failure: { (error) in
            self.presenter?.showError(error)
        })
    }
}
