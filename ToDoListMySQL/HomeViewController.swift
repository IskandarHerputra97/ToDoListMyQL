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
    
    override func viewWillAppear(_ animated: Bool) {
        fetchTask()
    }
    
    //MARK: NETWORK REQUEST
    /*
    func fetchTask() {
        guard let url = URL(string: "http://localhost/ToDoList/get_task.php") else {return}
        
        let session = URLSession.shared
        session.dataTask(with: url) { (data, response, error) in
            if let response = response {
                print(response)
            }
            
            if let data = data {
                print(data)
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    print(json)
                } catch {
                    print(error)
                }
            }
        }.resume()
    }
    
    func postTask() {
        let parameters = ["title": "Service mobil", "description": "Service mobil sedan"]
        
        guard let url = URL(string: "http://localhost/ToDoList/post_task.php") else {return}
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        //request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        guard let httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: []) else {return}
        request.httpBody = httpBody
        
        let session = URLSession.shared
        session.dataTask(with: request) { (data, response, error) in
            if let response = response {
                print(response)
            }
            
            if let data = data {
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    print(json)
                } catch {
                    print(error)
                }
            }
        }.resume()
    }
    */
    
    func fetchTask() {
        let url = "http://localhost/ToDoList/get_task.php"
        let urlObj = URL(string: url)
        
        URLSession.shared.dataTask(with: urlObj!) {(data, response, error) in
            do {
                var taskList2 = try JSONDecoder().decode([Task2].self, from: data!)
                
                for i in taskList2 {
                    print(i.id + " - " + i.title + " : " + i.description)
                }
            } catch {
                print(error)
            }
        }.resume()
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
