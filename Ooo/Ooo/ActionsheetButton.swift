//
//  ActionsheetButton.swift
//  Ooo
//
//  Created by aderlin on 27/5/17.
//  Copyright © 2017 DBS. All rights reserved.
//

import UIKit

class ActionsheetButton: UIViewController, UIActionSheetDelegate {
    
    override func viewDidLoad() {
        
        let actionSheet = UIAlertController(title: nil, message: "Takes the appearance of the bottom bar if specified; otherwise, same as UIActionSheetStyleDefault.", preferredStyle: .ActionSheet)

        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel) { action in
            // ...
        }
        let OKAction = UIAlertAction(title: "OK", style: .Default) { action in
            // ...
        }
        
        actionSheet.addAction(cancelAction)
        actionSheet.addAction(OKAction)
        
        actionSheet.title = "MenuTitle"
        self.presentViewController(actionSheet, animated: true) {
            // ...
        }
        
    }
    
}
