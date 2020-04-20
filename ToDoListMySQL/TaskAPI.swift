//
//  TaskAPI.swift
//  ToDoListMySQL
//
//  Created by Iskandar Herputra Wahidiyat on 20/04/20.
//  Copyright © 2020 Iskandar Herputra Wahidiyat. All rights reserved.
//

import Foundation

class TaskAPI {
    static func getTask() -> [Task] {
        let taskList = [
            Task(id: 1, taskTitle: "Sarapan", taskDescription: "Sarapan roti dengan selai kacang"),
            Task(id: 2, taskTitle: "Makan siang", taskDescription: "Makan siang dengan nasi goreng"),
            Task(id: 3, taskTitle: "Makan malam", taskDescription: "Makan malam dengan nasi padang"),
            Task(id: 4, taskTitle: "Isi bensin", taskDescription: "Isi bensin motor vario"),
            Task(id: 5, taskTitle: "Olahraga", taskDescription: "Jogging keliling taman"),
        ]
        return taskList
    }
    
    private let taskList = TaskAPI.getTask()
}
