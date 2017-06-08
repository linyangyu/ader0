//
//  SegmentedView.swift
//  Ooo
//
//  Created by aderlin on 23/11/16.
//  Copyright © 2016 DBS. All rights reserved.
//

import UIKit

class SegmentedView: UIView {
    
    @IBOutlet weak var firstBtn: UIButton!
    @IBOutlet weak var secondBtn: UIButton!
    @IBOutlet var context: UILabel!
    
    
    @IBAction func btnClicked() {
        print("btn clciked")
    }
}
