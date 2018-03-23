//
//  RefuelsPresenter.swift
//  RealConsumptionTracker
//
//  Created by José María Jiménez on 17/03/2018.
//  Copyright © 2018 José María Jiménez. All rights reserved.
//

import Foundation

protocol RefuelsPresenterProtocol {
    
    func getAllRefuels()
}

protocol RefuelsInteractorOutputProtocol: BaseInteractorOutputProtocol {
    func refuelsFound(_ refuels: [Refuels])
}

class RefuelsPresenter: BasePresenter, RefuelsPresenterProtocol, RefuelsInteractorOutputProtocol {
    
    weak var view: RefuelsViewControllerProtocol? {
        didSet {
            super.baseView = view
        }
    }
    var interactor: RefuelsInteractorInputProtocol?
    
    func getAllRefuels() {
        view?.showLoading()
        interactor?.getAllRefuels()
    }
    
    func refuelsFound(_ refuels: [Refuels]) {
        view?.hideLoading()
        let viewModels = refuels.flatMap{ RefuelCellViewModel(refuel: $0) }
        view?.updateRefuels(with: viewModels)
    }
}
