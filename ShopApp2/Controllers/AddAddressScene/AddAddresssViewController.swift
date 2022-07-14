//
//  AddAddresssViewController.swift
//  ShopApp2
//
//  Created by Aleksandar Micevski on 10.2.22.
//

import UIKit
protocol AddAdressProtocol {
    func saveAddress(adress: String, city: String, postalCode: String, country: String)
}

class AddAddresssViewController: UIViewController {

    var delegate: AddAdressProtocol?
    var navbar: NavigationView!
    var tableView: UITableView!
    var saveAddressButton: UIButton!
    let numberToolbar: UIToolbar = UIToolbar()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupViews()
        setupConstraints()
        
        NotificationCenter.default.addObserver(self, selector: #selector(ChatViewController.keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
         
        NotificationCenter.default.addObserver(self, selector: #selector(ChatViewController.keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    func setupViews() {
        numberToolbar.barStyle = UIBarStyle.default
        numberToolbar.items=[UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(numberPadDoneAction))]
        numberToolbar.sizeToFit()

           
        
        navbar = NavigationView()
        navbar.configure(title: "Delivery Address", backButton: true)
        navbar.delegate = self
        navbar.cartButton.removeFromSuperview()
        self.view.addSubview(navbar)
        
        tableView = UITableView()
        tableView.backgroundColor = .clear
        tableView.register(AddAddressTableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .systemGray6
        self.view.addSubview(tableView)
        
        saveAddressButton = UIButton()
        saveAddressButton.setTitle("Save Adress", for: .normal)
        saveAddressButton.tintColor = .white
        saveAddressButton.backgroundColor = .black
        saveAddressButton.layer.borderColor = UIColor.black.cgColor
        saveAddressButton.layer.borderWidth = 1
        saveAddressButton.layer.cornerRadius = 10
        saveAddressButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 25)
        saveAddressButton.addTarget(self, action: #selector(saveAddressAction), for: .touchUpInside)
        self.view.addSubview(saveAddressButton)
    }
    
    func setupConstraints() {
        navbar.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide)
            make.left.right.equalTo(self.view)
            make.height.equalTo(self.view).dividedBy(12)
        }
        
        saveAddressButton.snp.makeConstraints { make in
            make.bottom.equalTo(self.view.safeAreaLayoutGuide).offset(-40)
            make.left.right.equalTo(self.view).inset(20)
        }
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(navbar.snp.bottom).offset(20)
            make.left.right.equalTo(self.view).inset(20)
            make.bottom.equalTo(saveAddressButton.snp.top).offset(20)
        }
        
    }
    
    @objc func numberPadDoneAction() {
        let phoneCell = self.tableView.cellForRow(at: IndexPath(row: 2, section: 0)) as! AddAddressTableViewCell
        let postalCodeCell = self.tableView.cellForRow(at: IndexPath(row: 6, section: 0)) as! AddAddressTableViewCell
        
        if phoneCell.textField.isFirstResponder {
            phoneCell.textField.resignFirstResponder()
            let addressCell = self.tableView.cellForRow(at: IndexPath(row: 3, section: 0)) as! AddAddressTableViewCell
            addressCell.textField.becomeFirstResponder()
            tableView.scrollToRow(at: [0,addressCell.textField.tag], at: .top, animated: true)
        } else {
            postalCodeCell.textField.resignFirstResponder()
        }
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
            
        guard let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else {
           // if keyboard size is not available for some reason, dont do anything
           return
        }
      
        tableView.snp.remakeConstraints { make in
            make.top.equalTo(navbar.snp.bottom).offset(20)
            make.left.right.equalTo(self.view).inset(20)
            make.bottom.equalTo(self.view).offset(-keyboardSize.height)
        }
    }

    @objc func keyboardWillHide(notification: NSNotification) {
        tableView.snp.remakeConstraints { make in
            make.top.equalTo(navbar.snp.bottom).offset(20)
            make.left.right.equalTo(self.view).inset(20)
            make.bottom.equalTo(saveAddressButton.snp.top).offset(20)
        }
        
    }
    
    @objc func saveAddressAction() {
        let addressCell = self.tableView.cellForRow(at: IndexPath(row: 3, section: 0)) as! AddAddressTableViewCell
        let addressText = addressCell.textField.text
        
        let countryCell = self.tableView.cellForRow(at: IndexPath(row: 4, section: 0)) as! AddAddressTableViewCell
        let countryText = countryCell.textField.text

        let cityCell = self.tableView.cellForRow(at: IndexPath(row: 5, section: 0)) as!
        AddAddressTableViewCell
        let cityText = cityCell.textField.text

        let postalCodeCell = self.tableView.cellForRow(at: IndexPath(row: 6, section: 0)) as!
        AddAddressTableViewCell
        let postalCodeText = postalCodeCell.textField.text
        
        delegate?.saveAddress(adress: addressText!, city: cityText!, postalCode: postalCodeText!, country: countryText!)
        
        self.navigationController?.popViewController(animated: true)
    }

}

extension AddAddresssViewController: NavigationViewDelegate {
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

extension AddAddresssViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! AddAddressTableViewCell
        cell.textField.delegate = self
        cell.textField.tag = indexPath.row
        
        if indexPath.row == 0 {
            cell.setupCell(cellName: "First Name")
        } else if indexPath.row == 1 {
            cell.setupCell(cellName: "Last Name")
        } else if indexPath.row == 2 {
            cell.setupCell(cellName: "Phone Number")
            cell.textField.keyboardType = .numberPad
            cell.textField.inputAccessoryView = numberToolbar
        } else if indexPath.row == 3 {
            cell.setupCell(cellName: "Address")
        } else if indexPath.row == 4 {
            cell.setupCell(cellName: "Country")
        } else if indexPath.row == 5 {
            cell.setupCell(cellName: "City")
        } else {
            cell.setupCell(cellName: "Postal Code")
            cell.textField.keyboardType = .numberPad
            cell.textField.inputAccessoryView = numberToolbar
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension

    }
    
}

extension AddAddresssViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField.tag + 1 < 7 {
            tableView.scrollToRow(at: [0,textField.tag + 1], at: .top, animated: true)
            let cell = tableView.cellForRow(at: [0,textField.tag + 1]) as! AddAddressTableViewCell
            cell.textField.becomeFirstResponder()
        } else {
            let cell = tableView.cellForRow(at: [0,textField.tag]) as! AddAddressTableViewCell
            cell.textField.resignFirstResponder()
        }
        
        return true
    }
}
