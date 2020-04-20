//
//  HomeViewController.swift
//  ToDoListMySQL
//
//  Created by Iskandar Herputra Wahidiyat on 20/04/20.
//  Copyright © 2020 Iskandar Herputra Wahidiyat. All rights reserved.
//

import UIKit

var task:[Task] = []

class HomeViewController: UIViewController {

    //MARK: PROPERTIES
    let stackView = UIStackView()
    var taskTableView = UITableView()
    let signOutButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Home Page"
        view.backgroundColor = .white
        task = TaskAPI.getTask()
        // Do any additional setup after loading the view.
        setupTaskTableView()
        setupSignOutButton()
        setupStackView()
    }
    
    //MARK: SETUP UI
    func setupStackView() {
        view.addSubview(stackView)
        
        stackView.axis = .vertical
        stackView.spacing = 20
        
        stackView.addArrangedSubview(taskTableView)
        stackView.addArrangedSubview(signOutButton)
        
        setStackViewConstraints()
    }
    
    func setupTaskTableView() {
        view.addSubview(taskTableView)
        
        taskTableView.delegate = self
        taskTableView.dataSource = self
        
        taskTableView.register(TaskTableViewCell.self, forCellReuseIdentifier: "TaskTableViewCell")
    }
    
    func setupSignOutButton() {
        view.addSubview(signOutButton)
        
        signOutButton.setTitle("Sign Out", for: .normal)
        signOutButton.setTitleColor(.red, for: .normal)
        
        signOutButton.addTarget(self, action: #selector(signOutButtonTapped), for: .touchUpInside)
    }
    
    //MARK: SET CONSTRAINTS
    func setStackViewConstraints() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }

    //MARK: ACTIONS
    @objc func signOutButtonTapped(sender: UIButton!) {
        let loginViewController = LoginViewController()
        navigationController?.setViewControllers([loginViewController], animated: true)
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return task.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TaskTableViewCell", for: indexPath) as! TaskTableViewCell
        let myTask = task[indexPath.row]
        cell.set(task: myTask)
       
        return cell
    }
}
