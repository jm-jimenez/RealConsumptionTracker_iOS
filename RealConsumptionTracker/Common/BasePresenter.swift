//
//  BasePresenter.swift
//  RealConsumptionTracker
//
//  Created by José María Jiménez on 17/03/2018.
//  Copyright © 2018 José María Jiménez. All rights reserved.
//

import Foundation

protocol BaseInteractorOutputProtocol: AnyObject {
    func showError(_ error: BaseError)
}

class BasePresenter: BaseInteractorOutputProtocol {
    weak var baseView: BaseViewControllerProtocol?
    func showError(_ error: BaseError) {
        baseView?.hideLoading()
        baseView?.showError(error)
    }
}
