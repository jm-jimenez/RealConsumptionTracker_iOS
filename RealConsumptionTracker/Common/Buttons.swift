//
//  Buttons.swift
//  RealConsumptionTracker
//
//  Created by A on 22/3/18.
//  Copyright © 2018 José María Jiménez. All rights reserved.
//

import Foundation
import UIKit

class NextButton: UIButton {
    
    private var selectedImage: UIImage? {
        let image = #imageLiteral(resourceName: "next").withRenderingMode(.alwaysTemplate)
        return image
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setImage(selectedImage, for: .normal)
    }
    
    override var isEnabled: Bool {
        didSet {
            if isEnabled { tintColor = .blue }
            else { tintColor = .gray }
        }
    }
}

class CheckBoxButton: UIButton {
    private var checked: UIImage? {
        let image = #imageLiteral(resourceName: "checkbox-checked").withRenderingMode(.alwaysTemplate)
        return image
    }
    
    private var unchecked: UIImage? {
        let image = #imageLiteral(resourceName: "checkbox-unchecked").withRenderingMode(.alwaysTemplate)
        return image
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setImage(checked, for: .selected)
        setImage(unchecked, for: .normal)
        addTarget(self, action: #selector(checkBoxTap(_:)), for: .touchUpInside)
    }
    
    override var isSelected: Bool {
        didSet {
            if isSelected { tintColor = .blue }
            else { tintColor = .gray }
        }
    }
    
    @objc private func checkBoxTap(_ sender: UIButton) {
        isSelected = !isSelected
    }
}
