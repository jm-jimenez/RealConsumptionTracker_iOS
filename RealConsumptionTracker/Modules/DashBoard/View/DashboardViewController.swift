//
//  DashboardViewController.swift
//  RealConsumptionTracker
//
//  Created by José María Jiménez on 17/03/2018.
//  Copyright © 2018 José María Jiménez. All rights reserved.
//

import UIKit
import PopupDialog

protocol DashboardViewControllerProtocol: BaseViewControllerProtocol {
    func updateItems(_ mileageViewModels: [MileageViewModel])
    func noDataFound()
}

class DashboardViewController: BaseViewController, DashboardViewControllerProtocol {

    // MARK: - Properties
    var presenter: DashboardPresenterProtocol?
    var items: [MileageViewModel] = [MileageViewModel]() {
        didSet {
            chartView.reloadData()
        }
    }
    
    // MARK: XIB Outlets
    @IBOutlet weak var chartView: UICollectionView!
    
    @IBOutlet weak var topLine: UIView!
    @IBOutlet weak var mediumLine: UIView!
    @IBOutlet weak var bottomLine: UIView!
    
    @IBOutlet weak var topLinePosition: NSLayoutConstraint!
    @IBOutlet weak var mediumLinePosition: NSLayoutConstraint!
    @IBOutlet weak var bottomLinePosition: NSLayoutConstraint!
    
    // MARK: - Object lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter?.checkUserData()
    }
    
    override func viewDidLayoutSubviews() {
        let chartViewHeight = chartView.frame.height
        topLinePosition.constant = chartViewHeight / 4
        mediumLinePosition.constant = chartViewHeight / 2
        bottomLinePosition.constant = chartViewHeight / 4
        topLine.isHidden = false
        mediumLine.isHidden = false
        bottomLine.isHidden = false
    }
    
    // MARK: - Private methods
    private func configViews() {
        chartView.delegate = self
        chartView.dataSource = self
        chartView.collectionViewLayout = BottomFlowLayout()
        chartView.register(UINib(nibName: Constants.mileageCollectionViewCellNibName, bundle: nil), forCellWithReuseIdentifier: Constants.mileageCollectionViewCellReuseIdentifier)
    }
    
    // MARK: - DashboardViewController
    func updateItems(_ mileageViewModels: [MileageViewModel]) {
        items = mileageViewModels
    }
    
    // MARK: - DashboardViewControllerProtocol
    func noDataFound() {
        self.tabBarController?.tabBar.isHidden = true
        let noDataView = NoDataFoundView()
        noDataView.delegate = self
        noDataView.frame = self.view.frame
        self.view.addSubview(noDataView)
    }
}

extension DashboardViewController: NoDataFoundViewDelegate {
    func didTapContinue(with alias: String) {
        let presentViewController = NewRefuelWireframe(alias: alias).viewController
        let newNav = UINavigationController()
        newNav.viewControllers = [presentViewController]
        present(newNav, animated: true, completion: nil)
    }
}
