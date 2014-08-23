//
//  ViewController.swift
//  App3
//
//  Created by Gabriel on 2014-06-19.
//  Copyright (c) 2014 Gabriel. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //Variables
    let tableViewRect = CGRectMake(20, 64, 280, UIScreen.mainScreen().bounds.size.height - 84)
    let tableView: UITableView = {
        let tableView = UITableView()
        return tableView
    }()
    
    let buttonRect = CGRectMake(UIScreen.mainScreen().bounds.size.width - 84, 10, 44, 44)
    let button: UIButton = {
        let button = UIButton()
        return button
    }()
    var dataSource = [["one", "two"], ["three"]];
    
    
    //Funcs
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        //tableView
        tableView.frame = tableViewRect
        tableView.backgroundColor = UIColor.brownColor()
        self.view.addSubview(tableView)
        
        //button
        button.frame = buttonRect
        button.backgroundColor = UIColor.blueColor()
        button.setTitle("+", forState: UIControlState.Normal)
        self.view.addSubview(button)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSectionsInTableView(tableView: UITableView!) -> Int {
        return dataSource.count
    }
    
    func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
        return dataSource[section].count
    }

    func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
        let cell = tableView!.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath!) as UITableViewCell
        if let path = indexPath {
            let currentString = dataSource[path.section][path.row]
            cell.text = currentString
        }
        
        return cell
    }
    
    func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!) {
        println(indexPath)
    }
    
    func tableView(tableView: UITableView!, titleForHeaderInSection section: Int) -> String! {
        var toReturn = ""
        switch(section) {
        case 0:
            toReturn = "Not Completed"
        case 1:
            toReturn = "Completed"
        default:
            toReturn = ""
        }
        return toReturn
    }
}

