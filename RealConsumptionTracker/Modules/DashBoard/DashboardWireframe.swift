//
//  DashboardWireframe.swift
//  RealConsumptionTracker
//
//  Created by José María Jiménez on 17/03/2018.
//  Copyright © 2018 José María Jiménez. All rights reserved.
//

import Foundation
import UIKit

class DashboardWireframe {
    
    var viewController: DashboardViewController {
        let viewController = DashboardViewController(nibName: "DashboardView", bundle: nil)
        let presenter = DashboardPresenter()
        let interactor = DashboardInteractor()
        let dataManager = DashboardDataManager()
        let apiClient = DashboardAPIClient()
        viewController.presenter = presenter
        presenter.view = viewController
        presenter.interactor = interactor
        interactor.presenter = presenter
        interactor.dataManager = dataManager
        dataManager.apiClient = apiClient
        viewController.tabBarItem = UITabBarItem(title: "tab_bar_dashboard".localized, image: #imageLiteral(resourceName: "line-chart"), selectedImage: nil)
        return viewController
    }
}
