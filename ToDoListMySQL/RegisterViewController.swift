//
//  RegisterViewController.swift
//  ToDoListMySQL
//
//  Created by Iskandar Herputra Wahidiyat on 20/04/20.
//  Copyright © 2020 Iskandar Herputra Wahidiyat. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {

    //MARK: PROPERTIES
    let stackView = UIStackView()
    let appNameLabel = UILabel()
    let emailLabel = UILabel()
    let emailTextField = UITextField()
    let passwordLabel = UILabel()
    let passwordTextField = UITextField()
    let registerButton = UIButton(type: .system)
    let changeToLoginPageButton = UIButton()
    
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
        setupRegisterButton()
        setupChangeToLoginPageButton()
        
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
        stackView.addArrangedSubview(registerButton)
        stackView.addArrangedSubview(changeToLoginPageButton)
        
        setStackViewConstraints()
    }
    
    func setupAppNameLabel() {
        view.addSubview(appNameLabel)
        
        appNameLabel.text = "Register Page"
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
    
    func setupRegisterButton() {
        view.addSubview(registerButton)
        
        registerButton.setTitle("Register", for: .normal)
        registerButton.addTarget(self, action: #selector(registerButtonTapped), for: .touchUpInside)
    }
    
    func setupChangeToLoginPageButton() {
        view.addSubview(changeToLoginPageButton)
        
        changeToLoginPageButton.setTitle("Already have an account? Login", for: .normal)
        changeToLoginPageButton.setTitleColor(.black, for: .normal)
        changeToLoginPageButton.addTarget(self, action: #selector(changeToLoginPageButtonTapped), for: .touchUpInside)
    }
    
    //MARK: SET CONSTRAINTS
    func setStackViewConstraints() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
    }

    //MARK: ACTIONS
    @objc func registerButtonTapped(sender: UIButton!) {
        let homeViewController = HomeViewController()
        navigationController?.setViewControllers([homeViewController], animated: true)
    }
    
    @objc func changeToLoginPageButtonTapped(sender: UIButton!) {
        let loginViewController = LoginViewController()
        navigationController?.setViewControllers([loginViewController], animated: true)
    }

}
