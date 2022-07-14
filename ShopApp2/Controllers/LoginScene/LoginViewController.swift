//
//  LoginViewController.swift
//  ShopApp2
//
//  Created by Aleksandar Micevski on 12.2.22.
//

import UIKit

class LoginViewController: UIViewController {

    var loginButton: UIButton!
    var registerButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupViews()
        setupConstraints()
    }
    
    func setupViews() {
        self.view.backgroundColor = .white
        
        loginButton = UIButton()
        loginButton.setTitle("Login", for: .normal)
        loginButton.configuration = .bordered()
        loginButton.configuration?.baseBackgroundColor = .black
        loginButton.configuration?.baseForegroundColor = .white
        loginButton.addTarget(self, action: #selector(loginButtonAction), for: .touchUpInside)
        self.view.addSubview(loginButton)
        
        registerButton = UIButton()
        registerButton.setTitle("Register", for: .normal)
        registerButton.configuration = .bordered()
        registerButton.configuration?.baseBackgroundColor = .black
        registerButton.configuration?.baseForegroundColor = .white
        registerButton.addTarget(self, action: #selector(registerAction), for: .touchUpInside)
        self.view.addSubview(registerButton)
    }
    
    func setupConstraints() {
        registerButton.snp.makeConstraints { make in
            make.bottom.equalTo(self.view).offset(-50)
            make.left.right.equalTo(self.view).inset(20)
            make.height.equalTo(45)
        }
        
        loginButton.snp.makeConstraints { make in
            make.bottom.equalTo(self.registerButton.snp.top).offset(-20)
            make.left.right.equalTo(self.view).inset(20)
            make.height.equalTo(45)
        }
    }
    
    @objc func registerAction() {
        let vc = RegisterViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func loginButtonAction() {
        let vc = MainViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
