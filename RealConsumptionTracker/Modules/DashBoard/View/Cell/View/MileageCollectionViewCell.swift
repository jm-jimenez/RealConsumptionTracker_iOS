//
//  MileageCollectionViewCell.swift
//  RealConsumptionTracker
//
//  Created by José María Jiménez on 17/03/2018.
//  Copyright © 2018 José María Jiménez. All rights reserved.
//

import UIKit

class MileageCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var barHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var mileageLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.contentView.autoresizingMask.insert(.flexibleHeight)
        self.contentView.autoresizingMask.insert(.flexibleWidth)
        self.contentView.clipsToBounds = true
    }

    func configCell(with model: MileageViewModel){
        barHeightConstraint.constant = CGFloat(Constants.defaultBarHeight * model.percentage)
        mileageLabel.text = model.mileage.twoDecimals
    }
}
