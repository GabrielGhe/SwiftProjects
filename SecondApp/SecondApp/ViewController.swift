//
//  ViewController.swift
//  SecondApp
//
//  Created by Gabriel on 2014-06-11.
//  Copyright (c) 2014 Gabriel. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate {
    
    @IBOutlet var tableView : UITableView = UITableView()
    var dataSource:NSMutableArray = NSMutableArray()
    var headerView:UIView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        headerView.frame = CGRectMake(0, 0, 230, 200)
        headerView.backgroundColor = UIColor.blackColor()
        
        tableView.tableHeaderView = headerView
        
        var nameTextField:UITextField = UITextField(frame:CGRectMake(0, 0, 150, 45))
        nameTextField.center = headerView.center
        nameTextField.backgroundColor = UIColor.whiteColor()
        nameTextField.textAlignment = NSTextAlignment.Center
        nameTextField.placeholder = "Enter your name"
        nameTextField.delegate = self
        headerView.addSubview(nameTextField)
    }
    
    func tableView(tableView:UITableView!, numberOfRowsInSection section:Int) -> Int {
        return dataSource.count
    }
    
    func tableView(tableView: UITableView!, didSelectRowAtIndexPath: NSIndexPath!){
        var alert:UIAlertController = UIAlertController(title: "Message", message: "Thanks for clicking", preferredStyle: UIAlertControllerStyle.Alert)
        
        alert.addAction(UIAlertAction(title: "Close AlertView", style: UIAlertActionStyle.Default, handler: nil))
        
        alert.addAction(UIAlertAction(title: "Change header color", style: UIAlertActionStyle.Default, handler: {alertAction in
            UIView.animateWithDuration(2.5, animations: {self.headerView.backgroundColor = UIColor.blueColor()}, completion: {_ in
                println("Animation complete")
            })
        }))
        
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    func numberOfSectionsInTableView(tableView: UITableView!) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
        let kCellIdentifier:String = "cellidentifier"
        var cell:UITableViewCell = tableView.dequeueReusableCellWithIdentifier(kCellIdentifier) as UITableViewCell
        
        if cell == nil {
            cell = UITableViewCell(style:UITableViewCellStyle.Default, reuseIdentifier:kCellIdentifier)
        }
        
        cell.text = "Hello \(dataSource.objectAtIndex(indexPath.row) as String)"
        return cell
    }
    
    func textFieldShouldReturn(textField: UITextField!) -> Bool {
        textField.resignFirstResponder()
        dataSource.addObject(textField.text as String)
        tableView.reloadData()
        textField.text = ""
        return true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

