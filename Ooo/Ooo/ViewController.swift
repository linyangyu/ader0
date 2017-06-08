//
//  ViewController.swift
//  Ooo
//
//  Created by aderlin on 21/11/16.
//  Copyright © 2016 DBS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let leftItems: [String] = ["Widget", "Segment", "test3", "test4", "test5"]
    
    @IBOutlet var leftTableView: UITableView!
    @IBOutlet var rightView: UIView! =  UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.leftTableView.registerNib(UINib(nibName: "LeftTableViewCell", bundle: nil), forCellReuseIdentifier: "LeftTableViewCellId")

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return leftItems.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("LeftTableViewCellId", forIndexPath: indexPath) as! LeftTableViewCell

        cell.textField.text = leftItems[indexPath.row]
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        if(indexPath.row == 0){
            let wv = WedgetView.instanceFromNib("WedgetView") as! WedgetView
            wv.initMtd(self)
            self.rightView.addSubview(wv)
        }
        
        if(indexPath.row == 1){
            
            let sv = UINib(nibName: "SegmentedView", bundle: nil).instantiateWithOwner(nil, options: nil)[0] as! SegmentedView
            self.rightView.addSubview(sv)
        }
        
        if(indexPath.row == 3){
            let secondVC = SecondVC()
            self.presentViewController(secondVC, animated: false, completion: nil)
        }
    }

}

