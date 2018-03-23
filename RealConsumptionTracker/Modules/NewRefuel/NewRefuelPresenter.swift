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
    func didEditText(type: WhichTextField, text: String?)
    func tapAccept()
}

protocol NewRefuelInteractorOutputProtocol: BaseInteractorOutputProtocol {
    func refuelSaved()
}

enum WhichTextField {
    case odo
    case litres
    case euros
}

class NewRefuelPresenter: BasePresenter, NewRefuelPresenterProtocol, NewRefuelInteractorOutputProtocol {
    
    weak var view: NewRefuelViewControllerProtocol? {
        didSet {
            super.baseView = view
        }
    }
    var interactor: NewRefuelInteractorInputProtocol?
    var newRefuelRequest: NewRefuelRequest = NewRefuelRequest()
    
    func configViews() {
        let refuelViewModel = NewRefuelViewModel()
        refuelViewModel.title = "New Refuel"
        refuelViewModel.alias = interactor?.getAlias()
        view?.configViewsWith(viewModel: refuelViewModel)
    }
    
    func didEditText(type: WhichTextField, text: String?) {
        guard let text = text else {
            self.view?.showError(.generic)
            return
        }
        switch type {
        case .odo:
            newRefuelRequest.odo = Int(text)
        case .litres:
            newRefuelRequest.litres = Double(text)
        case .euros:
            newRefuelRequest.euros = Double(text)
        }
    }
    
    func tapAccept() {
        view?.showLoading()
        interactor?.addRefuelWith(newRefuelRequest: newRefuelRequest)
    }
    
    func refuelSaved() {
        view?.hideLoading()
        view?.dismiss()
    }
}
