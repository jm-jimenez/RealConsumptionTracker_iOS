//
//  RefuelsWireframe.swift
//  RealConsumptionTracker
//
//  Created by José María Jiménez on 17/03/2018.
//  Copyright © 2018 José María Jiménez. All rights reserved.
//

import Foundation
import UIKit

class RefuelsWireframe {
    
    var viewController: RefuelsViewController {
        let viewController: RefuelsViewController = RefuelsViewController(nibName: "RefuelsView", bundle: nil)
        let presenter = RefuelsPresenter()
        let interactor = RefuelsInteractor()
        let dataManager = RefuelsDataManager()
        let apiClient = RefuelsAPIClient()
        presenter.view = viewController
        viewController.presenter = presenter
        presenter.interactor = interactor
        interactor.presenter = presenter
        interactor.dataManager = dataManager
        dataManager.apiClient = apiClient
        viewController.tabBarItem = UITabBarItem(title: "tab_bar_refuels".localized, image: #imageLiteral(resourceName: "gas-station"), selectedImage: nil)
        
        return viewController
    }
}
