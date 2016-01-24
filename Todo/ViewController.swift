//
//  ViewController.swift
//  Todo
//
//  Created by 周椿杰 on 16/1/24.
//  Copyright © 2016年 周椿杰. All rights reserved.
//

import UIKit


//data base
var todos : [TodoModel] = []

func dateFromString(dateStr:String) -> NSDate{
    let dateFormatter = NSDateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd"
    let date = dateFormatter.dateFromString(dateStr)
    return date!;
}

class ViewController: UIViewController,UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        todos = [TodoModel(id: "1", image: "child-selected", title: "1.去游乐场", date: dateFromString("2015-01-01")),
                TodoModel(id: "2", image: "shopping-cart-selected", title: "2.去购物", date: dateFromString("2015-02-03")),
                TodoModel(id: "3", image: "phone-selected", title: "3.打电话", date: dateFromString("2015-03-05")),
                TodoModel(id: "4", image: "travel-selected", title: "4.Travel to Europe", date: dateFromString("2015-09-09"))]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return 20
    }
    
   
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        let cell = self.tableView.dequeueReusableCellWithIdentifier("todoCell")! as UITableViewCell
        
        return cell
    }


}

