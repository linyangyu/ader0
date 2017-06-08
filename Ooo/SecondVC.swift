//
//  SecondVC.swift
//  Ooo
//
//  Created by aderlin on 24/11/16.
//  Copyright © 2016 DBS. All rights reserved.
//

import UIKit

class SecondVC: UIViewController {
    @IBOutlet var segmentControl : UISegmentedControl?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        segmentControl!.addTarget(self, action: #selector(SecondVC.segmentedControlValueChanged(_:)), forControlEvents:.ValueChanged)
        segmentControl!.addTarget(self, action: #selector(SecondVC.segmentedControlValueChanged(_:)), forControlEvents:.TouchUpInside)


        // Do any additional setup after loading the view.
    }
    
    
    func segmentedControlValueChanged(segment: UISegmentedControl) {
        print(segment.selectedSegmentIndex)
    if segment.selectedSegmentIndex == 0 {
        
    }
    else {
        
        }
    }
    
    
    @IBAction  func segmentedControlChanged() {
        print(segmentControl!.selectedSegmentIndex)
        if segmentControl!.selectedSegmentIndex == 0 {
            
        }
        else {
            
        }
    }
    
    @IBAction func backClcik() {
        self.dismissViewControllerAnimated(true) { 
        }
    }

    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
