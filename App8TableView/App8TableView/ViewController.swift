//
//  ViewController.swift
//  App8TableView
//
//  Created by Gabriel on 2014-06-30.
//  Copyright (c) 2014 Gabriel. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
                            
    @IBOutlet var tableView : UITableView
    var itemCount = 10
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.separatorStyle = UITableViewCellSeparatorStyle.None
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    //How many rows
    func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
        return itemCount
    }
    
    //display cell at indexPath
    func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
        let cell:UITableViewCell = UITableViewCell(style: .Subtitle, reuseIdentifier: "MyTestCell")
        
        cell.text = "Row #\(indexPath.row)"
        cell.detailTextLabel.text = "Subtitle #\(indexPath.row)"
        cell.accessoryType = .Checkmark
        return cell
    }
    
    //Style cell
    func tableView(tableView: UITableView!, willDisplayCell cell: UITableViewCell!, forRowAtIndexPath indexPath: NSIndexPath!) {
        cell.backgroundColor = self.colorForIndex(indexPath.row);
    }
    
    func colorForIndex(row: Int) -> UIColor{
        var val:Float = (Float(row) / Float(itemCount - 1)) * 0.6
        return UIColor(red: 1.0, green: val, blue: 0.0, alpha: 1.0)
    }
}

