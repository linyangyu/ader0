//
//  WedgetView.swift
//  Ooo
//
//  Created by aderlin on 24/11/16.
//  Copyright © 2016 DBS. All rights reserved.
//

import UIKit

class WedgetView: UIView {
    
    var viewController : ViewController?
    
    //1. SegmentControl ActivityIndicator
    let segmentArray = ["Frist", "Second", "Third"]
    
    let countrySections = ["Asia", "African","Europe","XX01","XX02","XX03","XX04","XX05","XX06","XX07","XX08","XX09","ZZ01","ZZ02","ZZ03","ZZ04","ZZ05","ZZ06","ZZ07","ZZ08","ZZ09"]
    let asiaCountries = ["China", "Bahrain", "Bahrain", "Bhutan", "Russia", "India", "Japan"]
    let europeCounries = ["Germany", "Turkey", "France", "Italy", "Spain"]
    let africanCountries = ["Algeria", "Cameroon", "Eritrea", "Cape Verde", "Kenya"]
    let others = ["Singapore"]

    @IBOutlet var segmentControl: UISegmentedControl!
    @IBOutlet var segmentSelectLabel: UILabel!
    @IBOutlet var segmentSelectValue: UILabel!
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    var isRunning: Bool =  false
    let countryTableViewCellId = "countryTableViewCellId"

    
    @IBAction func segmentedControlValueChanged(segment: UISegmentedControl) {
        segmentSelectValue.text = segmentArray[segment.selectedSegmentIndex]
        activity()
    }
    
    func initMtd(viewController : ViewController) {
        segmentSelectValue.text = segmentArray[segmentControl.selectedSegmentIndex]
        activity()
        self.viewController = viewController
        initImageBtn()
    }
    
    func activity() {
        if(!isRunning) {
            activityIndicator.hidden = false
            activityIndicator.startAnimating()
            isRunning = true
        }else {
            activityIndicator.hidden = true
            activityIndicator.stopAnimating()
            isRunning = false
        }
    }
    
    //2. Image Button
    @IBOutlet var imageBtn: UIButton!
    @IBAction func imageBtnSelected(sender: UIButton){

        if(sender.selected){
            sender.selected = false
        }else{
            sender.selected = true
        }
        
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let vc: UIViewController = storyboard.instantiateViewControllerWithIdentifier("PresentVC") as UIViewController
        let navController = UINavigationController(rootViewController: vc)
        self.viewController?.presentViewController(navController, animated: true, completion: nil)
        
    }
    
    func initImageBtn(){
        imageBtn!.layer.cornerRadius = 2
        imageBtn!.layer.borderWidth = 1
        imageBtn!.layer.borderColor = UIColor(red:224/255.0, green:224/255.0, blue:224/255.0, alpha: 1.0).CGColor
    }
    
    //3. Actionsheet Button
    @IBAction func actionSheetBtn(sender: AnyObject) {
        
        self.viewController?.presentViewController(WedgetUtils.getActionsheet(self), animated: true, completion: nil)
    }
    
    
    //Table View
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        var numberOfRows = 0
        
        if(countrySections[section].lowercaseString == "asia"){
            numberOfRows = asiaCountries.count
        }else if(countrySections[section].lowercaseString == "europe"){
            numberOfRows = europeCounries.count
        }else if(countrySections[section].lowercaseString == "african") {
            numberOfRows = africanCountries.count
        }else {
            numberOfRows = others.count
        }
        
        return numberOfRows
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        tableView.registerNib(UINib(nibName: "CountryTableViewCell", bundle: nil), forCellReuseIdentifier: "CountryTableViewCellId")

        var cell: CountryTableViewCell! = tableView.dequeueReusableCellWithIdentifier(countryTableViewCellId) as? CountryTableViewCell
        if cell == nil {
            tableView.registerNib(UINib(nibName: "CountryTableViewCell", bundle: nil), forCellReuseIdentifier: countryTableViewCellId)
            cell = tableView.dequeueReusableCellWithIdentifier(countryTableViewCellId) as? CountryTableViewCell
        }
        
        switch countrySections[indexPath.section].lowercaseString {
        case "asia":
            cell.contentText.text = asiaCountries[indexPath.row]
        case "europe":
            cell.contentText.text = europeCounries[indexPath.row]
        case "african":
            cell.contentText.text = africanCountries[indexPath.row]
        default:
            cell.contentText.text = "Singapore"
        }
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return countrySections[section]
        
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return countrySections.count
    }
    
    
    func sectionIndexTitlesForTableView(tableView: UITableView) -> [String]? {
        
        var listArray = [String]()
        for value in countrySections {
            var added = false
            for addedValue in listArray {
                if addedValue.containsString((value as NSString).substringToIndex(1)) {
                    added = true
                }
            }
            if !added {
                listArray.append((value as NSString).substringToIndex(1))
            }
        }
        
        return listArray
        
        //return countrySections
        
    }
    
    func tableView(tableView: UITableView, sectionForSectionIndexTitle title: String, atIndex index: Int) -> Int {
        
        var index = 0
        for value in countrySections {
            if (value as NSString).substringToIndex(1).containsString(title) {
                break
            }
            index = index + 1
        }
        
        return index
    }
    
}
