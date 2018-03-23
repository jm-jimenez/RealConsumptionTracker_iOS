//
//  DashboardPresenter.swift
//  RealConsumptionTracker
//
//  Created by José María Jiménez on 17/03/2018.
//  Copyright © 2018 José María Jiménez. All rights reserved.
//

import Foundation

protocol DashboardPresenterProtocol {
    func checkUserData()
    func getLastFullRefuels()
}

protocol DashboardInteractorOutputProtocol: BaseInteractorOutputProtocol {
    func noDataFound()
    func mileagesFound(_ mileages: [Float])
}

class DashboardPresenter: BasePresenter, DashboardPresenterProtocol, DashboardInteractorOutputProtocol {
    
    // MARK: - Properties
    weak var view: DashboardViewControllerProtocol? {
        didSet {
            super.baseView = view
        }
    }
    var interactor: DashboardInteractorInputProtocol?
    
    // MARK: - DashboardPresenterProtocol
    func checkUserData() {
        view?.showLoading()
        interactor?.checkUserData()
    }
    
    func getLastFullRefuels() {
        interactor?.getLastFullRefuels()
    }
    
    // MARK: - DashboardInteractorOutputProtocol
    func noDataFound() {
        view?.hideLoading()
        view?.noDataFound()
    }
    
    func mileagesFound(_ mileages: [Float]) {
        guard let max = mileages.max(), let min = mileages.min() else {
            self.view?.showError(.generic)
            return
        }
        let viewModels = mileages.map{ MileageViewModel($0, max: max + 1, min: min - 1) }
        view?.updateItems(viewModels)
        view?.hideLoading()
    }
}
