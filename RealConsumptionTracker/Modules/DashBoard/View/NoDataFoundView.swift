//
//  NoDataFoundView.swift
//  RealConsumptionTracker
//
//  Created by A on 22/3/18.
//  Copyright © 2018 José María Jiménez. All rights reserved.
//

import UIKit

protocol NoDataFoundViewDelegate: AnyObject {
    func didTapContinue(with alias: String)
}

class NoDataFoundView: UIView {

    weak var delegate: NoDataFoundViewDelegate?
    var view: UIView = UIView()
    @IBOutlet weak var nextButton: NextButton!
    @IBOutlet weak var alias: UITextField!
    
    init() {
        super.init(frame: .zero)
        xibSetup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func xibSetup() {
        view = loadViewFromNib()
        
        view.frame = bounds
        view.autoresizingMask = [UIViewAutoresizing.flexibleWidth, UIViewAutoresizing.flexibleHeight]
        addSubview(view)
        nextButton.isEnabled = false
    }
    
    func loadViewFromNib() -> UIView {
        
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: "NoDataFoundView", bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        
        return view
    }
    
    @IBAction func nextTap(_ sender: Any) {
        delegate?.didTapContinue(with: alias.text!)
    }
    
    @IBAction func aliasDidChange(_ sender: UITextField) {
        guard let text = sender.text else { return }
        nextButton.isEnabled = text.count > 0
    }
}
