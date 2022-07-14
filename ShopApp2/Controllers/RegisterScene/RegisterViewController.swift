//
//  RegisterViewController.swift
//  ShopApp2
//
//  Created by Aleksandar Micevski on 12.2.22.
//

import UIKit
class RegisterViewController: UIViewController {
    
    var navbar: NavigationView!
    var signUpButton: UIButton!
    var holderView: UIView!
    var orSignUpViaLabel: UILabel!
    var signUpWithFacebookButton: UIButton!
    var tableView: UITableView!
    var textFieldPlaceHolders = ["First Name",
                                 "Last Name",
                                 "Date of Birth",
                                 "Email",
                                 "City",
                                 "Phone Number",
                                 "Username",
                                 "Password",
                                 "Confirm Password"]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupViews()
        setupConstraints()
        
        NotificationCenter.default.addObserver(self, selector: #selector(ChatViewController.keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
         
        NotificationCenter.default.addObserver(self, selector: #selector(ChatViewController.keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)

    }
    
    func setupViews() {
        self.view.backgroundColor = .systemGray6
        
        navbar = NavigationView()
        navbar.configure(title: "Register", backButton: true)
        navbar.cartButton.removeFromSuperview()
        navbar.delegate = self
        self.view.addSubview(navbar)
        
        holderView = UIView()
        holderView.backgroundColor = .white
        holderView.layer.cornerRadius = 20
        holderView.layer.borderWidth = 1
        holderView.layer.borderColor = UIColor.systemGray.cgColor
        holderView.layer.masksToBounds = false
        
        tableView = UITableView()
        tableView.backgroundColor = .white
        tableView.register(RegisterTableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.register(PhoneNumberTableViewCell.self, forCellReuseIdentifier: "cell2")
        tableView.delegate = self
        tableView.dataSource = self
        holderView.addSubview(tableView)
        
        self.view.addSubview(holderView)
        
        signUpButton = UIButton(type: .system)
        signUpButton.setTitle("Sign Up", for: .normal)
        signUpButton.layer.borderWidth = 1
        signUpButton.layer.cornerRadius = 15
        signUpButton.backgroundColor = .white
        signUpButton.tintColor = .black
        signUpButton.addTarget(self, action: #selector(signUpButtonAction), for: .touchUpInside)
        self.view.addSubview(signUpButton)
        
        signUpWithFacebookButton = UIButton(type: .system)
        signUpWithFacebookButton.setTitle("Facebook", for: .normal)
        signUpWithFacebookButton.layer.borderWidth = 1
        signUpWithFacebookButton.layer.cornerRadius = 15
        signUpWithFacebookButton.backgroundColor = .systemBlue
        signUpWithFacebookButton.tintColor = .white
        self.view.addSubview(signUpWithFacebookButton)
        
        orSignUpViaLabel = UILabel()
        orSignUpViaLabel.text = "Or sign up via"
        self.view.addSubview(orSignUpViaLabel)
        
    }
    
    func setupConstraints() {
        navbar.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide)
            make.left.right.equalTo(self.view)
            make.height.equalTo(self.view).dividedBy(12)
        }
        
        holderView.snp.makeConstraints { make in
            make.top.equalTo(navbar.snp.bottom).offset(20)
            make.left.right.equalTo(self.view).inset(20)
            make.bottom.equalTo(signUpButton.snp.top).offset(-20)
        }
        
        tableView.snp.makeConstraints { make in
            make.edges.equalTo(holderView).inset(20)
        }
        
        signUpButton.snp.makeConstraints { make in
            make.bottom.equalTo(orSignUpViaLabel.snp.top).offset(-5)
            make.left.right.equalTo(self.view).inset(20)
            make.height.equalTo(45)
        }
        
        orSignUpViaLabel.snp.makeConstraints { make in
            make.bottom.equalTo(signUpWithFacebookButton.snp.top).offset(-10)
            make.centerX.equalTo(self.view.snp.centerX)
            make.height.equalTo(45)
        }
        
        signUpWithFacebookButton.snp.makeConstraints { make in
            make.bottom.equalTo(self.view).offset(-50)
            make.left.right.equalTo(self.view).inset(20)
            make.height.equalTo(45)
        }
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
            
        guard let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else {
           // if keyboard size is not available for some reason, dont do anything
           return
        }
      
        holderView.snp.remakeConstraints { make in
            make.top.equalTo(navbar.snp.bottom).offset(20)
            make.left.right.equalTo(self.view).inset(20)
            make.bottom.equalTo(self.view).offset(-keyboardSize.height)
        }
        
    }

    @objc func keyboardWillHide(notification: NSNotification) {
        holderView.snp.remakeConstraints { make in
            make.top.equalTo(navbar.snp.bottom).offset(20)
            make.left.right.equalTo(self.view).inset(20)
            make.bottom.equalTo(signUpButton.snp.top).offset(-20)
        }
        
    }
    
    @objc func signUpButtonAction() {
        let vc = MainViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension RegisterViewController: NavigationViewDelegate {
    func backButtonTapped() {
        self.navigationController?.popViewController(animated: true)
    }
    
    func cartButtonTapped() {
        
    }
    
    func messagesButtonTapped() {
        
    }
    
    func notificationsButtonTapped() {
        
    }
}

extension RegisterViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return textFieldPlaceHolders.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if textFieldPlaceHolders[indexPath.row] == "Phone Number" {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell2") as! PhoneNumberTableViewCell
            cell.phoneNumberTextField.delegate = self
            cell.phoneNumberTextField.tag = indexPath.row
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! RegisterTableViewCell
            cell.textField.tag = indexPath.row
            cell.textField.delegate = self
            cell.setupCell(text: textFieldPlaceHolders[indexPath.row])
            return cell
        }
    }
}

extension RegisterViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField.tag + 1 < textFieldPlaceHolders.count {
            tableView.scrollToRow(at: [0,textField.tag + 1], at: .top, animated: true)
            if textFieldPlaceHolders[textField.tag + 1] == "Phone Number" {
                let cell = tableView.cellForRow(at: [0,textField.tag + 1]) as! PhoneNumberTableViewCell
                cell.phoneNumberTextField.becomeFirstResponder()
            } else {
                let cell = tableView.cellForRow(at: [0,textField.tag + 1]) as! RegisterTableViewCell
                cell.textField.becomeFirstResponder()
            }
        } else {
            if textFieldPlaceHolders[textField.tag] == "Phone Number" {
                let cell = tableView.cellForRow(at: [0,textField.tag + 1]) as! PhoneNumberTableViewCell
                cell.phoneNumberTextField.resignFirstResponder()
            } else {
                let cell = tableView.cellForRow(at: [0,textField.tag ]) as! RegisterTableViewCell
                cell.textField.resignFirstResponder()
            }
        }
        
        return true
    }
}
