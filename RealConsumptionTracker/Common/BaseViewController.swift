//
//  BaseViewController.swift
//  RealConsumptionTracker
//
//  Created by José María Jiménez on 17/03/2018.
//  Copyright © 2018 José María Jiménez. All rights reserved.
//

import UIKit
import SVProgressHUD
import PopupDialog

protocol BaseViewControllerProtocol: AnyObject {
    func showLoading()
    func hideLoading()
    func showError(_ error: BaseError)
    func dismiss()
}

class BaseViewController: UIViewController, BaseViewControllerProtocol {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func showLoading() {
        SVProgressHUD.show()
    }
    
    func hideLoading() {
        SVProgressHUD.dismiss()
    }
    
    func showError(_ error: BaseError) {
        let popup = PopupDialog(title: nil, message: error.description)
        let button = PopupDialogButton(title: "OK", action: nil)
        popup.addButton(button)
        self.present(popup, animated: true, completion: nil)
    }
    
    func dismiss() {
        self.dismiss(animated: true, completion: nil)
    }
}
