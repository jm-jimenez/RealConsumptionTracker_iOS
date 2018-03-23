//
//  TabBarWireframe.swift
//  RealConsumptionTracker
//
//  Created by José María Jiménez on 17/03/2018.
//  Copyright © 2018 José María Jiménez. All rights reserved.
//

import Foundation
import UIKit

class TabBarWireframe {
    
    var viewController: UITabBarController {
        let viewController = UITabBarController()
        let dashboard = DashboardWireframe().viewController
        let refuels = RefuelsWireframe().viewController
        let dashboardVC = UINavigationController(rootViewController: dashboard)
        let refuelsVC = UINavigationController(rootViewController: refuels)
        viewController.viewControllers = [dashboardVC, refuelsVC]
        return viewController
    }
}
