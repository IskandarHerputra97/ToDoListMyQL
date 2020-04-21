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
            Task(id: 1, taskTitle: "Check Email", taskDescription: "Check google mail"),
            Task(id: 2, taskTitle: "Ambil KTP", taskDescription: "Ambil KTP dari Kantor kelurahan"),
            Task(id: 3, taskTitle: "Isi pulsa", taskDescription: "Isi pulsa bulanan"),
            Task(id: 4, taskTitle: "Buat website", taskDescription: "Website portofolio"),
            Task(id: 5, taskTitle: "Istirahat", taskDescription: "Istirahat 30 menit"),
        ]
        return taskList
    }
    
    private let taskList = TaskAPI.getTask()
}
