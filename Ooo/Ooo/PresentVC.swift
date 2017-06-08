//
//  ThirdVC.swift
//  Ooo
//
//  Created by aderlin on 29/11/16.
//  Copyright © 2016 DBS. All rights reserved.
//

import UIKit

class PresentVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(animated: Bool) {
        self.navigationController?.navigationBar.hidden = true
    }
    
    override func viewDidAppear(animated: Bool) {
        //self.navigationController?.navigationBar.hidden = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func nextPressed() {
        
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let vc: UIViewController = storyboard.instantiateViewControllerWithIdentifier("NewVC") as UIViewController
        self.navigationController?.pushViewController(vc, animated: true)

    }
    
    @IBAction func backPressed(){
        self.dismissViewControllerAnimated(true, completion:{})
    }

}
