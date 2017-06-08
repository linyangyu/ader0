//
//  WedgetUtils.swift
//  Ooo
//
//  Created by aderlin on 27/5/17.
//  Copyright © 2017 DBS. All rights reserved.
//

import UIKit

class WedgetUtils: UIView {
    
    class func getActionsheet(sourceView: UIView) -> UIAlertController{
        
        let actionSheet = UIAlertController(title: "Menu Title", message: "Note: ...", preferredStyle: .ActionSheet)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel) { action in
            // ...
            print("cancelAction Btn")
        }
        let OKAction = UIAlertAction(title: "OK", style: .Default) { action in
            // ...
            print("okAction Btn")
        }
        
        let destroyAction = UIAlertAction(title: "Destroy", style: .Destructive) { action in
            print(action)
        }
        actionSheet.addAction(destroyAction)
        
        actionSheet.addAction(cancelAction)
        actionSheet.addAction(OKAction)

        //Display in button
        let newPosition = CGRectMake(0,sourceView.bounds.height,sourceView.bounds.width,sourceView.bounds.height)
        
        actionSheet.popoverPresentationController?.sourceView = sourceView
        actionSheet.popoverPresentationController?.sourceRect = newPosition
        
        
        return actionSheet
        
    }
    

}
