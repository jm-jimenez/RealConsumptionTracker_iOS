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
    @IBOutlet weak var fullButton: CheckBoxButton!
    
    @IBOutlet weak var litresLabel: UILabel!
    @IBOutlet weak var eurosLabel: UILabel!
    
    @IBOutlet weak var odoTextField: UITextField!
    @IBOutlet weak var litresTextField: UITextField!
    @IBOutlet weak var eurosTextField: UITextField!
    
    
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
        if viewModel.isNewUser {
            fullButton.isSelected = true
            fullButton.isUserInteractionEnabled = false
            litresLabel.removeFromSuperview()
            eurosLabel.removeFromSuperview()
            litresTextField.removeFromSuperview()
            eurosTextField.removeFromSuperview()
        } else {
            fullButton.isSelected = false
        }
    }
    
    @IBAction func didEditTextField(_ sender: UITextField) {
        switch sender {
        case odoTextField:
            presenter?.didEditText(type: .odo, text: sender.text)
        case litresTextField:
            presenter?.didEditText(type: .litres, text: sender.text)
        case eurosTextField:
            presenter?.didEditText(type: .euros, text: sender.text)
        default:
            break
        }
    }
    
    @IBAction func tapAccept(_ sender: UIButton) {
        presenter?.tapAccept()
    }
}
