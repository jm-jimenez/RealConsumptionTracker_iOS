//
//  RefuelTableViewCell.swift
//  RealConsumptionTracker
//
//  Created by José María Jiménez on 18/03/2018.
//  Copyright © 2018 José María Jiménez. All rights reserved.
//

import UIKit

class RefuelTableViewCell: UITableViewCell {
    
    @IBOutlet weak var totalOdoLabel: UILabel!
    @IBOutlet weak var litresLabel: UILabel!
    @IBOutlet weak var eurosLabel: UILabel!
    @IBOutlet weak var partialOdoLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configCell(with viewmodel: RefuelCellViewModel) {
        totalOdoLabel.text = viewmodel.totalOdo
        litresLabel.text = viewmodel.litres
        eurosLabel.text = viewmodel.euros
        partialOdoLabel.text = viewmodel.partialOdo
    }
    
}
