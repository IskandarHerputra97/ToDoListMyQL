//
//  TaskTableViewCell.swift
//  ToDoListMySQL
//
//  Created by Iskandar Herputra Wahidiyat on 20/04/20.
//  Copyright © 2020 Iskandar Herputra Wahidiyat. All rights reserved.
//

import UIKit

class TaskTableViewCell: UITableViewCell {
    
    var taskTitleLabel = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(taskTitleLabel)
        
        configureTaskTitleLabel()
        setTaskTitleLabelConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(task: Task) {
        taskTitleLabel.text = task.taskTitle
    }
    
    func configureTaskTitleLabel() {
        taskTitleLabel.numberOfLines = 0
        taskTitleLabel.adjustsFontSizeToFitWidth = true
    }
    
    func setTaskTitleLabelConstraints() {
        taskTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        taskTitleLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        taskTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12).isActive = true
        taskTitleLabel.heightAnchor.constraint(equalToConstant: 80).isActive = true
    }
}
