//
//  DetailViewController.swift
//  Todo
//
//  Created by 周椿杰 on 16/2/3.
//  Copyright © 2016年 周椿杰. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var childButton: UIButton!
    @IBOutlet weak var phoneButton: UIButton!
    @IBOutlet weak var shoppingCartButton: UIButton!
    @IBOutlet weak var travelButton: UIButton!
    @IBOutlet weak var todoItem: UITextField!
    @IBOutlet weak var todoDate: UIDatePicker!
    
    var todo:TodoModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        todoItem.delegate = self
        
        if todo == nil {
            navigationItem.title = "新增Todo"
            childButton.selected = true
        }
        else {
            navigationItem.title = "修改Todo"
            todoItem.text = todo?.title
            todoDate.setDate((todo?.date)!, animated: false)
            
            if todo?.image == "child-selected" {
                childButton.selected = true
            }
            else if todo?.image == "phone-selected" {
                phoneButton.selected = true
            }
            else if todo?.image == "shopping-cart-selected" {
                shoppingCartButton.selected = true
            }
            else if todo?.image == "travel-selected" {
                travelButton.selected = true
            }
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func resetButtons(){
        childButton.selected = false
        phoneButton.selected = false
        shoppingCartButton.selected = false
        travelButton.selected = false
    }
    @IBAction func childTapped(sender: AnyObject) {
        resetButtons()
        childButton.selected = true
        
    }
    @IBAction func phoneTapped(sender: AnyObject) {
        resetButtons()
        phoneButton.selected = true
        
    }
    @IBAction func shoppingCartTapped(sender: AnyObject) {
        resetButtons()
        shoppingCartButton.selected = true
        
    }
    @IBAction func travelTapped(sender: AnyObject) {
        resetButtons()
        travelButton.selected = true
        
    }
    @IBAction func okTapped(sender: AnyObject) {
        var image = ""
        if childButton.selected {
            image = "child-selected"
        }else if phoneButton.selected {
            image = "phone-selected"
        }else if shoppingCartButton.selected {
            image = "shopping-cart-selected"
        }else if travelButton.selected {
            image = "ctravel-selected"
        }
        if todo == nil {
            let uuid = NSUUID().UUIDString
            todo = TodoModel(id: uuid, image: image, title: todoItem.text!, date: todoDate.date)
            todos.append(todo!)

        }else {
            todo?.image = image
            todo?.title = todoItem.text!
            todo?.date = todoDate.date
        }
        
    }
    
    //自动关闭键盘
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        todoItem.resignFirstResponder()
        return true
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        todoItem.resignFirstResponder()
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
