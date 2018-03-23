//
//  UIView+Util.swift
//  RealConsumptionTracker
//
//  Created by A on 23/3/18.
//  Copyright © 2018 José María Jiménez. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    func setShadow(shadowColor: CGColor = UIColor.black.cgColor,
                   shadowOffset: CGSize = CGSize(width: 0, height: 5),
                   shadowRadius: CGFloat = 5,
                   shadowOpacity: Float = 0.5,
                   masksToBounds: Bool = false) {
        self.layer.shadowColor = shadowColor
        self.layer.shadowOffset = shadowOffset
        self.layer.shadowRadius = shadowRadius
        self.layer.shadowOpacity = shadowOpacity
        self.layer.masksToBounds = masksToBounds
    }
}
