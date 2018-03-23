//
//  BottomFlowLayout.swift
//  RealConsumptionTracker
//
//  Created by José María Jiménez on 17/03/2018.
//  Copyright © 2018 José María Jiménez. All rights reserved.
//

import UIKit

class BottomFlowLayout: UICollectionViewFlowLayout {

    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        let marginRight = UIScreen.main.bounds.width*0.055
        let spacing:CGFloat = UIScreen.main.bounds.width*0.03
        let marginHorizontal = CGFloat(12)
        
        guard let attributes = super.layoutAttributesForElements(in: rect) else { return nil }
        for (index, layoutAttribute) in attributes.enumerated() {
            layoutAttribute.frame = CGRect(x: layoutAttribute.frame.origin.x + marginRight, y: marginHorizontal, width: layoutAttribute.frame.width, height: layoutAttribute.frame.height - marginHorizontal*2)
            
            if index == 0 { continue }
            let prevLayoutAttributes = attributes[index - 1]
            let origin = prevLayoutAttributes.frame.maxX
            if(origin + spacing + layoutAttribute.frame.size.width < self.collectionViewContentSize.width) {
                layoutAttribute.frame.origin.x = origin + spacing
            }
        }
        
        return attributes
    }
}
