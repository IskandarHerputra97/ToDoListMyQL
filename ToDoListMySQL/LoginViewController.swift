//
//  LoginViewController.swift
//  ToDoListMySQL
//
//  Created by Iskandar Herputra Wahidiyat on 20/04/20.
//  Copyright © 2020 Iskandar Herputra Wahidiyat. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    //MARK: PROPERTIES
    let stackView = UIStackView()
    let appNameLabel = UILabel()
    let emailLabel = UILabel()
    let emailTextField = UITextField()
    let passwordLabel = UILabel()
    let passwordTextField = UITextField()
    let loginButton = UIButton(type: .system)
    let changeToRegisterPageButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.title = "To Do List MySQL"
        // Do any additional setup after loading the view.
        setupAppNameLabel()
        setupEmailLabel()
        setupEmailTextField()
        setupPasswordLabel()
        setupPasswordTextField()
        setupLoginButton()
        setupChangeToRegisterPageButton()
        
        setupStackView()
    }

    //MARK: SETUP UI
    func setupStackView() {
        view.addSubview(stackView)
        
        stackView.axis = .vertical
        stackView.spacing = 20
        
        stackView.addArrangedSubview(appNameLabel)
        stackView.addArrangedSubview(emailLabel)
        stackView.addArrangedSubview(emailTextField)
        stackView.addArrangedSubview(passwordLabel)
        stackView.addArrangedSubview(passwordTextField)
        stackView.addArrangedSubview(loginButton)
        stackView.addArrangedSubview(changeToRegisterPageButton)
        
        setStackViewConstraints()
    }
    
    func setupAppNameLabel() {
        view.addSubview(appNameLabel)
        
        appNameLabel.text = "Login Page"
        appNameLabel.textAlignment = .center
    }
    
    func setupEmailLabel() {
        view.addSubview(emailLabel)
        
        emailLabel.text = "Email"
    }
    
    func setupEmailTextField() {
        view.addSubview(emailTextField)
        
        emailTextField.borderStyle = .line
    }
    
    func setupPasswordLabel() {
        view.addSubview(passwordLabel)
        
        passwordLabel.text = "Password"
    }
    
    func setupPasswordTextField() {
        view.addSubview(passwordTextField)
        
        passwordTextField.borderStyle = .line
    }
    
    func setupLoginButton() {
        view.addSubview(loginButton)
        
        loginButton.setTitle("Login", for: .normal)
        loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
    }
    
    func setupChangeToRegisterPageButton() {
        view.addSubview(changeToRegisterPageButton)
        
        changeToRegisterPageButton.setTitle("Create New Account", for: .normal)
        changeToRegisterPageButton.setTitleColor(.black, for: .normal)
        changeToRegisterPageButton.addTarget(self, action: #selector(changeToRegisterPageButtonTapped), for: .touchUpInside)
    }
    
    //MARK: SET CONSTRAINTS
    func setStackViewConstraints() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
    }
    
    //MARK: ACTIONS
    @objc func loginButtonTapped(sender: UIButton!) {
        let homeViewController = HomeViewController()
        navigationController?.setViewControllers([homeViewController], animated: true)
    }
    
    @objc func changeToRegisterPageButtonTapped(sender: UIButton!) {
        let registerViewController = RegisterViewController()
         navigationController?.setViewControllers([registerViewController], animated: true)
    }
}

