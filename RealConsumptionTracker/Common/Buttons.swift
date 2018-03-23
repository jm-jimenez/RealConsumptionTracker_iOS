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
