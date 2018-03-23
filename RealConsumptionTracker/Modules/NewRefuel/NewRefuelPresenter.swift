//
//  NewRefuelPresenter.swift
//  RealConsumptionTracker
//
//  Created by José María Jiménez on 17/03/2018.
//  Copyright © 2018 José María Jiménez. All rights reserved.
//

import Foundation

protocol NewRefuelPresenterProtocol {
    func configViews()
}

protocol NewRefuelInteractorOutputProtocol: BaseInteractorOutputProtocol {
    
}

class NewRefuelPresenter: BasePresenter, NewRefuelPresenterProtocol, NewRefuelInteractorOutputProtocol {
    
    weak var view: NewRefuelViewControllerProtocol? {
        didSet {
            super.baseView = view
        }
    }
    var interactor: NewRefuelInteractorInputProtocol?
    
    func configViews() {
        let refuelViewModel = NewRefuelViewModel()
        refuelViewModel.title = "New Refuel"
        refuelViewModel.alias = interactor?.getAlias()
        view?.configViewsWith(viewModel: refuelViewModel)
    }
}
