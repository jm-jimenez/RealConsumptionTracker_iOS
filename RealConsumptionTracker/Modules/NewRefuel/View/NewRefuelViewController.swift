//
//  NewRefuelViewController.swift
//  RealConsumptionTracker
//
//  Created by José María Jiménez on 17/03/2018.
//  Copyright © 2018 José María Jiménez. All rights reserved.
//

import UIKit

protocol NewRefuelViewControllerProtocol: BaseViewControllerProtocol {
    func configViewsWith(viewModel: NewRefuelViewModel)
}

class NewRefuelViewController: BaseViewController, NewRefuelViewControllerProtocol {
    var presenter: NewRefuelPresenterProtocol?
    private var viewModel: NewRefuelViewModel?
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var infoLabelHeight: NSLayoutConstraint!
    @IBOutlet weak var containerView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        presenter?.configViews()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        if let viewModel = viewModel, !viewModel.isNewUser {
            infoLabel.addConstraint(infoLabelHeight)
        }
    }
    
    func configViewsWith(viewModel: NewRefuelViewModel) {
        containerView.setShadow()
        self.viewModel = viewModel
        self.title = viewModel.title
    }
}
