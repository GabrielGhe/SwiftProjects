//
//  TipInCellAnimator.swift
//  CardTilt
//
//  Created by Gabriel Gheorghian on 2014-09-08.
//  Copyright (c) 2014 RayWenderlich.com. All rights reserved.
//

import UIKit

class TipInCellAnimator {
    class func animate(cell: UITableViewCell) {
        let view = cell.contentView
        view.layer.opacity = 0.1
        UIView.animateWithDuration(1.4, animations: {
            view.layer.opacity = 1
        })
    }
}