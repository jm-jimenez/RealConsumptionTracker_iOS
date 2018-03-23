//
//  NewRefuelWireframe.swift
//  RealConsumptionTracker
//
//  Created by José María Jiménez on 17/03/2018.
//  Copyright © 2018 José María Jiménez. All rights reserved.
//

import Foundation
import UIKit

class NewRefuelWireframe {
    
    private var alias: String?
    
    var viewController: NewRefuelViewController {
        let viewController = NewRefuelViewController(nibName: "NewRefuelView", bundle: nil)
        let presenter = NewRefuelPresenter()
        let interactor = NewRefuelInteractor(alias: alias)
        let dataManager = NewRefuelDataManager()
        let apiClient = NewRefuelAPIClient()
        viewController.presenter = presenter
        presenter.view = viewController
        presenter.interactor = interactor
        interactor.presenter = presenter
        interactor.dataManager = dataManager
        dataManager.apiClient = apiClient
        return viewController
    }
    
    init(alias: String? = nil) {
        self.alias = alias
    }
}
