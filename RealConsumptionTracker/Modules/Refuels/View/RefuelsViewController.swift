//
//  RefuelsViewController.swift
//  RealConsumptionTracker
//
//  Created by José María Jiménez on 17/03/2018.
//  Copyright © 2018 José María Jiménez. All rights reserved.
//

import UIKit

protocol RefuelsViewControllerProtocol: BaseViewControllerProtocol {
    func updateRefuels(with refuels: [RefuelCellViewModel])
}

class RefuelsViewController: BaseViewController, RefuelsViewControllerProtocol {
    
    var presenter: RefuelsPresenterProtocol?
    var items: [RefuelCellViewModel] = [RefuelCellViewModel]() {
        didSet {
            tableView.reloadData()
        }
    }
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        configViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setNavigationBarButton()
        navigationController?.setNavigationBarHidden(false, animated: true)
        navigationController?.navigationBar.isTranslucent = false
        presenter?.getAllRefuels()
        tableView.dataSource = self
        tableView.register((UINib(nibName: Constants.refuelTableViewCellNibName, bundle: nil)), forCellReuseIdentifier: Constants.refuelTableViewCellReuseIdentifier)
    }
    
    private func configViews() {
        self.title = "REFUELS"
        containerView.layer.cornerRadius = 20
        tableView.layer.cornerRadius = 20
        containerView.setShadow()
    }
    
    private func setNavigationBarButton() {
        let button = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(showAddNewRefuel))
        navigationItem.rightBarButtonItem = button
    }
    
    @objc private func showAddNewRefuel(){
        let presentedNav = UINavigationController()
        presentedNav.viewControllers = [NewRefuelWireframe().viewController]
        navigationController?.present(presentedNav, animated: true, completion: nil)
    }
    
    func updateRefuels(with refuels: [RefuelCellViewModel]) {
        items = refuels
    }
}
