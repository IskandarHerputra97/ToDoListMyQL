//
//  Task.swift
//  ToDoListMySQL
//
//  Created by Iskandar Herputra Wahidiyat on 20/04/20.
//  Copyright © 2020 Iskandar Herputra Wahidiyat. All rights reserved.
//

import Foundation

struct Task: Decodable {
    var id: String
    var title: String
    var description: String
}
