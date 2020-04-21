//
//  TaskAPI.swift
//  ToDoListMySQL
//
//  Created by Iskandar Herputra Wahidiyat on 20/04/20.
//  Copyright © 2020 Iskandar Herputra Wahidiyat. All rights reserved.
//

import Foundation

class TaskAPI {
    static func getTask2() {
        let url = "http://localhost/ToDoList/get_task.php"
        let urlObj = URL(string: url)
        
        URLSession.shared.dataTask(with: urlObj!) {(data, response, error) in
            do {
                task = try JSONDecoder().decode([Task].self, from: data!)
                
                for i in task {
                    //print(i.id + " - " + i.title + " : " + i.description)
                    //print(taskList2)
                    //print(i.title)
                    //tempTaskList = [i]
                }
            } catch {
                print(error)
            }
        }.resume()
    }
}
