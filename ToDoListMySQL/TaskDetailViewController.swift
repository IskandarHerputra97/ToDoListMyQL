//
//  TaskDetailViewController.swift
//  ToDoListMySQL
//
//  Created by Iskandar Herputra Wahidiyat on 21/04/20.
//  Copyright © 2020 Iskandar Herputra Wahidiyat. All rights reserved.
//

import UIKit

class TaskDetailViewController: UIViewController {

    //MARK: PROPERTIES
    var stackView = UIStackView()
    var taskTitleLabel = UILabel()
    var taskDescriptionLabel = UILabel()
    var index = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.title = "Task Detail"
        // Do any additional setup after loading the view.
        setupNavigationBarItem()
        setupTaskTitleLabel()
        setupTaskDescriptionLabel()
        setupStackView()
    }
    
    //MARK: SETUP UI
    func setupNavigationBarItem() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(editNavigationBarItemTapped))
    }
    
    func setupStackView() {
        view.addSubview(stackView)
        
        stackView.axis = .vertical
        stackView.alignment = .center
        
        stackView.addArrangedSubview(taskTitleLabel)
        stackView.setCustomSpacing(100, after: taskTitleLabel)
        stackView.addArrangedSubview(taskDescriptionLabel)
        
        setStackViewConstraints()
    }
    
    func setupTaskTitleLabel() {
        taskTitleLabel.text = task[index].title
    }
    
    func setupTaskDescriptionLabel() {
        taskDescriptionLabel.text = task[index].description
    }
    
    //MARK: SETUP CONSTRAINTS
    func setStackViewConstraints() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant:  50).isActive = true
        stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
    }
    
    //MARK: ACTIONS
    @objc func editNavigationBarItemTapped() {
        let editTaskViewController = EditTaskViewController()
        navigationController?.pushViewController(editTaskViewController, animated: true)
    }
}
