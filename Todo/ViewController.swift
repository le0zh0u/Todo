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

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        todos = [TodoModel(id: "1", image: "child-selected", title: "1.去游乐场", date: dateFromString("2015-01-01")),
                TodoModel(id: "2", image: "shopping-cart-selected", title: "2.去购物", date: dateFromString("2015-02-03")),
                TodoModel(id: "3", image: "phone-selected", title: "3.打电话", date: dateFromString("2015-03-05")),
                TodoModel(id: "4", image: "travel-selected", title: "4.Travel to Europe", date: dateFromString("2015-09-09"))]
        
        navigationItem.leftBarButtonItem = editButtonItem();
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return todos.count
    }
    
   
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        let cell = self.tableView.dequeueReusableCellWithIdentifier("todoCell")! as UITableViewCell
        
        let todo = todos[indexPath.row] as TodoModel
        
        let image = cell.viewWithTag(101) as! UIImageView
        let title = cell.viewWithTag(102) as! UILabel
        let date = cell.viewWithTag(103) as! UILabel
        
        image.image = UIImage(named: todo.image)
        title.text = todo.title
        
        let locale = NSLocale.currentLocale()
        let dateFormat = NSDateFormatter.dateFormatFromTemplate("yyyy-MM-dd", options: 0, locale: locale)
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = dateFormat
        date.text = dateFormatter.stringFromDate(todo.date)
        
        return cell
    }
    
    //UITableViewDelegate
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == UITableViewCellEditingStyle.Delete{
            todos.removeAtIndex(indexPath.row)
            self.tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
        }
    }
    
    override func setEditing(editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        self.tableView.setEditing(editing, animated: animated)
    }
    
    @IBAction func close(segue: UIStoryboardSegue){
        print("closed")
        tableView.reloadData()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "EditTodo" {
            let vc = segue.destinationViewController as! DetailViewController
            let indexPath = tableView.indexPathForSelectedRow
            if let index = indexPath{
                vc.todo = todos[index.row]
            }
        }
        
    }


}

