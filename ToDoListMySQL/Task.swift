//
//  Task.swift
//  ToDoListMySQL
//
//  Created by Iskandar Herputra Wahidiyat on 20/04/20.
//  Copyright © 2020 Iskandar Herputra Wahidiyat. All rights reserved.
//

import Foundation


struct Task {
    var id:Int?
    var taskTitle:String?
    var taskDescription:String?
}


struct Task2: Decodable {
    let id: String
    let title: String
    let description: String
}
