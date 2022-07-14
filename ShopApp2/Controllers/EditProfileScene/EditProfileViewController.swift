//
//  EditProfileViewController.swift
//  ShopApp2
//
//  Created by Aleksandar Micevski on 17.2.22.
//

import UIKit

class EditProfileViewController: UIViewController {
    
    var profileImageView: UIImageView!
    var addPhotoButton: UIButton!
    var titleLabel: UILabel!
    var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupViews()
        setupConstraints()
        
        NotificationCenter.default.addObserver(self, selector: #selector(ChatViewController.keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
         
        NotificationCenter.default.addObserver(self, selector: #selector(ChatViewController.keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    func setupViews() {
        self.view.backgroundColor = UIColor(red: 0.96, green: 0.97, blue: 0.95, alpha: 1.00)
        
        profileImageView = UIImageView()
        profileImageView.image = UIColor(red: 0.85, green: 0.85, blue: 0.85, alpha: 1.00).image(CGSize(width: self.view.frame.width / 3, height: self.view.frame.width / 3))
        profileImageView.layer.masksToBounds = false
        profileImageView.layer.cornerRadius = profileImageView.image!.size.width / 2
        profileImageView.clipsToBounds = true
        self.view.addSubview(profileImageView)
        
        addPhotoButton = UIButton()
        addPhotoButton.setImage(UIImage(systemName: "camera"), for: .normal)
        addPhotoButton.backgroundColor = UIColor(red: 0.85, green: 0.83, blue: 0.79, alpha: 1.00)
        addPhotoButton.tintColor = .black
        addPhotoButton.layer.borderWidth = 1
        addPhotoButton.layer.cornerRadius = self.view.frame.size.width / 16
//        addPhotoButton.addTarget(self, action: #selector(addPhotoButtonAction), for: .touchUpInside)
        self.view.addSubview(addPhotoButton)
        
        titleLabel = UILabel()
        titleLabel.textColor = UIColor(red: 0.24, green: 0.22, blue: 0.21, alpha: 1.00)
        titleLabel.text = "Edit your profile"
        titleLabel.font = UIFont(name:"HelveticaNeue-Bold", size: 30)
        self.view.addSubview(titleLabel)
        
        tableView = UITableView()
        tableView.backgroundColor = UIColor(red: 0.96, green: 0.97, blue: 0.95, alpha: 1.00)
        tableView.register(EditProfileTableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.register(EditProfileDescriptionTableViewCell.self, forCellReuseIdentifier: "cell2")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        self.view.addSubview(tableView)
    }
    
    func setupConstraints() {
        profileImageView.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide).offset(20)
            make.centerX.equalTo(self.view.snp.centerX)
        }
        
        addPhotoButton.snp.makeConstraints { make in
            make.bottom.equalTo(profileImageView.snp.bottom)
            make.right.equalTo(profileImageView.snp.right).offset(-5)
            make.width.height.equalTo(self.view.frame.size.width / 10)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(profileImageView.snp.bottom).offset(20)
            make.centerX.equalTo(self.view.snp.centerX)
        }
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(20)
            make.left.right.equalTo(self.view).inset(20)
            make.bottom.equalTo(self.view)
        }
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
            
        guard let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else {
           // if keyboard size is not available for some reason, dont do anything
           return
        }
      
        tableView.snp.remakeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(20)
            make.left.right.equalTo(self.view).inset(20)
            make.bottom.equalTo(self.view).offset(-keyboardSize.height)
        }
    }

    @objc func keyboardWillHide(notification: NSNotification) {
        tableView.snp.remakeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(20)
            make.left.right.equalTo(self.view).inset(20)
            make.bottom.equalTo(self.view)
        }
        
    }
}

extension EditProfileViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! EditProfileTableViewCell
            cell.setupCell(text: "First Name")
            cell.textField.delegate = self
            cell.textField.tag = indexPath.row
            return cell
        } else if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! EditProfileTableViewCell
            cell.setupCell(text: "Last Name")
            cell.textField.delegate = self
            cell.textField.tag = indexPath.row
            return cell
        } else if indexPath.row == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! EditProfileTableViewCell
            cell.setupCell(text: "Birth Date")
            cell.textField.delegate = self
            cell.textField.tag = indexPath.row
            return cell
        } else if indexPath.row == 3 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! EditProfileTableViewCell
            cell.setupCell(text: "City")
            cell.textField.delegate = self
            cell.textField.tag = indexPath.row
            return cell
        } else if indexPath.row == 4 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! EditProfileTableViewCell
            cell.label.removeFromSuperview()
            cell.textField.delegate = self
            cell.textField.tag = indexPath.row
            let phone = UIImageView()
            phone.image = UIImage(systemName: "phone.fill")
            phone.tintColor = .black
            cell.contentView.addSubview(phone)
            
            phone.snp.makeConstraints { make in
                make.top.equalTo(cell.contentView).offset(10)
                make.left.equalTo(cell.contentView).offset(10)
            }
            
            cell.textField.snp.remakeConstraints { make in
                make.bottom.equalTo(phone.snp.bottom)
                make.left.equalTo(phone.snp.right).offset(80)
                make.right.equalTo(cell.contentView).offset(-10)
            }
            return cell
        } else  {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell2") as! EditProfileDescriptionTableViewCell
            cell.descriptionTextField.delegate = self
            cell.descriptionTextField.tag = indexPath.row
            return cell
        }
    }
}

extension EditProfileViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField.tag + 1 < 6 {
            if textField.tag + 1 == 5 {
                tableView.scrollToRow(at: [0,textField.tag + 1], at: .top, animated: true)
                let cell = tableView.cellForRow(at: [0,textField.tag + 1]) as! EditProfileDescriptionTableViewCell
                cell.descriptionTextField.becomeFirstResponder()
            } else {
                tableView.scrollToRow(at: [0,textField.tag + 1], at: .top, animated: true)
                let cell = tableView.cellForRow(at: [0,textField.tag + 1]) as! EditProfileTableViewCell
                cell.textField.becomeFirstResponder()
            }
        } else {
            if textField.tag == 5 {
                let cell = tableView.cellForRow(at: [0,textField.tag]) as! EditProfileDescriptionTableViewCell
                cell.descriptionTextField.resignFirstResponder()
                
            } else {
                let cell = tableView.cellForRow(at: [0,textField.tag]) as! EditProfileTableViewCell
                cell.textField.resignFirstResponder()
            }
        }
        
        return true
    }
}
