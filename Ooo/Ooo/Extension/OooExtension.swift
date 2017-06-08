//
//  OooExtension.swift
//  Ooo
//
//  Created by aderlin on 24/11/16.
//  Copyright © 2016 DBS. All rights reserved.
//

import UIKit

public extension UIView {
    
    class func instanceFromNib(nibName: String) -> UIView {
        return UINib(nibName: nibName, bundle: nil).instantiateWithOwner(nil, options: nil)[0] as! UIView
    }
    
}
