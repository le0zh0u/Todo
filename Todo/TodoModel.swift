//
//  TodoModel.swift
//  Todo
//
//  Created by 周椿杰 on 16/1/24.
//  Copyright © 2016年 周椿杰. All rights reserved.
//

import UIKit

class TodoModel: NSObject {
    
    var id:String
    var image: String
    var title:String
    var date: NSDate
    
    init(id:String, image:String, title:String, date:NSDate) {
        self.id = id
        self.image = image
        self.title = title
        self.date = date
    }

}
